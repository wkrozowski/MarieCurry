module Preprocesor(runPreprocesor) where
    import MCParser
    import MCLexer
    import System.IO
    import SyntaxCheck

    linkFiles :: Stmt -> Stmt -> Stmt
    linkFiles (Stmt a b) toLink  = Stmt a (linkFiles b toLink)
    linkFiles a toLink = Stmt a toLink

    process :: Stmt -> IO( Stmt )
    process (Stmt (Include path) rest) = do
        input <-  (loadFile path) >>= process
        processedRest <- process rest
        return (linkFiles input processedRest )

    process (Stmt p q)  = do
        a <- process p
        b <- process q
        return (Stmt a b)
    process input = return input

    loadFile :: String -> IO (Stmt)
    loadFile path = do
        contents <- readFile path
        return (parse $ checkSyntax (alexScanTokens contents) [])

    runPreprocesor :: String -> IO(Stmt)
    runPreprocesor path = loadFile path >>= process


