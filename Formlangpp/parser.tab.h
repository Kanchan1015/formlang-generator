/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    FORM = 258,
    META = 259,
    SECTION = 260,
    VALIDATE = 261,
    IF = 262,
    THEN = 263,
    ERROR = 264,
    TEXT = 265,
    TEXTAREA = 266,
    NUMBER_TYPE = 267,
    EMAIL = 268,
    DATE = 269,
    CHECKBOX = 270,
    DROPDOWN = 271,
    RADIO = 272,
    PASSWORD = 273,
    FILE_FIELD = 274,
    STRING = 275,
    IDENTIFIER = 276,
    NUMBER = 277,
    REQUIRED = 278,
    PATTERN = 279,
    DEFAULT = 280,
    MIN = 281,
    MAX = 282,
    ROWS = 283,
    COLS = 284,
    ACCEPT = 285,
    OPTIONS = 286,
    EQ = 287,
    NEQ = 288,
    LE = 289,
    GE = 290,
    LT = 291,
    GT = 292,
    ASSIGN = 293,
    SEMICOLON = 294,
    LBRACE = 295,
    RBRACE = 296,
    LBRACKET = 297,
    RBRACKET = 298,
    COMMA = 299
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 18 "parser.y"

    int num;
    char* str;

#line 107 "parser.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
