%option noyywrap
%{
#include <stdio.h>
%}

digit         [0-9]
lex_digit     [0-9a-fA-F]
exp           [eE]

%%

0{digit}+ {printf("Integer Constant (Octal): %s\n", yytext);}

{digit}+                        { printf("Integer constant (Decimal): %s\n", yytext); }

0[xX]{lex_digit}+               { printf("Integer constant (Hexadecimal): %s\n", yytext); }

[a-zA-Z_][a-zA-Z0-9_]*          { printf("Identifier: %s\n", yytext); }

{digit}+"."{digit}+             { printf("Real constant (Floating Point): %s\n", yytext); }

{digit}+"."{digit}+{exp}[-+]?{digit}+  { printf("Real constant (Exponential): %s\n", yytext); }

{digit}+{exp}[-+]?{digit}+      { printf("Real constant (Exponential): %s\n", yytext); }

.                               { /* Ignore all other characters */ }

%%

int main() {
    yylex();
    return 0;
}
