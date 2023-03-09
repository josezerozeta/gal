%{
/*
 * the simplest lex program
 */
%}

%%
.|\n    ECHO;
%%

int yywrap() 
{
	return 0;
}
int main(int argc, char **argv)
{
	yylex();
	return 0;
}
