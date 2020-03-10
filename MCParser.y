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
      try             { MkToken _ TokenTry}
      catch           {MkToken _ TokenCatch}
      throw           {MkToken _ TokenThrow}
      number          { MkToken _ (TokenNum $$)}
      intT            { MkToken _ TokenTInt}
      bool            { MkToken _ (TokenBool $$)}
      boolT           { MkToken _ TokenTBool}
      void            { MkToken _ TokenVoid}
      null            { MkToken _ TokenNull}
      var             { MkToken _ (TokenVar $$)}
      print           { MkToken _ TokenPrint}
      consume         { MkToken _ TokenConsume}
      stream          { MkToken _ TokenInitStream}
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


Statement : Expression ';' Statement         {Statement $1 $3}
          | Expression ';'                   {$1}
          | Selection_Statement Statement    {Statement $1 $2}
          | Iteration_Statement Statement    {Statement $1 $2}
          | Selection_Statement              {$1}
          | Iteration_Statement              {$1}

Selection_Statement: if '(' Expression ')' Compound_Statement else Compound_Statement  {IfElse $3 $5 $7}
                   | if '(' Expression ')' Compound_Statement                          {If $3 $5}
                   | try Compound_Statement catch '(' Exception ')' Compound_Statement {TryCatch $2 $5 $7}

Iteration_Statement: while '(' Expression ')' Compound_Statement {While $3 $5}

Compound_Statement: '{' Statement '}' {$2}

Expression : Operation                      {$1}
           | var '=' Expression             {Assignment $1 $3}
           | Type var                       {Declaration $1 $2}
           | print   Expression             {Print $2}
           | consume Expression             {ConsumeStream $2}
           | stream  Expression             {Stream $2}
           | throw Exception                {Throw $2}

Operation      : Operation '+'  Operation     {Add $1 $3}
               | Operation '-'  Operation     {Subtract $1 $3}
               | Operation '<'  Operation     {LessThan $1 $3}
               | Operation '<=' Operation     {LessThanEq $1 $3}
               | Operation '>'  Operation     {GreaterThan $1 $3}
               | Operation '>=' Operation     {GreaterThanEq $1 $3}
               | Operation '*'  Operation     {Multiply $1 $3}
               | Operation '%'  Operation     {Modulo $1 $3}
               | Operation '/'  Operation     {Divide $1 $3}
               | Operation '==' Operation     {Equal $1 $3}
               | Operation '!=' Operation     {NotEqual $1 $3}
               | Operation '||' Operation     {Or $1 $3}
               | Operation '&&' Operation     {And $1 $3}
               | '-' Operation  %prec UNARY   {Negate $2}
               | '!' Operation  %prec UNARY   {Not $2}
               | Exp2                         {$1}


Exp2 : '(' Expression ')'                                                  {$2}
     | var                                                                {Variable $1}
     | bool                                                               {Boolean $1}
     | number                                                             {Number $1}

Exception : NullPointerException                  {NullPointerException}
          | StreamsNotInitialisedException        {StreamsNotIntialisedException}
          | NotExistingStreamConsumptionException {NotExistingStreamConsumptionException}
          | DivideByZeroException                 {DivideByZeroException}
          | TrapException                         {TrapException}

Type : boolT             {BoolT}
     | intT              {IntT}
     | void              {VoidT}
     | null              {NullT}

{
parseError :: [Token] -> a
parseError input = error ("error while parsing in line " ++ (show line) ++ " column " ++ (show column))
    where
        line = fst position
        column = snd position
        position = tokenPosn $ head input


data Statement = Statement Statement Statement
               | IfElse Statement Statement Statement
               | If Statement Statement
               | While Statement Statement
               | Assignment String Statement
               | Declaration Type String
               | Print Statement
               | Boolean Bool
               | Variable String
               | Number Int
               | Stream Statement
               | ConsumeStream Statement
               | TryCatch Statement Exception Statement
               | Throw Exception
               | Add Statement Statement
               | LessThan Statement Statement
               | LessThanEq Statement Statement
               | GreaterThan Statement Statement
               | GreaterThanEq Statement Statement
               | Subtract Statement Statement
               | Multiply Statement Statement
               | Modulo Statement Statement
               | Divide Statement Statement
               | Equal Statement Statement
               | NotEqual Statement Statement
               | Or Statement Statement
               | And Statement Statement
               | Negate Statement
               | Not Statement
               deriving (Show)

data Exception = NullPointerException
               | StreamsNotIntialisedException
               | NotExistingStreamConsumptionException
               | DivideByZeroException
               | TrapException
               deriving (Show)


data Type     = IntT
              | BoolT
              | VoidT
              | NullT
              deriving (Show)



}
