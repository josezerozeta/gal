# gal

flex lexer.l
gcc -o output lex.yy.cc

flex lexer.l
bison parser.y
gcc -c lex.yy.c parser.tab.c
gcc -o output lex.yy.o parser.tab.o -ll
