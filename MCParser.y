{
module MCParser where
import MCLexer
}
%name parse
%tokentype { Token }
%error { parseError }

%token
      if              { MkToken _ If}
      while           { MkToken _ While}
      else            { MkToken _ Else}
      '='             { MkToken _ Eq}
      '+'             { MkToken _ Add}
      '{'             { MkToken _ LCurly}
      '}'             { MkToken _ RCurly}
      '('             { MkToken _ LParen}
      ')'             { MkToken _ RParen}
      ':'             { MkToken _ Colon}
      ';'             { MkToken _ SemiColon}
      '<'             { MkToken _ LessThan}
      number          { MkToken _ (Num $$)}
      intT            { MkToken _ TInt}
      bool            { MkToken _ (Bool $$)}
      boolT           { MkToken _ TBool}
      void            { MkToken _ Void}
      null            { MkToken _ Null}
      var             { MkToken _ (Var $$)}
      print           { MkToken _ Print}
      consume         { MkToken _ Consume}
      stream          { MkToken _ InitStream}

%%


Statement : Expression ';' Statement         {Stmnt $1 $3}
          | Expression ';'                   {$1}
          | Selection_Statement Statement    {Stmnt $1 $2}
          | Iteration_Statement Statement    {Stmnt $1 $2}
          | Selection_Statement              {$1}
          | Iteration_Statement              {$1}

Selection_Statement: if '(' Expression ')' Compound_Statement else Compound_Statement {IFE $3 $5 $7}

Iteration_Statement: while '(' Expression ')' Compound_Statement {WL $3 $5}

Compound_Statement: '{' Statement '}' {$2}

Expression : Binary_Operation           {$1}
           | var '=' Expression         {Assignment $1 $3}
           | Type var                   {Declaration $1 $2}
           | print   Expression         {Stdout $2}
           | consume Expression         {ConsumeStream $2}
           | stream  Expression         {Stream $2}
           | Exp2                       {$1}


Binary_Operation : Exp2 '+' Exp2 {Addition $1 $3}
                 | Exp2 '<' Exp2 {CompLT $1 $3}


Exp2 : '(' Statement ')'                                                  {$2}
     | var                                                                {Variable $1}
     | bool                                                               {Boolean $1}
     | number                                                             {Number $1}

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
               | Addition Statement Statement
               | CompLT Statement Statement
               deriving (Show)

data Type     = IntT
              | BoolT
              | VoidT
              | NullT
              deriving (Show)



}
