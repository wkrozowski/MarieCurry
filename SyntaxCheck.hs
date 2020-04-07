module SyntaxCheck where
import MCLexer

checkSyntax :: [Token] -> [Token] -> [Token]
-- base case
checkSyntax [] c = c

-- special patterns
checkSyntax (e1@(MkToken _ TokenIf) : e2@(MkToken _ TokenLParen) : nc) c = checkSyntax ([e2] ++ nc) (c ++ [e1])
checkSyntax (e1@(MkToken _ TokenIf) : _ : nc) c = missing "(" e1 (line e1) (column e1)

checkSyntax (e1@(MkToken _ TokenWhile) : e2@(MkToken _ TokenLParen) : nc) c = checkSyntax ([e2] ++ nc) (c ++ [e1])
checkSyntax (e1@(MkToken _ TokenWhile) : _ : nc) c = missing "(" e1 (line e1) (column e1)

checkSyntax (e1@(MkToken _ TokenElse) : e2@(MkToken _ TokenLCurly) : nc) c = checkSyntax ([e2] ++ nc) (c ++ [e1])
checkSyntax (e1@(MkToken _ TokenElse) : _ : nc) c = missing "{" e1 (line e1) (column e1)

checkSyntax (e1@(MkToken _ TokenTry) : e2@(MkToken _ TokenLCurly) : nc) c = checkSyntax ([e2] ++ nc) (c ++ [e1])
checkSyntax (e1@(MkToken _ TokenTry) : _ : nc) c = missing "{" e1 (line e1) (column e1)

checkSyntax (e1@(MkToken _ TokenSemiColon) : e2@(MkToken _ TokenRCurly) : nc) c = checkSyntax ([e2] ++ nc) (c ++ [e1])
checkSyntax (e1@(MkToken _ TokenSemiColon) : e2 : nc) c = checkPattern e1 e2 nc c



-- common patterns
checkSyntax (e1@(MkToken _ TokenReturn) : e2 : nc) c = checkPattern e1 e2 nc c
checkSyntax (e1@(MkToken _ TokenPrint) : e2 : nc) c = checkPattern e1 e2 nc c
checkSyntax (e1@(MkToken _ TokenConsume) : e2 : nc) c = checkPattern e1 e2 nc c
checkSyntax (e1@(MkToken _ TokenInitStreams) : e2 : nc) c = checkPattern e1 e2 nc c
checkSyntax (e1@(MkToken _ TokenHead) : e2 : nc) c = checkPattern e1 e2 nc c
checkSyntax (e1@(MkToken _ TokenTail) : e2 : nc) c = checkPattern e1 e2 nc c
checkSyntax (e1@(MkToken _ TokenIsEmpty) : e2 : nc) c = checkPattern e1 e2 nc c
checkSyntax (e1@(MkToken _ TokenThrow) : e2 : nc) c = checkPattern e1 e2 nc c
checkSyntax (e1@(MkToken _ TokenAdd) : e2 : nc) c = checkPattern e1 e2 nc c
checkSyntax (e1@(MkToken _ TokenDivide) : e2 : nc) c = checkPattern e1 e2 nc c
checkSyntax (e1@(MkToken _ TokenMultiply) : e2 : nc) c = checkPattern e1 e2 nc c
checkSyntax (e1@(MkToken _ TokenEq) : e2 : nc) c = checkPattern e1 e2 nc c
checkSyntax (e1@(MkToken _ TokenModulo) : e2 : nc) c = checkPattern e1 e2 nc c
checkSyntax (e1@(MkToken _ TokenLogicalEq) : e2 : nc) c = checkPattern e1 e2 nc c
checkSyntax (e1@(MkToken _ TokenSubtract) : e2 : nc) c = checkPattern e1 e2 nc c
checkSyntax (e1@(MkToken _ TokenNotEq) : e2 : nc) c = checkPattern e1 e2 nc c
checkSyntax (e1@(MkToken _ TokenLessThan) : e2 : nc) c = checkPattern e1 e2 nc c
checkSyntax (e1@(MkToken _ TokenGreaterThan) : e2 : nc) c = checkPattern e1 e2 nc c
checkSyntax (e1@(MkToken _ TokenGreaterThanEq) : e2 : nc) c = checkPattern e1 e2 nc c
checkSyntax (e1@(MkToken _ TokenLessThanEq) : e2 : nc) c = checkPattern e1 e2 nc c

-- base case
checkSyntax (tk:nc) c = checkSyntax nc (c ++ [tk])


checkPattern :: Token -> Token -> [Token] -> [Token] -> [Token]
checkPattern e1 e2 nc c
  | extractTokenClass e2 == TokenSemiColon = unexpected e2 e1 (line e2) (column e2)
  | extractTokenClass e2 == TokenRParen = unexpected e2 e1 (line e2) (column e2)
  | extractTokenClass e2 == TokenRCurly = unexpected e2 e1 (line e2) (column e2)
  | extractTokenClass e2 == TokenLCurly = unexpected e2 e1 (line e2) (column e2)
  | otherwise = checkSyntax ([e2] ++ nc) (c ++ [e1])



extractTokenClass :: Token -> TokenClass
extractTokenClass (MkToken _ x) = x

unexpected :: Token -> Token -> Int -> Int -> a
unexpected unexpectedTk afterTk li col =  errorWithoutStackTrace ("Unexpected '" ++ (tokenToString unexpectedTk) ++ "' after '"++ (tokenToString afterTk)++"' at line: " ++ (show li)  ++ " column: " ++ (show col) )

missing :: String -> Token -> Int -> Int -> a
missing missingTk afterTk li col =  errorWithoutStackTrace ("Missing '"++ missingTk ++"' after '"++ (tokenToString afterTk) ++"' at line: " ++ (show li) ++ " column: " ++ (show  col))

tokenToString :: Token -> String
tokenToString (MkToken _ TokenIf)= "if"
tokenToString (MkToken _ TokenWhile)= "while"
tokenToString (MkToken _ TokenElse)= "else"
tokenToString (MkToken _ TokenEq)= "="
tokenToString (MkToken _ TokenAdd)= "+"
tokenToString (MkToken _ TokenLCurly)= "{"
tokenToString (MkToken _ TokenRCurly)= "}"
tokenToString (MkToken _ TokenLSquare)= "["
tokenToString (MkToken _ TokenRSquare)= "]"
tokenToString (MkToken _ TokenLParen)= "("
tokenToString (MkToken _ TokenRParen)= ")"
tokenToString (MkToken _ TokenColon)= ":"
tokenToString (MkToken _ TokenSemiColon)= ";"
tokenToString (MkToken _ TokenLessThan)= "<"
tokenToString (MkToken _ TokenGreaterThan)= ">"
tokenToString (MkToken _ TokenLessThanEq)= "<="
tokenToString (MkToken _ TokenGreaterThanEq)= ">="
tokenToString (MkToken _ TokenLogicalEq)= "=="
tokenToString (MkToken _ TokenNotEq)= "!="
tokenToString (MkToken _ TokenLogicalNot)= "!"
tokenToString (MkToken _ TokenLogicalAnd)= "&&"
tokenToString (MkToken _ TokenLogicalOr)= "||"
tokenToString (MkToken _ TokenDivide)= "/"
tokenToString (MkToken _ TokenMultiply)= "*"
tokenToString (MkToken _ TokenSubtract)= "-"
tokenToString (MkToken _ TokenModulo)= "%"
tokenToString (MkToken _ TokenCatch)= "catch"
tokenToString (MkToken _ TokenTry)= "try"
tokenToString (MkToken _ TokenThrow)= "throw"
tokenToString (MkToken _ (TokenNum x))= "number" ++ (show x)
tokenToString (MkToken _ TokenTInt)= "int"
tokenToString (MkToken _ (TokenBool x))= "boolean" ++ (show x)
tokenToString (MkToken _ TokenTBool)= "bool"
tokenToString (MkToken _ TokenVoid)= "void"
tokenToString (MkToken _ (TokenVar x))= "variable" ++ (show x)
tokenToString (MkToken _ TokenPrint)= "print"
tokenToString (MkToken _ TokenHead)= "head"
tokenToString (MkToken _ TokenTail)= "tail"
tokenToString (MkToken _ TokenIsEmpty)= "isEmpty"
tokenToString (MkToken _ TokenCons)= "cons"
tokenToString (MkToken _ TokenConsume)= "consume"
tokenToString (MkToken _ TokenInitStreams)= "streams"
tokenToString (MkToken _ TokenLambda)= "\\"
tokenToString (MkToken _ TokenArrow)= "->"
tokenToString (MkToken _ TokenUnit)= "()"
tokenToString (MkToken _ TokenReturn)= "return"

line :: Token -> Int
line token = fst tokenPosition
  where
    tokenPosition = tokenPosn token

column :: Token -> Int
column token = snd tokenPosition
  where
    tokenPosition = tokenPosn token
