{
module MCLexer where
}

%wrapper "posn"
$digit = 0-9
-- digits
$ascsymbol = [\!\#\$\%\&\*\+\.\/\<\=\>\?\@\\\^\|\-\~]
$unisymbol = [] -- TODO
$special   = [\(\)\,\;\[\]\`\{\}]
$symbol    = [$ascsymbol $unisymbol] # [$special \_\:\"\']
$whitechar = [ \t\n\r\f\v]
$large     = [A-Z \xc0-\xd6 \xd8-\xde]
$small     = [a-z \xdf-\xf6 \xf8-\xff \_]
$alpha     = [$small $large]
$graphic   = [$small $large $symbol $digit $special \:\"\']
@decimal     = $digit+
$cntrl   = [$large \@\[\\\]\^\_]
@ascii   = \^ $cntrl | NUL | SOH | STX | ETX | EOT | ENQ | ACK
	 | BEL | BS | HT | LF | VT | FF | CR | SO | SI | DLE
	 | DC1 | DC2 | DC3 | DC4 | NAK | SYN | ETB | CAN | EM
	 | SUB | ESC | FS | GS | RS | US | SP | DEL
$charesc = [abfnrtv\\\"\'\&]
@escape  = \\ ($charesc | @ascii | @decimal)
@gap     = \\ $whitechar+ \\
@string  = $graphic # [\"\\] | " " | @escape | @gap

tokens :-
  $white+       ;
  "--".*        ;
  $digit+ {\p s -> MkToken p (TokenNum (read s)) }
  true    {\p s -> MkToken p (TokenBool True)}
  false   {\p s -> MkToken p (TokenBool False)}
  int     {\p s -> MkToken p TokenTInt }
  bool    {\p s -> MkToken p TokenTBool}
  void    {\p s -> MkToken p TokenVoid }
  char    {\p s -> MkToken p TokenTChar}
  if      {\p s -> MkToken p TokenIf }
  else    {\p s -> MkToken p TokenElse }
  while   {\p s -> MkToken p TokenWhile }
  print   {\p s -> MkToken p TokenPrint }
  streams {\p s -> MkToken p TokenInitStreams }
  consume {\p s -> MkToken p TokenConsume }
  try     {\p s -> MkToken p TokenTry}
  catch   {\p s -> MkToken p TokenCatch}
  throw   {\p s -> MkToken p TokenThrow }
  head    {\p s -> MkToken p TokenHead}
  tail    {\p s -> MkToken p TokenTail}
  isEmpty {\p s -> MkToken p TokenIsEmpty}
  cons    {\p s -> MkToken p TokenCons}
  "="     {\p s -> MkToken p TokenEq }
  "<"     {\p s -> MkToken p TokenLessThan }
  "<="    {\p s -> MkToken p TokenLessThanEq }
  ">"     {\p s -> MkToken p TokenGreaterThan }
  ">="    {\p s -> MkToken p TokenGreaterThanEq}
  "=="    {\p s -> MkToken p TokenLogicalEq}
  "!="    {\p s -> MkToken p TokenNotEq }
  "!"     {\p s -> MkToken p TokenLogicalNot}
  "&&"    {\p s -> MkToken p TokenLogicalAnd}
  "||"    {\p s -> MkToken p TokenLogicalOr }
  "/"     {\p s -> MkToken p TokenDivide}
  "+"     {\p s -> MkToken p TokenAdd }
  "*"     {\p s -> MkToken p TokenMultiply}
  "-"     {\p s -> MkToken p TokenSubtract }
  "%"     {\p s -> MkToken p TokenModulo}
  ";"     {\p s -> MkToken p TokenSemiColon }
  ":"     {\p s -> MkToken p TokenColon }
  "("     {\p s -> MkToken p TokenLParen }
  ")"     {\p s -> MkToken p TokenRParen }
  "{"     {\p s -> MkToken p TokenLCurly }
  "}"     {\p s -> MkToken p TokenRCurly}
  "["     {\p s -> MkToken p TokenLSquare}
  "]"     {\p s -> MkToken p TokenRSquare}
  \\      {\p s -> MkToken p TokenLambda}
  "->"    {\p s -> MkToken p TokenArrow}
  "()"    {\p s -> MkToken p TokenUnit}
  ","     {\p s -> MkToken p TokenComma}
  return  {\p s -> MkToken p TokenReturn}
  fst     {\p s -> MkToken p TokenFst}
  snd     {\p s -> MkToken p TokenSnd}
  NullPointerException                    {\p s -> MkToken p TokenNPE}
  StreamsNotInitialisedException          {\p s -> MkToken p TokenSNIE}
  NotExistingStreamConsumptionException   {\p s -> MkToken p TokenNESCE}
  DivideByZeroException                   {\p s -> MkToken p TokenDBZE}
  TrapException                           {\p s -> MkToken p TokenTE}
  ListEmptyException                      {\p s -> MkToken p TokenLEE}
  $alpha [$alpha $digit \_ \’]*           {\p s -> MkToken p (TokenVar s)}
  \" @string* \"		                      {\p s -> MkToken p (TokenString $ trimString s) }

{

-- The token type:
data Token = MkToken AlexPosn TokenClass
    deriving (Show,Eq)

data TokenClass =
  TokenNum          Int       |
  TokenBool         Bool      |
  TokenVar          String    |
  TokenString       String    |
  TokenIf                     |
  TokenElse                   |
  TokenWhile                  |
  TokenLessThan               |
  TokenAdd                    |
  TokenColon                  |
  TokenSemiColon              |
  TokenLParen                 |
  TokenRParen                 |
  TokenLCurly                 |
  TokenRCurly                 |
  TokenEq                     |
  TokenTInt                   |
  TokenTBool                  |
  TokenPrint                  |
  TokenConsume                |
  TokenInitStreams            |
  TokenVoid                   |
  TokenModulo                 |
  TokenSubtract               |
  TokenDivide                 |
  TokenMultiply               |
  TokenLessThanEq             |
  TokenGreaterThan            |
  TokenGreaterThanEq          |
  TokenLogicalEq              |
  TokenNotEq                  |
  TokenLogicalNot             |
  TokenLogicalAnd             |
  TokenLogicalOr              |
  TokenTry                    |
  TokenCatch                  |
  TokenThrow                  |
  TokenNPE                    |
  TokenSNIE                   |
  TokenNESCE                  |
  TokenDBZE                   |
  TokenTE                     |
  TokenLEE                    |
  TokenLambda                 |
  TokenArrow                  |
  TokenUnit                   |
  TokenLSquare                |
  TokenRSquare                |
  TokenHead                   |
  TokenTail                   |
  TokenIsEmpty                |
  TokenCons                   |
  TokenReturn                 |
  TokenTChar                  |
  TokenComma                  |
  TokenFst                    |
  TokenSnd
    deriving (Show,Eq)

trimString :: String -> String
trimString xs = [x| x <- xs, not (x == '\"')]

tokenPosn :: Token -> (Int, Int)
tokenPosn (MkToken (AlexPn _ line col) _) = (line, col)
}
