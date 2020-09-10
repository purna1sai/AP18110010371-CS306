/* 3. Count number of vowels and consonants */
%option noyywrap
%{
  int v=0,c=0;
%}
%%
[aeiouAEIOU]    ++v; 
[a-zA-Z]	++c;
.	
%%
main()
{
  yylex();
  printf(" no. of vowels=%d \n no.of consonants=%d",v,c);
}
