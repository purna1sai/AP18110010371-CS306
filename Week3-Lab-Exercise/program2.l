/* 2. Count the number of Lines in given input */
%{
int num_lines=0;
%}
%%
\n ++num_lines;
%%
main()
{
yylex();
printf(“no of lines=%d”,num_lines);
}
int yywrap()
{
return 1;
}
