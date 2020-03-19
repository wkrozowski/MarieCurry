final_target: MCLexer.hs MCParser.hs TypeCheck.hs Eval.hs MarieCurry.hs
	ghc MarieCurry.hs Eval.hs TypeCheck.hs MCLexer.hs MCParser.hs

MCLexer.hs: MCLexer.x
	alex MCLexer.x

MCParser.hs: MCParser.y
	happy -i  MCParser.y
