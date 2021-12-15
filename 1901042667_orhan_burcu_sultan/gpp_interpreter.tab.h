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

#ifndef YY_YY_GPP_INTERPRETER_TAB_H_INCLUDED
# define YY_YY_GPP_INTERPRETER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    KW_AND = 258,
    KW_OR = 259,
    KW_NOT = 260,
    KW_EQUAL = 261,
    KW_LESS = 262,
    KW_NIL = 263,
    KW_LIST = 264,
    KW_APPEND = 265,
    KW_CONCAT = 266,
    KW_SET = 267,
    KW_DEFFUN = 268,
    KW_FOR = 269,
    KW_IF = 270,
    KW_EXIT = 271,
    KW_LOAD = 272,
    KW_DISP = 273,
    KW_TRUE = 274,
    KW_FALSE = 275,
    OP_PLUS = 276,
    OP_MINUS = 277,
    OP_DIV = 278,
    OP_MULT = 279,
    OP_OP = 280,
    OP_CP = 281,
    OP_DBLMULT = 282,
    OP_OC = 283,
    OP_CC = 284,
    OP_COMMA = 285,
    COMMENT = 286,
    VALUE = 287,
    IDENTIFIER = 288
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 10 "gpp_interpreter.y"
 int number; char symbol;

#line 94 "gpp_interpreter.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_GPP_INTERPRETER_TAB_H_INCLUDED  */
