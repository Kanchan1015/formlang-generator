%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex(void);
int yyerror(const char *s);

char current_field_type[50];
char attributes_buffer[1024];
%}

%union {
    int num;
    char* str;
}

%token <str> FORM META SECTION VALIDATE IF THEN ERROR
%token <str> TEXT TEXTAREA NUMBER_TYPE EMAIL DATE CHECKBOX DROPDOWN RADIO PASSWORD FILE_FIELD
%token <str> STRING IDENTIFIER
%token <num> NUMBER

%token REQUIRED PATTERN DEFAULT MIN MAX ROWS COLS ACCEPT OPTIONS
%token EQ NEQ LE GE LT GT ASSIGN SEMICOLON LBRACE RBRACE LBRACKET RBRACKET COMMA

%type <str> value
%type <str> field_type
%type <str> comparison_operator
%type <str> expression


%%

form:
    FORM IDENTIFIER LBRACE optional_meta form_sections optional_validation RBRACE {
        printf("<!-- Form: %s -->\n", $2);
        printf("<form>\n");
        printf("</form>\n");
    }
    ;

optional_meta:
    /* empty */
    | meta_section
    ;

meta_section:
    META meta_entries
    ;

meta_entries:
    meta_entry
    | meta_entries meta_entry
    ;

meta_entry:
    IDENTIFIER ASSIGN value SEMICOLON {
        printf("<!-- %s: %s -->\n", $1, $3);
    }
    ;

form_sections:
    form_section
    | form_sections form_section
    ;

form_section:
    SECTION IDENTIFIER LBRACE field_definitions RBRACE {
        printf("<!-- Section: %s -->\n", $2);
    }
    ;

field_definitions:
    field_definition
    | field_definitions field_definition
    ;

field_definition:
    field_type IDENTIFIER attributes SEMICOLON {
        // Print label
        printf("<label for=\"%s\">%s</label>\n", $2, $2);

        if (strcmp($1, "textarea") == 0) {
            printf("<textarea name=\"%s\" %s></textarea>\n", $2, attributes_buffer);
        } else if (strcmp($1, "dropdown") == 0) {
            printf("<select name=\"%s\" %s>\n<option>Option1</option><option>Option2</option></select>\n", $2, attributes_buffer);
        } else if (strcmp($1, "radio") == 0) {
            printf("<input type=\"radio\" name=\"%s\" %s>\n", $2, attributes_buffer);
        } else {
            printf("<input type=\"%s\" name=\"%s\" %s>\n", $1, $2, attributes_buffer);
        }

        strcpy(attributes_buffer, "");  // Reset buffer
    }
    ;

field_type:
    TEXT        { $$ = "text"; }
  | TEXTAREA    { $$ = "textarea"; }
  | NUMBER_TYPE { $$ = "number"; }
  | EMAIL       { $$ = "email"; }
  | DATE        { $$ = "date"; }
  | CHECKBOX    { $$ = "checkbox"; }
  | DROPDOWN    { $$ = "dropdown"; }
  | RADIO       { $$ = "radio"; }
  | PASSWORD    { $$ = "password"; }
  | FILE_FIELD  { $$ = "file"; }
  ;

attributes:
    /* empty */
    | attributes attribute
    ;

attribute:
    REQUIRED {
        strcat(attributes_buffer, " required");
    }
    | PATTERN ASSIGN STRING {
        char buffer[256];
        sprintf(buffer, " pattern=%s", $3);  // already quoted
        strcat(attributes_buffer, buffer);
    }
    | DEFAULT ASSIGN value {
        char buffer[256];
        sprintf(buffer, " value=\"%s\"", $3);
        strcat(attributes_buffer, buffer);
    }
    | MIN ASSIGN NUMBER {
        char buffer[256];
        sprintf(buffer, " min=\"%d\"", $3);
        strcat(attributes_buffer, buffer);
    }
    | MAX ASSIGN NUMBER {
        char buffer[256];
        sprintf(buffer, " max=\"%d\"", $3);
        strcat(attributes_buffer, buffer);
    }
    | ROWS ASSIGN NUMBER {
        char buffer[256];
        sprintf(buffer, " rows=\"%d\"", $3);
        strcat(attributes_buffer, buffer);
    }
    | COLS ASSIGN NUMBER {
        char buffer[256];
        sprintf(buffer, " cols=\"%d\"", $3);
        strcat(attributes_buffer, buffer);
    }
    | ACCEPT ASSIGN STRING {
        char buffer[256];
        sprintf(buffer, " accept=%s", $3);
        strcat(attributes_buffer, buffer);
    }
    | OPTIONS ASSIGN LBRACKET value_list RBRACKET {
        // Optional: handle <option> list generation here
    }
    ;

value_list:
    value
    | value_list COMMA value
    ;

value:
    STRING { $$ = $1; }
  | NUMBER {
        char temp[20];
        sprintf(temp, "%d", $1);
        $$ = strdup(temp);
    }
    ;

optional_validation:
    /* empty */
    | validation_section
    ;

validation_section:
    VALIDATE LBRACE conditions RBRACE
    ;

conditions:
    condition
    | conditions condition
    ;

condition:
    IF expression THEN ERROR STRING SEMICOLON {
        printf("<!-- Validation: if %s then error '%s' -->\n", $2, $5);
    }
    ;

expression:
    IDENTIFIER comparison_operator value {
        char expr[256];
        sprintf(expr, "%s %s %s", $1, $2, $3);
        $$ = strdup(expr);
    }
    ;

comparison_operator:
    EQ  { $$ = "=="; }
  | NEQ { $$ = "!="; }
  | LE  { $$ = "<="; }
  | GE  { $$ = ">="; }
  | LT  { $$ = "<"; }
  | GT  { $$ = ">"; }
  ;


%%

int yyerror(const char *s) {
    fprintf(stderr, "\nParse error: %s\n", s);
    return 1;
}


int main() {
    printf("Parsing FormLang++ DSL...\n\n");
    return yyparse();
}
