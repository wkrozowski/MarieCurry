module TypeCheck(Identifier, Gamma, check, Stmt) where

    import MCLexer
    import MCParser
    import Control.Exception
    import Data.List


    -- makeStrict (a, b) = seq a (seq b (a, b))

    type Identifier = (String, Type)
    type Gamma = [Identifier]

    data CheckerException = TypeException String deriving (Show)
    instance Exception CheckerException

    isCorrectType :: Type -> Bool
    isCorrectType (IntT) = True
    isCorrectType (BoolT) = True
    isCorrectType (StmtT) = True
    isCorrectType (VoidT) = True


    envLookup :: String -> Gamma -> Maybe Type
    envLookup varName env = pure snd <*> (find (\x-> fst x == varName) env)

    check :: Stmt -> Gamma -> Type
    check (BoolVal _) _ = BoolT

    check (NumVal _) _ = IntT

    check (Variable name) env = case envLookup name env of
            Just n -> n
            _ -> throw (TypeException "undefined type")

    check (Stmt (Declaration varType varName) rest) env 
        | isCorrectType (check (rest) ((varName, varType):env)) = StmtT

    check (Stmt p q) env
        | isCorrectType (check p env) && isCorrectType (check q env) = StmtT

    check (Streams v) env 
        | (check v env == IntT) = VoidT

    check (ConsumeStream v) env
        | (check v env == IntT) = IntT

    check (WhileStmt cond body) env
        | (check cond env == BoolT) && (isCorrectType (check body env)) = VoidT

    check (AssignmentStmt name val) env
        | check (Variable name) env == check val env = VoidT
        | otherwise = throw (TypeException "Type mismatch while assigning value to variable")
        
    check (IfStmt cond branch) env
        | check cond env == BoolT = check branch env

    check (IfStmtElse cond trueBranch falseBranch) env
        | check cond env == BoolT && lhsType == rhsType = lhsType
            where
                lhsType = check trueBranch env
                rhsType = check falseBranch env

    check (PrintOp v) env
        | (check v env) == IntT = VoidT
        | (check v env) == BoolT = VoidT

    check (ThrowStmt _) env = VoidT

    check (TryCatchStmt tested _ handler) env
        | isCorrectType (check tested env) && isCorrectType (check handler env) = StmtT

    check (AddOp lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT = IntT

    check (LessThanOp lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT = BoolT

    check (LessThanEqOp lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT = BoolT

    check (GreaterThanOp  lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT = BoolT

    check (GreaterThanEqOp  lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT = BoolT

    check (SubtractOp lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT = IntT

    check (MultiplyOp lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT = IntT

    check (ModuloOp lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT = IntT

    check (DivideOp lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT = IntT
                
    check (EqualOp  lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT = BoolT
        | check lhs env == BoolT && check rhs env == BoolT = BoolT

    check (NotEqualOp  lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT = BoolT
        | check lhs env == BoolT && check rhs env == BoolT = BoolT    

    check (OrOp  lhs rhs) env
        | check lhs env == BoolT && check rhs env == BoolT = BoolT    

    check (AndOp  lhs rhs) env
        | check lhs env == BoolT && check rhs env == BoolT = BoolT   

    check (NegateOp v) env
        | check v env == IntT = IntT

    check (NotOp v) env
        | check v env == BoolT = BoolT

    check _ _ = throw (TypeException "Type error")