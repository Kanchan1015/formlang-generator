%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMBER
%token PLUS MUL
%token EOL

%left PLUS
%left MUL

%%
calclist: /* empty */
        | calclist expr EOL { printf("Result = %d\n", $2); }
        ;

expr: NUMBER         { $$ = $1; }
    | expr PLUS expr { $$ = $1 + $3; }
    | expr MUL expr  { $$ = $1 * $3; }
    ;
%%

int main() {
    printf("Enter expressions (e.g., 3 + 4 * 2):\n");
    yyparse();
    return 0;
}

int yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
