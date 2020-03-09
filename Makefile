final_target: MCLexer.hs MCParser.hs test_eval.hs
	ghc test_eval.hs MCLexer.hs MCParser.hs

MCLexer.hs: MCLexer.x
	alex MCLexer.x

MCParser.hs: MCParser.y
	happy -i  MCParser.y
