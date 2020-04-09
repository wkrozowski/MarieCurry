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
    isCorrectType (PairT s t) = isCorrectType s && isCorrectType t
    isCorrectType (EmptyListT) = True

    isList :: Type -> Bool
    isList (ListT t) = True
    isList _ = False

    isPair :: Type -> Bool
    isPair (PairT p q) = True
    isPair _ = False

    envLookup :: String -> Gamma -> Maybe Type
    envLookup varName env = pure snd <*> (find (\x-> fst x == varName) env)

    compareTypes :: Type -> Type -> Bool
    compareTypes p q
        | p == q = True
    compareTypes EmptyListT (ListT _) = True
    compareTypes (ListT _) (EmptyListT) = True
    compareTypes (ListT p) (ListT q) = (compareTypes p q)
    compareTypes (PairT p q) (PairT r s) = (compareTypes p r) && (compareTypes q s)
    compareTypes (ArrowT p q) (ArrowT r s) = (compareTypes p r) && (compareTypes q s)
    compareTypes _ _ = False

    check :: Stmt -> Gamma -> Type
    check (BoolVal _) _ = BoolT

    check (NumVal _) _ = IntT

    check (StringVal _) _ = ListT CharT

    check (PairVal lhs rhs) env = PairT (check lhs env) (check rhs env) 

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
        | otherwise = throw (TypeException "You cannot intialise streams with value which isn't a number")

    check (ConsumeStream v) env
        | (check v env == IntT) = IntT
        | otherwise = throw (TypeException "You cannot consume from stream with id which isn't a number")

    check (WhileStmt cond body) env
        | (check cond env == BoolT) && (isCorrectType (check body env)) = VoidT
        | otherwise = throw (TypeException "Type error in while expression")

    check (AssignmentStmt name val) env
        | compareTypes (check (Variable name) env) ( check val env) = VoidT
        | isList (check (Variable name) env) && (check val env == EmptyListT) = VoidT
        | otherwise = throw (TypeException ("Type mismatch while assigning value to variable: " ++ show (check (Variable name) env) ++ " !=" ++ show (check val env)) )

    check (IfStmt cond branch) env
        | check cond env == BoolT = check branch env
        | otherwise = throw (TypeException "Condition of if statement is a non-boolean value")

    check (IfStmtElse cond trueBranch falseBranch) env
        | check cond env == BoolT && (check trueBranch env)==(check falseBranch env) = (check trueBranch env)
        | check cond env == BoolT && isList (check trueBranch env) && (check falseBranch env)==EmptyListT = (check trueBranch env)
        | check cond env == BoolT && isList (check falseBranch env) && (check trueBranch env)==EmptyListT = (check falseBranch env)
        | check cond env == BoolT && (isCorrectType (check trueBranch env)) && (isCorrectType (check falseBranch env)) = StmtT
        | check cond env /= BoolT = throw (TypeException "Condition of the if-then-else expression is not a boolean")
        | otherwise = throw (TypeException "Branches of if-then-else expression have not matching types")

    check (PrintOp v) env
        | isCorrectType (check v env) = VoidT

    check (ThrowStmt _) env = VoidT

    check (TryCatchStmt tested _ handler) env
        | isCorrectType (check tested env) && isCorrectType (check handler env) = StmtT
        | isCorrectType (check tested env) = throw (TypeException "Error in catch part of try-catch exception")
        | otherwise = throw (TypeException "Error in try part of try-catch exception")

    check (AddOp lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT = IntT
        | check lhs env == IntT = throw (TypeException "Right hand side of addition is not an int")
        | check rhs env == IntT = throw (TypeException "Left hand side of addition is not an int")
        | otherwise = throw (TypeException "Both sides of addition have wrong types")

    check (LessThanOp lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT  = BoolT
        | check lhs env == IntT = throw (TypeException "Right hand side of lt operation is not an int")
        | check rhs env == IntT = throw (TypeException "Left hand side of lt operation is not an int")
        | otherwise = throw (TypeException "Both sides of lt operation have wrong types")

    check (LessThanEqOp lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT = BoolT
        | check lhs env == IntT = throw (TypeException "Right hand side of lt or eq operation is not an int")
        | check rhs env == IntT = throw (TypeException "Left hand side of lt or eq operation is not an int")
        | otherwise = throw (TypeException "Both sides of lt or eq operation have wrong types")

    check (GreaterThanOp  lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT = BoolT
        | check lhs env == IntT = throw (TypeException "Right hand side of gt operation is not an int")
        | check rhs env == IntT = throw (TypeException "Left hand side of gt operation is not an int")
        | otherwise = throw (TypeException "Both sides of gt operation have wrong types")

    check (GreaterThanEqOp  lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT = BoolT
        | check lhs env == IntT = throw (TypeException "Right hand side of gt or eq operation is not an int")
        | check rhs env == IntT = throw (TypeException "Left hand side of gt or eq operation is not an int")
        | otherwise = throw (TypeException "Both sides of gr or eq operation have wrong types")

    check (SubtractOp lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT = IntT
        | check lhs env == IntT = throw (TypeException "Right hand side of subtraction is not an int")
        | check rhs env == IntT = throw (TypeException "Left hand side of subtraction is not an int")
        | otherwise = throw (TypeException "Both sides of subtraction have wrong types")

    check (MultiplyOp lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT = IntT
        | check lhs env == IntT = throw (TypeException "Right hand side of multiplication is not an int")
        | check rhs env == IntT = throw (TypeException "Left hand side of multiplication is not an int")
        | otherwise = throw (TypeException "Both sides of multiplication have wrong types")

    check (ModuloOp lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT = IntT
        | check lhs env == IntT = throw (TypeException "Right hand side of modulo is not an int")
        | check rhs env == IntT = throw (TypeException "Left hand side of modulo is not an int")
        | otherwise = throw (TypeException "Both sides of modulo have wrong types")

    check (DivideOp lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT = IntT
        | check lhs env == IntT = throw (TypeException "Right hand side of division is not an int")
        | check rhs env == IntT = throw (TypeException "Left hand side of division is not an int")
        | otherwise = throw (TypeException "Both sides of division have wrong types")

    check (EqualOp  lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT = BoolT
        | check lhs env == BoolT && check rhs env == BoolT = BoolT
        | check lhs env == StringT && check rhs env == StringT = BoolT
        | otherwise = throw (TypeException "Type mismatch in comparision operator")

    check (NotEqualOp  lhs rhs) env
        | check lhs env == IntT && check rhs env == IntT = BoolT
        | check lhs env == BoolT && check rhs env == BoolT = BoolT
        | otherwise = throw (TypeException "Type mismatch in not-equals operator")

    check (OrOp  lhs rhs) env
        | check lhs env == BoolT && check rhs env == BoolT = BoolT
        | check lhs env == BoolT = throw (TypeException "Right hand side of logical or is not a bool")
        | check rhs env == BoolT = throw (TypeException "Left hand side of logical or is not a bool")
        | otherwise = throw (TypeException "Both sides of logical or have wrong types")

    check (AndOp  lhs rhs) env
        | check lhs env == BoolT && check rhs env == BoolT = BoolT
        | check lhs env == BoolT = throw (TypeException "Right hand side of logical and is not a bool")
        | check rhs env == BoolT = throw (TypeException "Left hand side of logical andr is not a bool")
        | otherwise = throw (TypeException "Both sides of logical and have wrong types")

    check (NegateOp v) env
        | check v env == IntT = IntT
        | otherwise = throw (TypeException "Trying to negate a value which is not a number")

    check (NotOp v) env
        | check v env == BoolT = BoolT
        | otherwise = throw (TypeException "Trying to perform logical not on a value which is not a boolean")

    check (UnitVal) env = UnitT

    check (EmptyListVal) env = EmptyListT

    check (ReturnOp v) env = check v env

    check (HeadOp EmptyListVal) env = throw (TypeException "Consuming from empty list - cannot deduce type")

    check (HeadOp x) env
        | isList (check x env) =let (ListT t)=(check x env) in t
        | otherwise = throw (TypeException "Taking head of value which isn't a list")

    check (TailOp EmptyListVal) env = throw (TypeException "Taking tail of empty list")

    check (TailOp x) env
        | isList typeOfX = typeOfX
        | otherwise = throw (TypeException "Trying to take a tail from value which is not a list")
            where
                typeOfX = (check x env)
        

    check (IsEmptyOp EmptyListVal) env = BoolT

    check (IsEmptyOp x) env | isList (check x env) = BoolT

    check (LamExpr t x stmt) env = ArrowT t (check stmt ((x,t):env))

    check (Application e1 e2) env = case e1Type of
        (ArrowT t u) -> if (e2Type==t) then u else
            if (e2Type==EmptyListT) && (isList t) then u else throw (TypeException "Type mismatch when applying function")
        _ -> throw (TypeException "Cannot apply value to non-function")
        where
            e1Type = check e1 env
            e2Type = check e2 env

    check (ConsOp lhs EmptyListVal) env | isCorrectType (check lhs env) = ListT (check lhs env)
    check (ConsOp lhs rhs) env
        | ListT (check lhs env) == (check rhs env) = (check rhs env)
        | isCorrectType (check lhs env) && (check rhs env)== EmptyListT = ListT (check lhs env)
        | otherwise = throw (TypeException "Type error in list constructor")

    check (First x) env
     | isPair (check x env) = let (PairT t1 t2)=(check x env) in t1
     | otherwise = throw (TypeException "Taking fst of a value which is not a tuple")

    check (Second x) env
     | isPair (check x env) = let (PairT t1 t2)=(check x env) in t1
     | otherwise = throw (TypeException "Taking snd of a value which is not a tuple")

    check _ env = throw (TypeException "type error")
