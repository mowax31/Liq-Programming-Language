all:
	flex lex.l
	bison -d parse.y
	clang lex.yy.c parse.tab.c -o fx
	./fx
	
lex:
	flex lex.l

par:
	bison -d parse.y
	
run:
	clang lex.yy.c parse.tab.c -o fx



