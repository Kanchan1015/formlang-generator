%{
#include "parser.tab.h"
#include <stdlib.h>
#include <string.h>

%}

%%

"form"              { return FORM; }
"meta"              { return META; }
"section"           { return SECTION; }
"validate"          { return VALIDATE; }
"if"                { return IF; }
"then"              { return THEN; }
"error"             { return ERROR; }

"text"              { return TEXT; }
"textarea"          { return TEXTAREA; }
"number"            { return NUMBER_TYPE; }
"email"             { return EMAIL; }
"date"              { return DATE; }
"checkbox"          { return CHECKBOX; }
"dropdown"          { return DROPDOWN; }
"radio"             { return RADIO; }
"password"          { return PASSWORD; }
"file"              { return FILE_FIELD; }

"required"          { return REQUIRED; }
"pattern"           { return PATTERN; }
"default"           { return DEFAULT; }
"min"               { return MIN; }
"max"               { return MAX; }
"rows"              { return ROWS; }
"cols"              { return COLS; }
"accept"            { return ACCEPT; }
"options"           { return OPTIONS; }

"=="                { return EQ; }
"!="                { return NEQ; }
"<="                { return LE; }
">="                { return GE; }
"<"                 { return LT; }
">"                 { return GT; }
"="                 { return ASSIGN; }
";"                 { return SEMICOLON; }
"{"                 { return LBRACE; }
"}"                 { return RBRACE; }
"["                 { return LBRACKET; }
"]"                 { return RBRACKET; }
","                 { return COMMA; }

 [0-9]+              { yylval.num = atoi(yytext); return NUMBER; }
 \"([^\"\n]*)\"      { yylval.str = strdup(yytext); return STRING; }
 [a-zA-Z_][a-zA-Z0-9_]* { yylval.str = strdup(yytext); return IDENTIFIER; }

 \n                  { yylineno++; }
 [ \t\r]+            { }

 .                   { printf("Unexpected character: %s at line %d\n", yytext, yylineno); }

%%

int yywrap() {
    return 1;
}
