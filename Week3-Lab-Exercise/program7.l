/* 7. Add line number before each line in a file */
%option noyywrap
%{ 
  int c=1; 
%}
%%
.*  fprintf(yyout,"%s",yytext);
\n  fprintf(yyout,"\n%d ",++c);
%%
main(int a,char **s) 
{
 yyin=fopen(s[1],"r");
 yyout=fopen("7out.txt","w"); 
 fprintf(yyout,"%d ",c);
 yylex();
}
