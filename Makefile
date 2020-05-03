final_target: MCLexer.hs MCParser.hs TypeCheck.hs Eval.hs MarieCurry.hs SyntaxCheck.hs
	ghc MarieCurry.hs SyntaxCheck.hs Eval.hs TypeCheck.hs MCLexer.hs MCParser.hs Preprocessor.hs
	mv MarieCurry myinterpreter

MCLexer.hs: MCLexer.x
	alex MCLexer.x

MCParser.hs: MCParser.y
	happy -i  MCParser.y

clean:
	rm MCParser.hs MCLexer.hs *.o myinterpreter
