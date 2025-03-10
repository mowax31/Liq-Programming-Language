/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
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
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PARSE_TAB_H_INCLUDED
# define YY_YY_PARSE_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    NUM = 258,                     /* NUM  */
    FNUM = 259,                    /* FNUM  */
    DNUM = 260,                    /* DNUM  */
    ID = 261,                      /* ID  */
    CHAR = 262,                    /* CHAR  */
    TEOF = 263,                    /* TEOF  */
    ABS = 264,                     /* ABS  */
    STRING = 265,                  /* STRING  */
    LET = 266,                     /* LET  */
    INT = 267,                     /* INT  */
    FLOAT = 268,                   /* FLOAT  */
    DOUBLE = 269,                  /* DOUBLE  */
    STRSTM = 270,                  /* STRSTM  */
    BOOLSTM = 271,                 /* BOOLSTM  */
    CHARSTM = 272,                 /* CHARSTM  */
    IF = 273,                      /* IF  */
    ELIF = 274,                    /* ELIF  */
    ELSE = 275,                    /* ELSE  */
    WHILE = 276,                   /* WHILE  */
    DO = 277,                      /* DO  */
    TRY = 278,                     /* TRY  */
    CATCH = 279,                   /* CATCH  */
    SWITCH = 280,                  /* SWITCH  */
    CASE = 281,                    /* CASE  */
    DEF = 282,                     /* DEF  */
    FOR = 283,                     /* FOR  */
    PLUS = 284,                    /* PLUS  */
    MINUS = 285,                   /* MINUS  */
    MUL = 286,                     /* MUL  */
    DIV = 287,                     /* DIV  */
    EQL = 288,                     /* EQL  */
    GTR = 289,                     /* GTR  */
    LES = 290,                     /* LES  */
    GTREQL = 291,                  /* GTREQL  */
    LESEQL = 292,                  /* LESEQL  */
    NEQL = 293,                    /* NEQL  */
    DEQL = 294,                    /* DEQL  */
    AND = 295,                     /* AND  */
    OR = 296,                      /* OR  */
    OPRC = 297,                    /* OPRC  */
    CPRC = 298,                    /* CPRC  */
    OBX = 299,                     /* OBX  */
    CBX = 300,                     /* CBX  */
    OBR = 301,                     /* OBR  */
    CBR = 302,                     /* CBR  */
    CMA = 303,                     /* CMA  */
    SCOL = 304,                    /* SCOL  */
    DCOL = 305,                    /* DCOL  */
    TER = 306,                     /* TER  */
    FUNC = 307,                    /* FUNC  */
    MAIN = 308,                    /* MAIN  */
    WRITE = 309,                   /* WRITE  */
    WRITELN = 310,                 /* WRITELN  */
    READ = 311                     /* READ  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 23 "parse.y"

	char *str;

#line 124 "parse.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSE_TAB_H_INCLUDED  */
