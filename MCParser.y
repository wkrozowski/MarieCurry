{
module MCParser where
import MCLexer
}
%name parse
%tokentype { Token }
%error { parseError }


%token
      if              { MkToken _ TokenIf}
      while           { MkToken _ TokenWhile}
      else            { MkToken _ TokenElse}
      '='             { MkToken _ TokenEq}
      '+'             { MkToken _ TokenAdd}
      '{'             { MkToken _ TokenLCurly}
      '}'             { MkToken _ TokenRCurly}
      '('             { MkToken _ TokenLParen}
      ')'             { MkToken _ TokenRParen}
      ':'             { MkToken _ TokenColon}
      ';'             { MkToken _ TokenSemiColon}
      '<'             { MkToken _ TokenLessThan}
      '>'             { MkToken _ TokenGreaterThan}
      '<='            { MkToken _ TokenLessThanEq}
      '>='            { MkToken _ TokenGreaterThanEq}
      '=='            { MkToken _ TokenLogicalEq}
      '!='            { MkToken _ TokenNotEq }
      '!'             { MkToken _ TokenLogicalNot}
      '&&'            { MkToken _ TokenLogicalAnd}
      '||'            { MkToken _ TokenLogicalOr }
      '/'             { MkToken _ TokenDivide}
      '*'             { MkToken _ TokenMultiply}
      '-'             { MkToken _ TokenSubtract }
      '%'             { MkToken _ TokenModulo}
      catch           { MkToken _ TokenCatch}
      try             { MkToken _ TokenTry}
      throw           { MkToken _ TokenThrow}
      number          { MkToken _ (TokenNum $$)}
      intT            { MkToken _ TokenTInt}
      bool            { MkToken _ (TokenBool $$)}
      boolT           { MkToken _ TokenTBool}
      void            { MkToken _ TokenVoid}
      var             { MkToken _ (TokenVar $$)}
      print           { MkToken _ TokenPrint}
      consume         { MkToken _ TokenConsume}
      streams         { MkToken _ TokenInitStreams}
      NullPointerException                  { MkToken _ TokenNPE}
      StreamsNotInitialisedException        { MkToken _ TokenSNIE}
      NotExistingStreamConsumptionException { MkToken _ TokenNESCE}
      DivideByZeroException                 { MkToken _ TokenDBZE}
      TrapException                         { MkToken _ TokenTE}


%nonassoc '<' '>' '>=' '<=' '==' '!='
%left '+' '-' '&&' '||'
%right '*' '/' '%'
%left UNARY

%%


Stmt : Expression ';' Stmt         {Stmt $1 $3}
          | Expression ';'                   {$1}
          | Selection_Stmt Stmt    {Stmt $1 $2}
          | Iteration_Stmt Stmt    {Stmt $1 $2}
          | Selection_Stmt              {$1}
          | Iteration_Stmt              {$1}

Selection_Stmt:      if '(' Expression ')' Compound_Stmt else Compound_Stmt  {IfStmtElse $3 $5 $7}
                   | if '(' Expression ')' Compound_Stmt                          {IfStmt $3 $5}
                   | try Compound_Stmt catch '(' Exception ')' Compound_Stmt {TryCatchStmt $2 $5 $7}

Iteration_Stmt: while '(' Expression ')' Compound_Stmt {WhileStmt $3 $5}

Compound_Stmt: '{' Stmt '}' {$2}

Expression : Operation                      {$1}
           | var '=' Expression             {AssignmentStmt $1 $3}
           | Type var                       {Declaration $1 $2}
           | print Expression               {PrintOp $2}
           | consume Expression             {ConsumeStream $2}
           | streams Expression             {Streams $2}
           | throw Exception                {ThrowStmt $2}

Operation      : Operation '+'  Operation     {AddOp $1 $3}
               | Operation '-'  Operation     {SubtractOp $1 $3}
               | Operation '<'  Operation     {LessThanOp $1 $3}
               | Operation '<=' Operation     {LessThanEqOp $1 $3}
               | Operation '>'  Operation     {GreaterThanOp $1 $3}
               | Operation '>=' Operation     {GreaterThanEqOp $1 $3}
               | Operation '*'  Operation     {MultiplyOp $1 $3}
               | Operation '%'  Operation     {ModuloOp $1 $3}
               | Operation '/'  Operation     {DivideOp $1 $3}
               | Operation '==' Operation     {EqualOp $1 $3}
               | Operation '!=' Operation     {NotEqualOp $1 $3}
               | Operation '||' Operation     {OrOp $1 $3}
               | Operation '&&' Operation     {AndOp $1 $3}
               | '-' Operation  %prec UNARY   {NegateOp $2}
               | '!' Operation  %prec UNARY   {NotOp $2}
               | Exp2                         {$1}


Exp2 : '(' Expression ')'                                                  {$2}
     | var                                                                {Variable $1}
     | bool                                                               {BoolVal $1}
     | number                                                             {NumVal $1}

Exception : NullPointerException                  {NullPointer}
          | StreamsNotInitialisedException        {StreamsNotIntialised}
          | NotExistingStreamConsumptionException {NotExistingStreamConsumption}
          | DivideByZeroException                 {DivideByZero}
          | TrapException                         {Trap}

Type : boolT             {BoolT}
     | intT              {IntT}
     | void              {VoidT}

{
parseError :: [Token] -> a
parseError input = error ("error parsing in line " ++ (show line) ++ " column " ++ (show column))
    where
        line = fst position
        column = snd position
        position = tokenPosn $ head input


data Stmt = Stmt Stmt Stmt
               | IfStmtElse Stmt Stmt Stmt
               | IfStmt Stmt Stmt
               | WhileStmt Stmt Stmt
               | AssignmentStmt String Stmt
               | Declaration Type String
               | PrintOp Stmt
               | BoolVal Bool
               | Variable String
               | NumVal Int
               | Streams Stmt
               | ConsumeStream Stmt
               | TryCatchStmt Stmt ExceptionType Stmt
               | ThrowStmt ExceptionType
               | AddOp Stmt Stmt
               | LessThanOp Stmt Stmt
               | LessThanEqOp Stmt Stmt
               | GreaterThanOp Stmt Stmt
               | GreaterThanEqOp Stmt Stmt
               | SubtractOp Stmt Stmt
               | MultiplyOp Stmt Stmt
               | ModuloOp Stmt Stmt
               | DivideOp Stmt Stmt
               | EqualOp Stmt Stmt
               | NotEqualOp Stmt Stmt
               | OrOp Stmt Stmt
               | AndOp Stmt Stmt
               | NegateOp Stmt
               | NotOp Stmt
               deriving (Show)

data ExceptionType = NullPointer
               | StreamsNotIntialised
               | NotExistingStreamConsumption
               | DivideByZero
               | Trap
               deriving (Show)


data Type     = IntT
              | BoolT
              | VoidT
              | StmtT
              deriving (Show, Eq)



}
