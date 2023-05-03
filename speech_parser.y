%{
/*
 *  A lexer for the basic grammar to use for the recognizing English sentences.
 */
#include <stdio.h>

int yylex(void);
int yyerror(const char *s);
%}

%token NOUN PRONOUN VERB ADVERB ADJECTIVE PREPOSITION CONJUNCTION

%%

sentence: subject VERB object { printf("Sentence is valid.\n"); }
    ;

subject: NOUN
    | PRONOUN
    ;

object: NOUN
    ;

%%

extern FILE *yyin;

int main(int argc, char **argv)
{
	do {
        yyparse();
    } while (!feof(yyin));

	return 0;
}

int yyerror(const char *s)
{
  fprintf(stderr, "%s\n", s);
  return 0;
}



