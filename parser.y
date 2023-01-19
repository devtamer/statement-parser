/*** Author: Tamer Elsawaf ***/
/*** Systems Programming /  STATEMENT PARSER Project 3 */
%{
  void yyerror(const char *s);
  #include <stdio.h>
  using namespace std;

  extern int yylex();
  extern int yyparse();
  extern FILE *yyin;
 

%}

%union{
	
	char *print; //For tokens that need to be printed

}

//Token declarations

%token EQU
%token <print> ID
%token EOL
%token <print> OP
%token OPENBracket
%token CLOSEBracket
%token NEWLINE
%token NASymbol

// handles returning type of errror found for invalid statements
%error-verbose

%%


// to handle each line of input file
function: line
	|	function line
;

// Checks if line is valid assignment, expression or invalid error
line: assignment NEWLINE {printf(" -- Valid\n");}
	|	expression NEWLINE {printf(" -- Valid\n");}
	|	error NEWLINE {yyerrok;}
;

//Assignment, such as "good = ONE + twenty - three3 ;"
assignment: ID {printf($1);} EQU {printf(" = "); } expression EOL {printf(";");}
;

//Expression, either as an assignment or as a statement on its own
expression: term
	|	expression op term 
;

// Term is either a variable or a number
term: id 
	|	OPENBracket {printf("(");} expression op term CLOSEBracket {printf(")");}
;

// prints ID which flex returns when foudn in bison 
id: ID {printf($1);}
;

op: OP {printf(" "); printf($1);}
;
%%

int main(int, char**) {
  // OPENBracket a file handle to a particular file:
FILE *fp;
char filename[50];
printf("Enter the filename (eg: test.txt): \n");
scanf("%s",filename);
fp = fopen(filename,"r");
yyin = fp;
  
  // Parse through the input:
  yyparse();
  
}

void yyerror(const char *s) {
    printf(" ");
    printf(" -- Invalid: %s\n", s);
} 




