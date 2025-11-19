#include <stdio.h>

#define S "#include <stdio.h>%2$c%2$c#define S %3$c%1$s%3$c%2$c#define F(x)int main(){FILE*f=fopen(%3$cGrace_kid.c%3$c,%3$cw%3$c);if(!f)return 1;fprintf(f,x,x,10,34);fclose(f);return 0;}%2$c#define R F(S)%2$c%2$c/*%2$c This program will print its own source when run.%2$c*/%2$c%2$cR%2$c"
#define F(x)int main(){FILE*f=fopen("Grace_kid.c","w");if(!f)return 1;fprintf(f,x,x,10,34);fclose(f);return 0;}
#define R F(S)

/*
 This program will print its own source when run.
*/

R
