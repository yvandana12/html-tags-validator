
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
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


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     START_ANGLE_BRACKET = 258,
     NL = 259,
     A_TAG = 260,
     A_ATTRIBUTE = 261,
     SYNTAX_ERROR = 262,
     EQUAL = 263,
     ATTR_VALUE = 264,
     END_TAG1 = 265,
     A_CONTENT = 266,
     A_END_TAG = 267,
     IMG_TAG = 268,
     IMG_ALT = 269,
     IMG_SRC = 270,
     IMG_OTHER_ATTRIBUTE = 271,
     IMG_END_TAG2 = 272,
     IMG_END_TAG3 = 273
   };
#endif
/* Tokens.  */
#define START_ANGLE_BRACKET 258
#define NL 259
#define A_TAG 260
#define A_ATTRIBUTE 261
#define SYNTAX_ERROR 262
#define EQUAL 263
#define ATTR_VALUE 264
#define END_TAG1 265
#define A_CONTENT 266
#define A_END_TAG 267
#define IMG_TAG 268
#define IMG_ALT 269
#define IMG_SRC 270
#define IMG_OTHER_ATTRIBUTE 271
#define IMG_END_TAG2 272
#define IMG_END_TAG3 273




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


