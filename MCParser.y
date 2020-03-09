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
      try             { MkToken _ TokenCatch}
      catch           {MkToken _ TokenTry}
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


%nonassoc '<' '>'
%left '+' '-'
%right '*' '/'
%left UNARY

%%


Statement : Expression ';' Statement         {Stmnt $1 $3}
          | Expression ';'                   {$1}
          | Selection_Statement Statement    {Stmnt $1 $2}
          | Iteration_Statement Statement    {Stmnt $1 $2}
          | Selection_Statement              {$1}
          | Iteration_Statement              {$1}

Selection_Statement: if '(' Expression ')' Compound_Statement else Compound_Statement {IFE $3 $5 $7}
                   | try Compound_Statement catch '(' Exception ')' Compound_Statement {TC $2 $5 $7}

Iteration_Statement: while '(' Expression ')' Compound_Statement {WL $3 $5}

Compound_Statement: '{' Statement '}' {$2}

Expression : Binary_Operation               {$1}
           | Unary_Operation  %prec UNARY   {$1}
           | var '=' Expression             {Assignment $1 $3}
           | Type var                       {Declaration $1 $2}
           | print   Expression             {Stdout $2}
           | consume Expression             {ConsumeStream $2}
           | stream  Expression             {Stream $2}
           | throw Exception                {Throw $2}
           | Exp2                           {$1}


Binary_Operation : Exp2 Binary_Operator Expression {Bin_Op $2 $1 $3}

Unary_Operation : Unary_Operator Expression {Un_Op $1 $2}

Unary_Operator : '-' {Negate}
               | '!' {Not}

Binary_Operator: '+'  {Add}
               | '-'  {Subtract}
               | '<'  {LessThan}
               | '<=' {LessThanEq}
               | '>'  {GreaterThan}
               | '>=' {GreaterThanEq}
               | '*'  {Multiply}
               | '%'  {Modulo}
               | '/'  {Divide}
               | '==' {Equal}
               | '!=' {NotEqual}
               | '||' {Or}
               | '&&' {And}


Exp2 : '(' Statement ')'                                                  {$2}
     | var                                                                {Variable $1}
     | bool                                                               {Boolean $1}
     | number                                                             {Number $1}

Exception : NullPointerException                  {NPE}
          | StreamsNotInitialisedException        {SNIE}
          | NotExistingStreamConsumptionException {NESCE}
          | DivideByZeroException                 {DBZE}
          | TrapException                         {TE}

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


data Statement = Stmnt Statement Statement
               | IFE Statement Statement Statement
               | WL Statement Statement
               | Assignment String Statement
               | Declaration Type String
               | Stdout Statement
               | Boolean Bool
               | Variable String
               | Number Int
               | Stream Statement
               | ConsumeStream Statement
               | Bin_Op Binary_Operator Statement Statement
               | Un_Op Unary_Operator Statement
               | TC Statement Exception Statement
               | Throw Exception
               deriving (Show)

data Exception = NPE
               | SNIE
               | NESCE
               | DBZE
               | TE
               deriving (Show)

data Unary_Operator = Negate
                    | Not
                    deriving (Show)

data Binary_Operator = Add
                     | LessThan
                     | LessThanEq
                     | GreaterThan
                     | GreaterThanEq
                     | Subtract
                     | Multiply
                     | Modulo
                     | Divide
                     | Equal
                     | NotEqual
                     | Or
                     | And
                     deriving (Show)

data Type     = IntT
              | BoolT
              | VoidT
              | NullT
              deriving (Show)



}
