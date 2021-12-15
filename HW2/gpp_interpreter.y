%{
	#include <stdio.h>
	int yylex(void);
	void yyerror(const char *s);
    int liste[100];
    int indexx=0;
    int bin=0;
    int is_list=0;
%}
%union{ int number; char symbol;}
%type <number> EXPI EXPLISTI BinaryValue
%type <number> EXPB
%type<symbol> IDS 
%token KW_AND
%token KW_OR
%token KW_NOT

%token KW_EQUAL
%token KW_LESS
%token KW_NIL
%token KW_LIST
%token KW_APPEND
%token KW_CONCAT
%token KW_SET
%token KW_DEFFUN
%token KW_FOR
%token KW_IF
%token KW_EXIT
%token KW_LOAD
%token KW_DISP
%token KW_TRUE
%token KW_FALSE
%token OP_PLUS
%token OP_MINUS
%token OP_DIV
%token OP_MULT
%token OP_OP
%token OP_CP
%token OP_DBLMULT
%token OP_OC
%token OP_CC
%token OP_COMMA
%token COMMENT
%token<number> VALUE
%token<symbol> IDENTIFIER

%%

START : INPUT START
	| INPUT
;

INPUT : EXPI {if(is_list==0){
    printf("Syntax OK. \nResult: %d \n", $1);}
    else{
        is_list=0;
    }
    indexx =0;
    bin=0;
    is_list=0;}
    | EXPLISTI {printf("Syntax OK. \nResult: ");
    printf("(");
    for(int j=0; j<indexx; j++){
        printf(" %d", liste[j]);
    }
    printf(" )\n");
    indexx =0;
    bin=0;
    is_list=0;}
    | EXPB 
;

 EXPI : OP_OP OP_PLUS EXPI EXPI OP_CP {$$ = $3 + $4;}
    | OP_OP OP_MINUS EXPI EXPI OP_CP {$$ = $3 - $4;}
    | OP_OP OP_MULT EXPI EXPI OP_CP {$$ = $3 * $4;}
    | OP_OP OP_DIV EXPI EXPI OP_CP {$$ = $3 / $4;}
    | IDENTIFIER {is_list=1;}
    | VALUE {$$ = $1;}
    | OP_OP IDENTIFIER EXPLISTI OP_CP 
    | OP_OP KW_IF EXPB EXPLISTI OP_CP {is_list=1;
        if(bin==1){
        printf("(");
        for(int i=0; i<indexx; i++){
            printf(" %d", liste[i]);
        }
        printf(" )\n");
    }}
    | OP_OP KW_IF EXPB EXPLISTI EXPLISTI OP_CP
    | OP_OP KW_FOR OP_OP IDENTIFIER EXPI EXPI OP_CP EXPLISTI OP_CP
    | OP_OP KW_FOR OP_OP IDENTIFIER EXPI EXPI OP_CP EXPLISTI OP_CP
    | OP_OP KW_SET IDENTIFIER EXPI OP_CP {$$ = $4;}
;

EXPB : OP_OP KW_AND EXPB EXPB OP_CP {bin = $3 && $4;
        if(bin==0){
            printf("Syntax OK. \nResult = false\n");}
        else{
            printf("Syntax OK. \nResult = true\n");
        }
        }
    | OP_OP KW_OR EXPB EXPB OP_CP {bin = $3 || $4;
        if(bin==0){
            printf("Syntax OK. \nResult = false\n");}
        else{
            printf("Syntax OK. \nResult = true\n");
        }
        }
    | OP_OP KW_NOT EXPB OP_CP {bin = !$3;
        if(bin==0){
            printf("Syntax OK. \nResult = false\n");}
        else{
            printf("Syntax OK. \nResult = true\n");
        }
        }
    | OP_OP KW_EQUAL EXPB EXPB OP_CP {bin = $3 == $4;
        if(bin==0){
            printf("Syntax OK. \nResult = false\n");}
        else{
            printf("Syntax OK. \nResult = true\n");
        }
        }
    | OP_OP KW_EQUAL EXPI EXPI OP_CP {bin = $3 == $4;
        if(bin==0){
            printf("Syntax OK. \nResult = false\n");}
        else{
            printf("Syntax OK. \nResult = true\n");
        }
        }
    | BinaryValue
    | VALUE {$$ = $1;}
;

EXPLISTI : OP_OP KW_CONCAT EXPLISTI EXPLISTI OP_CP
    | OP_OP KW_APPEND EXPI EXPLISTI OP_CP { is_list=1;
        liste[indexx] = $3;
        indexx++;
        }
    | LISTVALUE
    | KW_NIL
;

LISTVALUE : OP_OP KW_LIST VALUES OP_CP
    | OP_OC OP_OP OP_CP
    | KW_NIL
;

VALUES : VALUES VALUE {
    liste[indexx] = $2;
    indexx++;}
    | VALUE {
        liste[indexx] = $1;
        indexx++;}
;

BinaryValue : KW_TRUE {$$ = 1;}
    | KW_FALSE {$$ = 0;}
;

%%



void yyerror(const char *s)
{
	fprintf(stderr, "%s\n", s);
}

int main()
{
	yyparse();
	return 0;
}