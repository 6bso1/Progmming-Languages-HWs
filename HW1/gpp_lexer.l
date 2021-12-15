%option noyywrap
%{
  int count = 0;

%}

%%

and {printf("KW_AND\n");}
	or {printf("KW_OR\n");}
	not {printf("KW_NOT\n");}
	equal {printf("KW_EQUAL\n");}
	less {printf("KW_LESS\n");}
	nil {printf("KW_NIL\n");}
	list {printf("KW_LIST\n");}
	append {printf("KW_APPEND\n");}
	concat {printf("KW_CONCAT\n");}
	set {printf("KW_SET\n");}
	deffun {printf("KW_DEFFUN\n");}
	for {printf("KW_FOR\n");}
	if {printf("KW_IF\n");}
	exit {printf("KW_EXIT\n");}
	load {printf("KW_LOAD\n");}
	disp {printf("KW_DISP\n");}
	true {printf("KW_TRUE\n");}
	false {printf("KW_FALSE\n");}
	[0-9]+.[0-9]+ {printf("VALUE\n");}
	[0-9]+ {printf("VALUE\n");}
	[;][;].* {printf("COMMENT\n");}
	[+] {printf("OP_PLUS\n");}
	[-] {printf("OP_MINUS\n");}
	[/] {printf("OP_DIV\n");}
	[*][*] {printf("OP_DBLMULT\n");}
	[*] {printf("OP_MULT\n");}
	[)] {printf("OP_CP\n");}
	[(] {printf("OP_OP\n");}
	["] {count % 2 == 0 ? printf("OP_OC\n") : printf("OP_CC\n");++count;}
	[,] {printf("OP_COMMA");}
	[a-zA-Z][a-zA-Z0-9]* {printf("IDENTIFIER\n");}
	[0-9][0-9a-zA-Z]+ {printf("SYNTAX ERROR\n");}
	[ ] {};
	. {printf("INVALID CHARACHTER\n");}
%%


int main()
{
    printf("Enter a string: \n");
    yylex();

    return 0;
}