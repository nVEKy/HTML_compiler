%{
	#include <stdio.h>
	#include <string.h>

	extern int yylineno;
	extern int yylex();
	extern char* yytext;
	int error=0;
	int num_error[5];
	char str_error[5][20];

	void yyerror(char *str){
		num_error[error]=yylineno;
		strcpy(str_error[error++], yytext);
	}
%}

%start core

%token DOCTYPE TAG NUM TEXT

%%

core: DOCTYPE html

attributes: 
	|attributes attribute

attribute: TEXT '=' '"'TEXT'"'

html: '<' TAG attributes '>' {if(strcmp($2, "html") != 0) yyerror("no html");}

		   
%%

int main(int argc, void *argv[])
{
    while(yyparse());
    
	if (error==0)
    	printf("OK\n");
	else{
		fprintf (stderr, "NOT OK.\n");
		for(int i = 0; i < error; ++i){
			printf("Error on line: %d - %s\n", num_error[i], str_error[i]);
		}
	}
}