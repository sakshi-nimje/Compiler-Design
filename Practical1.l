%{
#include<stdio.h>
#include<string.h>
int count = 0;
%}
  
%%
(a|b)*abb  {printf("Valid string: ",yytext);}
%%
  
int yywrap(void){}
  
int main()
{   
    yylex();
    return 0;
}