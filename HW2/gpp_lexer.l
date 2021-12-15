%option noyywrap
%{
  int count = 0;
  #include "gpp_interpreter.tab.h"

%}

%%
[ ] {};
and {return KW_AND;}
	or {return KW_OR;}
	not {return KW_NOT;}
	equal {return KW_EQUAL;}
	less {return KW_LESS;}
	nil {return KW_NIL;}
	list {return KW_LIST;}
	append {return KW_APPEND;}
	concat {return KW_CONCAT;}
	set {return KW_SET;}
	deffun {return KW_DEFFUN;}
	for {return KW_FOR;}
	if {return KW_IF;}
	exit {return KW_EXIT;}
	load {return KW_LOAD;}
	disp {return KW_DISP;}
	true {return KW_TRUE;}
	false {return KW_FALSE;}
	
	[;][;].* {return COMMENT;}
	[+] {return OP_PLUS;}
	[-] {return OP_MINUS;}
	[/] {return OP_DIV;}
	[*][*] {return OP_DBLMULT;}
	[*] {return OP_MULT;}
	[)] {return OP_CP;}
	[(] {return OP_OP;}
	["] {if(count % 2 == 0){ 
			++count;
			return OP_OC;} 
		else{ 
			++count;
			return OP_CC;}}
	[,] {return OP_COMMA;}
	[a-zA-Z][a-zA-Z0-9]* {yylval.symbol = yytext[0]; return IDENTIFIER;}
	
	[0-9]* {yylval.number = atoi(yytext); return VALUE;}
	[0-9]+"."[0-9]+ {yylval.number = atoi(yytext); return VALUE;}
	
	
	
	. {}
%%


