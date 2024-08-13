all:
	flex first_step.lex
	bison -d second_step.y
	gcc -o compiler lex.yy.c second_step.tab.c

