/*** Author: Tamer Elsawaf ***/
/*** Systems Programming /  STATEMENT PARSER Project 3 */
%{
#include <stdio.h>
using namespace std;

#include "parser.tab.h"


%}

%%

[a-zA-Z][a-zA-Z0-9]*                    {yylval.print = strdup(yytext); return ID; printf(yytext);}
;                                       {return EOL;}
\(                                      {return OPENBracket;}
\)                                      {return CLOSEBracket;}
[0-9]                                   ;
[-+*/%]                                 {yylval.print = strdup(yytext); return OP;}
=                                       {return EQU;}
\r                                      ;
\n                                      {return NEWLINE;}
[[:space:]]                             ;
.                                       { return NASymbol; }
%%
