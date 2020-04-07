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
    isCorrectType (CharT) = True
    isCorrectType (StmtT) = True
    isCorrectType (VoidT) = True
    isCorrectType (StringT) = True
    isCorrectType (ArrowT l r) = (isCorrectType l) && (isCorrectType r)
    isCorrectType (UnitT) = True
    isCorrectType (ListT t) = isCorrectType t
    isCorrectType (EmptyListT) = True

    isList :: Type -> Bool
    isList (ListT t) = True
    isList _ = False

    envLookup :: String -> Gamma -> Maybe Type
    envLookup varName env = pure snd <*> (find (\x-> fst x == varName) env)

    check :: Stmt -> Gamma -> Type
    check (BoolVal _) _ = BoolT

    check (NumVal _) _ = IntT

    check (StringVal _) _ = ListT CharT

    check (Variable name) env = case envLookup name env of
            Just n -> n
            _ -> throw (TypeException "undefined type")

    check (Stmt (Declaration varType varName) (ReturnOp v)) env  = (check v ((varName, varType):env))

    check (Stmt (Declaration varType varName) p@(Stmt q r)) env  = (check p ((varName, varType):env))

    check (Stmt (Declaration varType varName) rest) env | isCorrectType (check (rest) ((varName, varType):env)) = StmtT

    check (Stmt p (ReturnOp v) ) env | isCorrectType (check p env) = check v env

    check (Stmt p q@(Stmt r s)) env | isCorrectType (check p env) = check q env

    check (Stmt p q) env | isCorrectType (check p env) && isCorrectType (check q env) = StmtT

    check (Streams v) env
        | (check v env == IntT) = VoidT

    check (ConsumeStream v) env
        | (check v env == IntT) = IntT

    check (WhileStmt cond body) env
        | (check cond env == BoolT) && (isCorrectType (check body env)) = VoidT

    check (AssignmentStmt name val) env
        | check (Variable name) env == check val env = VoidT
        | isList (check (Variable name) env) && (check val env == EmptyListT) = VoidT
        | otherwise = throw (TypeException "Type mismatch while assigning value to variable")

    check (IfStmt cond branch) env
        | check cond env == BoolT = check branch env

    check (IfStmtElse cond trueBranch falseBranch) env
        | check cond env == BoolT && (check trueBranch env)==(check falseBranch env) = (check trueBranch env)
        | check cond env == BoolT && isList (check trueBranch env) && (check falseBranch env)==EmptyListT = (check trueBranch env)
         | check cond env == BoolT && isList (check falseBranch env) && (check trueBranch env)==EmptyListT = (check falseBranch env)
        | check cond env == BoolT && (isCorrectType (check trueBranch env)) && (isCorrectType (check falseBranch env)) = StmtT

    check (PrintOp v) env
        | (check v env) == IntT = VoidT
        | (check v env) == BoolT = VoidT
        | (check v env) == ListT CharT = VoidT
        | (check v env) == CharT = VoidT

    check (ThrowStmt _) env = VoidT

    check (TryCatchStmt tested _ handler) env
        | isCorrectType (check tested env) && isCorrectType (check handler env) = StmtT

    check (AddOp lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT = IntT

    check (LessThanOp lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT  = BoolT

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
        | check lhs env == StringT && check rhs env == StringT = BoolT

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

    check (UnitVal) env = UnitT

    check (EmptyListVal) env = EmptyListT

    check (ReturnOp v) env = check v env

    check (HeadOp EmptyListVal) env = errorWithoutStackTrace "Consuming from empty list - cannot deduce type"

    check (HeadOp x) env =
        let (ListT t)=(check x env) in t

    check (TailOp EmptyListVal) env = errorWithoutStackTrace "Taking tail of empty list"

    check (TailOp x) env
        | isList typeOfX = typeOfX
            where
                typeOfX = (check x env)

    check (IsEmptyOp EmptyListVal) env = BoolT

    check (IsEmptyOp x) env | isList (check x env) = BoolT

    check (LamExpr t x stmt) env = ArrowT t (check stmt ((x,t):env))

    check (Application e1 e2) env = case e1Type of
        (ArrowT t u) -> if (e2Type==t) then u else
            if (e2Type==EmptyListT) && (isList t) then u else errorWithoutStackTrace "Type mismatch when applying function"
        _ -> errorWithoutStackTrace "Cannot apply value to non-function"
        where
            e1Type = check e1 env
            e2Type = check e2 env

    check (ConsOp lhs EmptyListVal) env | isCorrectType (check lhs env) = ListT (check lhs env)
    check (ConsOp lhs rhs) env
        | ListT (check lhs env) == (check rhs env) = (check rhs env)
        | isCorrectType (check lhs env) && (check rhs env)== EmptyListT = ListT (check lhs env)

    check _ env = errorWithoutStackTrace "Type error"
