%{
#include "calc.tab.h"  // Header generated by Bison
#include <stdio.h>
%}

DIGIT   [0-9]
%%
{DIGIT}+        { yylval = atoi(yytext); return NUMBER; }
[ \t]           ; // Ignore spaces and tabs
\n              { return EOL; }
"+"             { return PLUS; }
"*"             { return MUL; }
.               { return yytext[0]; } // fallback
%%
int yywrap() { return 1; }
