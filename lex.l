%{
#include "parse.tab.h"

%}

%option noyywrap

NUM	[0-9]+
FNUM	({NUM}\.[0-9]+|[0-9]+\.{NUM})
DNUM	({FNUM}([Ee][-+]?{NUM})?)
ID	[a-zA-Z_][a-zA-Z0-9_]*
STRING	\"[^\"]*\" 
CHAR	\'[a-z]\'

%%

[ \n\r\t]+	{/* ws*/}
"if"		{ return IF; }
"elif"		{ return ELIF; }
"else"		{ return ELSE; }
"while"		{ return WHILE; }
"do"		{ return DO; }
"try"		{ return TRY; }
"catch"		{ return CATCH; }
"switch"	{ return SWITCH; }
"case"		{ return CASE; }
"default"	{ return DEF; }
"for"		{ return FOR; }

"fn"		{ return FUNC; }

"main"		{ return MAIN; }

"Write!"	{ return WRITE; }
"Writeln!"	{ return WRITELN; }
"Read!"		{ return READ; }

"let"		{ return LET; }
"int"		{ return INT; }
"f32"		{ return FLOAT; }
"f64"		{ return DOUBLE; }
"string"	{ return STRSTM; }
"bool"		{ return BOOLSTM; }
"char"		{ return CHARSTM; }

"+"		{ return PLUS; }
"-"		{ return MINUS; }
"*"		{ return MUL; }
"/"		{ return DIV; }
"="		{ return EQL; }
"|"		{ return ABS; }

">"		{ return GTR; }
"<"		{ return LES; }
"=>"		{ return GTREQL; }
"<="		{ return LESEQL; }
"!="		{ return NEQL; }
"=="		{ return DEQL; }
"&&"		{ return AND; }
"||"		{ return OR; }

"("		{ return OPRC; }
")"		{ return CPRC; }
"["		{ return OBX; }
"]"		{ return CBX; }
"{"		{ return OBR; }
"}"		{ return CBR; }

","		{ return CMA; }
":"		{ return SCOL; }
"::"		{ return DCOL; }
";"		{ return TER; }
{NUM}		{ return NUM; }
{FNUM}		{ return FNUM; }
{ID}		{ return ID; }
{STRING}	{ yylval.str = strdup(yytext); return STRING; }
{CHAR}		{ return CHAR; }

.		{ fprintf(stderr,"Lexical error: unexpected character%s\n", yytext); }
<<EOF>>		{ return TEOF; }

%%

