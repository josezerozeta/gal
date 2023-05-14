%{

#include <stdio.h>

int yylex(void);
int yyerror(const char *s);
%}

%token NAME NUMBER

%%
statement: NAME '=' expression
    | expression    { printf("=%d\n", $1); }
    ;

expression: expression '+' NUMBER   { $$ = $1 + $3; }
    | expression '-' NUMBER         { $$ = $1 - $3; }
    | NUMBER                        { $$ = $1; }
    ;

%%

int main(int argc, char **argv)
{
    yyparse();
	return 0;
}

int yyerror(const char *s)
{
  fprintf(stderr, "%s\n", s);
  return 0;
}