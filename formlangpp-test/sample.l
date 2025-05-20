%{
#include <stdio.h>

// Define yywrap manually
int yywrap() {
    return 1;
}
%}

%%
[0-9]+      { printf("NUMBER FOUND: %s\n", yytext); }
.|\n        { /* skip other characters */ }
%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}
