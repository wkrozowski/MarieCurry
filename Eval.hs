--e ::= v | x | e op e
--    | while (e) e | if (e) then e else e
--    | var x = e; e | x = e | e; e
--    | v
--v ::= n | true | false | loc

import qualified Data.Map as Map
import System.IO (isEOF)

type Environment = Map.Map String Address
type Store = Map.Map Address Code
type Address = Int
type Buffer = [[Int]]

data ExceptionType =
      NullPointerException
    | StreamsNotInitialisedException
    | NotExistingStreamConsumptionException
    | DivdeByZeroException
    | TrapException
         deriving (Eq, Show)


data OpType = Add | LessThan deriving (Eq, Show)
data Code =   Null 
            | Void 
            | Exception ExceptionType
            | Number Int 
            | Boolean Bool
            | Location Address
            | Reference String
            | While Code Code
            | If Code Code Code
            | Definition String
            | Assignment String Code
            | Statement Code Code
            | InitStreams Int
            | Consume Int
            | Print Code
            | Throw ExceptionType
            | TryCatch ExceptionType Code Code
            | BinOp OpType Code Code deriving (Show, Eq)
data Frame = Branch Code Code Environment | Then Code Environment | EvalRight OpType Code Environment | EvalOp OpType Code Environment | Assign String Environment | EvalPrint Environment | ExceptionHandler ExceptionType Code Environment deriving (Show)
type Kontinuation = [Frame]

type State = (Code, Environment, Store, Kontinuation, Buffer)

isValue :: Code -> Bool
isValue (Void) = True
isValue (Number _) = True
isValue (Boolean _) = True
isValue (Location _) = True
isValue _ = False

inject :: Code -> State
inject code = (code, Map.empty, Map.empty, [], [])

step :: State -> IO (State)

-- Define new varaible by allocating location for it, adding definition to environemnt and setting store to null
step ((Statement (Definition name) e2), env, store, kontinuation, buffer) = return (e2, newEnv, newStore, kontinuation,buffer)
    where 
        newLocation = (freshLocation store)
        newEnv = Map.insert name newLocation env
        newStore = Map.insert newLocation (Null) store

-- If executing a statement e1;e2 - save the environment and e2 on the stack and execute e1
step ((Statement e1 e2), env, store, kontinuation, buffer) = return (e1, env, store, (Then e2 env):kontinuation, buffer)

-- If e1 has terminated, then restore environment and execute e2
step (v, env1, store, (Then e2 env2):kontinuation, buffer) 
    | isValue v =  return (e2, env2, store, kontinuation, buffer)

-- When executing If statement - save the environment and both branches in the continuation and evaluate the condition first
step ((If cond lhs rhs), env, store, kontinuation, buffer) = return (cond, env, store, (Branch lhs rhs env):kontinuation, buffer)

-- If condition evaluated to true, perform jumping to the right branchVoid
step (v, env1, store, (Branch lhs rhs env2):kontinuation, buffer) 
    | isValue v = case v of
        (Boolean True) -> return (lhs, env2, store, kontinuation, buffer)
        (Boolean False) -> return (rhs, env2, store, kontinuation, buffer)
        _ -> error "not a boolean"

-- Desugars while expression into if statement
step (whileExp@(While condition exp), env, store, kontinuation, buffer) = return ((If condition (Statement exp whileExp) (Void)), env, store, kontinuation, buffer)

-- Lookup location of a reference type
step(Reference variableName, env, store, kontinuation, buffer)
    | lookupResult == Nothing = error "dereferencing not existent variable"
    | otherwise = let (Just v)=lookupResult in
        return (v, env, store, kontinuation, buffer) 
    where lookupResult = (Map.lookup variableName env)>>= (\x -> Map.lookup x store)

-- Defining at the end doesnt do anyting
step((Definition _ ), env, store, kontinuation, buffer) = return (Void,env,store,kontinuation, buffer)


-- For mutation - first evaluate expression to value
step (Assignment name expr, env, store, kontinuation, buffer) = return (expr, env, store, (Assign name env):kontinuation, buffer)

-- Mutation of evaluated location

step (val, env2, store, (Assign name env):kontinuation, buffer)
    | lookupResult == Nothing = error "trying to mutate not existing variable"
    | isValue val  = let (Just location)=lookupResult in
            return (Void, env, Map.insert location val store, kontinuation, buffer)
        where
            lookupResult = Map.lookup name env
    
-- When printing something first evaluate it and save the environment
step ((Print e), env, store, kontinuation, buffer) = return (e, env, store, (EvalPrint env):kontinuation, buffer)

-- After evaluating it perform side effect and return Void
step (v, env2, store, (EvalPrint env):kontinuation, buffer) | isValue v = 
    do
        putStrLn $ valueToString $ v
        return (Void, env, store, kontinuation, buffer)

-- When seeing the binary operation evaluate left hand side and then save rhs, opeartion type and environment to the stack
step ((BinOp operation lhs rhs), env, store, kontinuation, buffer) = return (lhs, env, store, (EvalRight operation rhs env):kontinuation, buffer)

-- After evaluating the lhs, save result of lhs, restore environment and evaluate rhs

step (v, env2, store, (EvalRight operation rhs env1):kontinuation, buffer) 
    | isValue v = return (rhs, env1, store, (EvalOp operation v env1):kontinuation, buffer)

-- After evaluating rhs, perform the operation
step (rhs, env2, store, (EvalOp operation v env1):kontinuation, buffer) 
    | isValue v = return ((evalBinop operation v rhs),env1,store,kontinuation, buffer)
  
step (Null, _,_,_, _) = error "Null pointer exception"

-- Initialise buffers with empty values
step (InitStreams numberOfStreams, env, store, kontinuation, buffer) = return (Void, env, store, kontinuation, take numberOfStreams $ repeat [])

-- Main stream operation function - when something is stored in buffer, fetch it - otherwise just read whole new line and feed it to buffer and recursively feed it to yourself
step (Consume no, env, store, kontinuation, buffer)
    -- In the future add error checking whether the buffer number is bigger then initial number of buffers (interplay with initBuffer operation)
    | buffer == [] = error "Buffer not initialised"
    | no > length buffer = error "Trying to consume from non existent stream" 
    -- If the buffer for given stream is empty, then try fetching a new line
    | isStreamEmpty no buffer = do
        done<-isEOF
        if done then 
            -- Go to halting state
            return (Void, env, store, [], buffer)
        else do
            -- Otherwise fetch a new line
            input<- getLine
            return (Consume no, env, store, kontinuation, appendToBuffer (processInputLine input) buffer)
    -- If buffer is not empty, then just fetch from it
    | otherwise = return (Number contents, env, store, kontinuation, newBuffer) 
        where
            contents = fst consumeResult
            newBuffer = snd consumeResult
            consumeResult = consumeStream no buffer 

-- Throwing an exception
step (Throw exType, env, store, kontinuation, buffer) = return (Exception exType, env, store, kontinuation, buffer)

-- Reached top of the stack - no exception handler
step (Exception exType, _, _, [], _) = error ("Unhandled exception : " ++ show exType)

-- Register an exception handler
step ((TryCatch exType try catch),env,store,kontinuation, buffer) = return (try, env, store, (ExceptionHandler exType catch env):kontinuation, buffer)

-- Finished evaluation inside of an exception handler - no error
step (v , env2, store, (ExceptionHandler exType catch env):kontinuation, buffer) | isValue v =  return (Void, env, store, kontinuation, buffer)

-- There is an exception, and the handler is correct
step (Exception exType, env2, store, (ExceptionHandler handlerExType catch env):kontinuation, buffer) | exType == handlerExType = return (catch, env, store, kontinuation, buffer)

-- There is an exception, but the correct handler is not present
step (ex@(Exception _), env, store, _:kontinuation, buffer) = return (ex, env, store, kontinuation, buffer)

-- For terminal states, evaluated to value, no continuation, just return itself
step state@(v, _, _, [], _) | isValue v = return state

step _ = error "not implemented yet"

-- Core function for evaluating binary operations
evalBinop Add (Number m) (Number n) = (Number (n+m))
evalBinop LessThan (Number m) (Number n) = (Boolean (m<n))
evalBinop _ _ _ = error "not valid"

-- Allows printing values to output stream
valueToString :: Code -> String
valueToString (Number n) = show n
valueToString (Boolean True) = "True"
valueToString (Boolean False) = "False"
valueToString _ = error "inpossible to print"

-- Is it a terminals state
isTerminal :: State -> Bool
isTerminal (v, _, _, [], _) | isValue v = True
isTerminal _ = False

-- If terminal state, then stop and return it, otherwise perform small step evaluation and recursively call itself
evalLoop :: State -> IO (State)
evalLoop s = if isTerminal s then (return s) else (step s)>>=evalLoop

runProgram :: Code -> IO ()
runProgram code = do
    evalLoop $ inject $ code
    return ()

freshLocation :: (Num a, Enum a, Ord a) => Map.Map a b -> a
freshLocation map =  head ([x| x<-[0..], not (Map.member x map)])

processInputLine ::  String -> [Int]
processInputLine = \x ->  map (read) (splitOn ' ' x) :: [Int]

splitOn :: Char -> String -> [String]
splitOn c [] = []
splitOn c ls = (takeWhile (/=c) ls) : splitOn' c (dropWhile (/=c) ls)
 where splitOn' c [] = []
       splitOn' c (x:[]) | x==c = [[]]
       splitOn' c (x:xs) | x==c = splitOn c xs
                         | otherwise = []

appendToBuffer :: [Int] -> [[Int]] -> [[Int]]
appendToBuffer [] xss = xss
appendToBuffer (x:xs) [] = [x] : (appendToBuffer xs [])
appendToBuffer (x:xs) (ys:yss) = (ys++[x]):(appendToBuffer xs yss)

isStreamEmpty :: Int -> [[Int]] -> Bool
isStreamEmpty 0 (xs:xss) |  xs == [] = True
                         | otherwise = False
isStreamEmpty n (xs:xss) = isStreamEmpty (n-1) (xss) 
isStreamEmpty _ _ = True

appendAtFront :: (Int,[[Int]]) -> [Int] -> (Int,[[Int]]) 
appendAtFront (num, xss) xs = (num, xs:xss)

consumeStream :: Int -> [[Int]] -> (Int,[[Int]])
consumeStream 0 (xs:xss) = (head xs, (tail xs):xss)
consumeStream n (xs:xss) = appendAtFront (consumeStream (n-1) (xss)) xs
consumeStream _ _ = error "cannot consume from empty stream"

-- Runs the code for the hardcoded first task
main :: IO ()
main = do 
    runProgram $ Statement (InitStreams 2) (While (Boolean True) (Statement (Statement (Print (Consume 0)) (Print (Consume 0))) (Print (Consume 1))))
    return ()