%{
#include "formlang.tab.h"
#include <string.h>
#include <stdlib.h>

char name[100];
char type[100];
char pattern[256];
int required = 0;
%}

%%
"text"              { strcpy(type, "text"); return TEXT; }
"required"          { required = 1; return REQUIRED; }
pattern=\"[^\"]+\"  {
                      strncpy(pattern, yytext + 8, sizeof(pattern));
                      pattern[strlen(pattern) - 1] = '\0';
                      return PATTERN;
                    }
[a-zA-Z_][a-zA-Z0-9_]*  { strcpy(name, yytext); return NAME; }
[ \t\n]+             ; // skip whitespace
.                    ; // skip everything else
%%

int yywrap() { return 1; }
