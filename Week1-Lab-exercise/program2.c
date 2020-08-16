/*
Question : Implementation of Language recognizer for set of all strings ending with two symbols of
same type.
*/

#include <stdio.h>
#include <stdlib.h>
int main()
{
 char str[100];
 int i,state=0;
 printf("Enter the string to be checked : ");
 scanf("%s",str);
 for(i=0;str[i]!='\0';i++)
 {
  switch(state)
  {
   case 0: if(str[i]=='a')
            state=1;
        else if(str[i]=='b')
            state=2;
        break;
    case 1: if(str[i]=='a')
            state=0;
        else if(str[i]=='b')
            state=2;
        break;
    case 2: if(str[i]=='a')
            state=1;
        else if(str[i]=='b')
            state=3;
        break;
    case 3: if(str[i]=='a')
            state=1;
        else if(str[i]=='b')
            state=3;
        break;
    case 4: if(str[i]=='a')
            state=1;
        else if(str[i]=='b')
            state=4;
        break;
  }
 }
 if(state==0||state==3) 
    printf("String Accepted");
 else 
    printf("String Invalid"); 
}
