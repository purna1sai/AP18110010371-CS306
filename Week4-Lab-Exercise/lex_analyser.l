%option noyywrap
digit [+-]?[0-9]+
id [a-zA-Z_][a-zA-Z0-9_]*
num [+-]?[0-9]*\.[0-9]+
exp {digit}[e]{digit}
keywords "int"|"char"|"float"|"void"|"double"|"if"|"else"|"for"|"while"|"do"|"switch"|"case"|"break"|"unsigned"|"main"
%{
#include<string.h>
char symb_tab[20][30];
void store_symb_tab(char* id);
%}
%%
"/"([^]|\+[^/])\+"/" fprintf(yyout,"multi-line comment\n"); 
"//".*\n   fprintf(yyout,"single-line comment\n");
{keywords} fprintf(yyout,"%s: keyword\n",yytext);
"<="       fprintf(yyout,"%s: Relational operator LE\n",yytext);
"<"	   fprintf(yyout,"%s: Relational operator LT\n",yytext);
">="       fprintf(yyout,"%s: Relational operator GE\n",yytext);
">"	   fprintf(yyout,"%s: Relational operator GT\n",yytext);
"=="	   fprintf(yyout,"%s: Relational operator EQ\n",yytext);
"!="	   fprintf(yyout,"%s: Relational operator NE\n",yytext);
"="	   fprintf(yyout,"%s: Assignment operator\n",yytext);
{exp}	   fprintf(yyout,"%s: exponential float\n",yytext);
{num}	   fprintf(yyout,"%s: fractional float\n",yytext);
{digit}    fprintf(yyout,"%s: digit\n",yytext);
{id}     { fprintf(yyout,"%s: identifier\n",yytext); store_symb_tab(yytext); }
" "|\n   
.	   fprintf(yyout,"%s: \n",yytext);
%%
main(int a,char **s) 
{
 yyin=fopen(s[1],"r");
 yyout=fopen("out.txt","w"); 
 yylex();
 fprintf(yyout,"\nSymbol table:\n");
 int i=0;
 for(;strcmp(symb_tab[i],"")&&i<20;++i)
   fprintf(yyout,"\n%d. %s",i+1,symb_tab[i]);
}
void store_symb_tab(char* id)
{
  int i;
  for(i=0; strcmp(symb_tab[i],"")&&i<20;++i)
    if(!strcmp(symb_tab[i],id))
      return;
  if(i==20)
  { fprintf(yyout,"Overflow!\n"); return;}    
  strcpy(symb_tab[i],id);		
}
