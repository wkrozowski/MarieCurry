import MCLexer
import MCParser
import System.IO
import System.Environment

main = do x <- getArgs
          case length x of
            0 -> error "No arguments provided"
            otherwise ->  do file <- openFile (head x) ReadMode
                             alex <- hGetContents file
                             print (modParse (alexScanTokens alex))
