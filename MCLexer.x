{
module MCLexer where
}

%wrapper "posn"
$digit = 0-9
-- digits
$alpha = [a-zA-Z]
-- alphabetic characters

tokens :-
  $white+       ;
  "--".*        ;
  $digit+ {\p s -> MkToken p (Num (read s)) }
  true    {\p s -> MkToken p (Bool True)}
  false   {\p s -> MkToken p (Bool False)}
  int     {\p s -> MkToken p TInt }
  bool    {\p s -> MkToken p TBool }
  void    {\p s -> MkToken p Void }
  null    {\p s -> MkToken p Null }
  if      {\p s -> MkToken p If }
  else    {\p s -> MkToken p Else }
  while   {\p s -> MkToken p While }
  print   {\p s -> MkToken p Print }
  stream  {\p s -> MkToken p InitStream }
  consume {\p s -> MkToken p Consume }
  "="     {\p s -> MkToken p Eq }
  "<"     {\p s -> MkToken p LessThan }
  "+"     {\p s -> MkToken p Add }
  ";"     {\p s -> MkToken p SemiColon }
  ":"     {\p s -> MkToken p Colon }
  "("     {\p s -> MkToken p LParen }
  ")"     {\p s -> MkToken p RParen }
  "{"     {\p s -> MkToken p LCurly }
  "}"     {\p s -> MkToken p RCurly}
  $alpha [$alpha $digit \_ \’]*   {\p s ->MkToken p (Var s)}
{

-- The token type:
data Token = MkToken AlexPosn TokenClass
    deriving (Show,Eq)

data TokenClass =
  Num          Int       |
  Bool         Bool      |
  Var          String    |
  If                     |
  Else                   |
  While                  |
  LessThan               |
  Add                    |
  Colon                  |
  SemiColon              |
  LParen                 |
  RParen                 |
  LCurly                 |
  RCurly                 |
  Eq                     |
  TInt                   |
  TBool                  |
  Print                  |
  Consume                |
  InitStream             |
  Null                   |
  Void
  deriving (Eq,Show)


tokenPosn :: Token -> (Int, Int)
tokenPosn (MkToken (AlexPn _ line col) _) = (line, col)
}
