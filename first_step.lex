%{
	#include "second_step.tab.h"
	void yyerror(char *str);
%}

%option yylineno
%option noyywrap


%%
"<!DOCTYPE html>"                         return DOCTYPE;
[a-zA-Z][a-zA-Z0-9]                       return TAG;
[0-9]+                                    return NUM;
[<>/="]                                     return yytext;
[a-zA-Z0-9 _]                             return TEXT;
"<!--".*"-->"               ;
[ \t\r\n]                   ;
"EOF"                                         error(*yytext);
                                    
%%





