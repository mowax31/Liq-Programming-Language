%{

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

extern int yylex();
void yyerror(char *s);

%}

%token NUM FNUM DNUM ID CHAR TEOF ABS
%token <str>STRING
%token LET INT FLOAT DOUBLE STRSTM BOOLSTM CHARSTM
%token IF ELIF ELSE WHILE DO TRY CATCH SWITCH CASE DEF FOR
%token PLUS MINUS MUL DIV EQL
%token GTR LES GTREQL LESEQL NEQL DEQL AND OR
%token OPRC CPRC OBX CBX OBR CBR
%token CMA SCOL DCOL TER
%token FUNC MAIN
%token WRITE WRITELN READ

%union{
	char *str;
}

%start start

%%

// 1. ASSIGNING VALUES

// 2. ARTHEMATIC OPERATIONS

Arth: PLUS
	| MINUS
	| MUL
	| DIV
	| EQL
	;

// 3. ASSIGNING OPERATORS	

Assig: GTR
	| LES
	| GTREQL
	| LESEQL
	| NEQL
	| DEQL
	| AND
	| OR
	;

// <----------------------- STATEMENTS ----------------------->

// 1. DECLARATION STATEMENT:
Dstm_expression: 
	LET ID		// INDI	
	| LET ID Arth ID'\n'	// ID ARTHEMATIC ID
	| LET ID Arth NUM'\n'
	| LET ID Arth FNUM'\n'
	| LET ID Arth DNUM'\n'	// INDI ART WITH NUM, A=10
	| LET ID Assig ID'\n'	// ID ASSIGMENT ID, ID < ID
	| LET ID Assig NUM'\n'
	| LET ID Assig FNUM'\n'
	| LET ID Assig DNUM'\n'
	| LET ID Assig STRING'\n'
	| LET ID Assig CHAR'\n'
	//	<-------------------- WITH : ------------------------>
	| LET DCOL INT ID Arth NUM'\n'
	| LET DCOL FLOAT ID Arth FNUM'\n'
	| LET DCOL DOUBLE ID Arth DNUM'\n'
	| LET DCOL STRSTM ID Arth STRING'\n'
	| LET DCOL CHARSTM ID Arth CHAR'\n'
	;

// <-------------------- MATHS -------------------------->
/*
calclist:
	| calclist exp '\n' { printf("= %d\n", $1); }
	;

exp: factor
	| exp PLUS factor { $$ = $1 + $3; printf("%d%d%d", $1, $2, $3); } 
	| exp MINUS factor { $$ = $1 - $3; }
	;

factor: term
	| factor MUL term { $$ = $1 * $3; }
	| factor DIV term { $$ = $1 / $3; }
	;

term: NUM
	| ABS term { $$ = $2 >= 0? $2 : - $2; }
	;
*/
// ########### comparision

Compar:
	ID Assig ID 
	;

// 2. IF ELIF ELSE

if_statement:
	Statement IF Compar SCOL Statement ELSE Statement
	| IF Compar SCOL '\n' Statement '\n' ELSE SCOL '\n' Statement
	| IF Compar SCOL Statement ELIF OPRC Compar CPRC SCOL Statement ELSE Statement 
	;

// 3. WHILE STATEMENT

While_statement:
	Statement WHILE OPRC Compar CPRC SCOL Statement 
	;
	
// 4. DO WHILE STATEMENT

Do_While:
	Statement DO OPRC Compar CPRC SCOL Statement WHILE OPRC Compar CPRC
	;

// ############ CASE STM

Case_stm:
	CASE ID SCOL
	;

// 5. SWITCH STATEMENT

Switch_statement:
	Statement SWITCH OPRC ID CPRC SCOL 
	| SWITCH OPRC ID CPRC SCOL Case_stm Statement
	| SWITCH OPRC ID CPRC SCOL Case_stm Statement DEF Statement
	;
	
// 6. FOR STATEMENT

for_A:
	FOR ID EQL ID
	| FOR ID EQL NUM	
	;
	
for_B:
	ID GTR ID
	| ID LES ID
	| ID GTREQL ID
	| ID LESEQL ID
	;
for_C:
	ID PLUS PLUS
	| ID MINUS MINUS
	;
	
For_statement:
	Statement for_A TER for_B TER for_C SCOL
	| for_A TER for_B TER for_C SCOL'\n'
	;
	
// 7. FUNCTION

Function:
	Statement FUNC ID OPRC Statement CPRC OBR Statement CBR;

// 8. RUN FUNCTION

Main:
	FUNC MAIN OPRC Statement CPRC OBR Statement CBR

// 9. WRITE

print_stm:
	Statement print;
print:
	WRITE OPRC STRING CPRC		{ printf("%s", $3); free($3); } 
	| WRITELN OPRC STRING CPRC		{ printf("%s\n", $3); free($3); }
	;
	
//START HERE:

Statement: Statement Dstm_expression 
	//| calclist
	| For_statement
	| Switch_statement
	| Do_While
	| While_statement
	| if_statement
	| Function
	| print_stm
	| Main
	;

start: Statement ;


%%

void yyerror(char *s){

	fprintf(stderr, "Error: %s\n", s);
}

int main(){

	yyparse();
	printf("\nParser is Finsihed\n");

	return 0;
}

