%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


extern char name[100];
extern char type[100];
extern char pattern[256];
extern int required;
%}

%token TEXT NAME REQUIRED PATTERN

%%
form: field_line
    ;

field_line:
    TEXT NAME opt_required opt_pattern {
        printf("<input type=\"%s\" name=\"%s\"", type, name);
        if (required) printf(" required");
        if (strlen(pattern) > 0) printf(" pattern=\"%s\"", pattern);
        printf(">\n");
    }
    ;

opt_required:
    /* empty */       { required = 0; }
  | REQUIRED          { /* already set */ }
    ;

opt_pattern:
    /* empty */       { pattern[0] = '\0'; }
  | PATTERN           { /* already set */ }
    ;
%%

int main() {
    printf("Parsing FormLang++ input:\n");
    yyparse();
    return 0;
}

int yyerror(char *s) {
    fprintf(stderr, "Parse error: %s\n", s);
    return 1;
}
