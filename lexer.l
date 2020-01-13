%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char *yytext;
extern FILE * yyin;
%}
D   [0-9]
L   [a-zA-Z_]
delim [ \t\n]
ws    {delim}+

%%
"int"                             { printf("INT\n"); }
"void"                            { printf("VOID\n"); }
"main"                            { printf("ID\n");}
"return"                          { printf("RETURN\n"); }
"for"                             { printf("FOR\n");}
"while"                           { printf("WHILE\n");}
"if"                              { printf("IF\n"); }
"else"                            { printf("ELSE\n");}
"struct"                          { printf("STRUCT\n");}
";"                               { printf("SEMI\n"); }
","                               { printf("COMMA\n"); }
"="                               { printf("ASSIGNOP\n"); }
(>=)|(<=)|(==)|(!=)|<|>           { printf("RELOP\n"); }
"+"                               { printf("PLUS\n"); }
"-"                               { printf("MINUS\n"); }
"*"                               { printf("STAR\n"); }
"/"                               { printf("DIV\n"); }
"%"                               { printf("MOD\n");}
"^"                               { printf("POWER\n");}
"&&"                              { printf("AND\n"); }
"&"                               { printf("SINGALAND\n"); }
"||"                              { printf("OR\n"); }
"!"                               { printf("NOT\n"); }
"("                               { printf("LP\n"); }
")"                               { printf("RP\n"); }
"["                               { printf("LB\n"); }
"]"                               { printf("RB\n"); }
"{"                               { printf("LC\n"); }
"}"                               { printf("RC\n"); }
"."                               { printf("GETMEMBER\n"); }
{L}({D}|{L})*                     { printf("ID\n"); }
{D}{L}({D}|{L})*                  { printf ("ERRID\n"); }
[ \t\v\f\r\n]                     { }
(([1-9]|-){D}*)|0                     {printf("NUMBER\n");}
%%

int yywrap() {
    return 1;
}

int main(int argc, char* argv[]) {
    if (argc > 2) {
        printf("ERROR, arguement too much!\n");
    } else if (argc == 2) {
        yyin = fopen(argv[1], "rb+");
    }
    yylex();
    return 0;
}
