#include <stdio.h>
#include <stdlib.h>

#define SRC "#include <stdio.h>%2$c#include <stdlib.h>%2$c%2$c#define SRC %3$c%1$s%3$c%2$c%2$cint main(){%2$c    int i = %4$d;%2$c    if(i < 0) return 0;%2$c    char fname[32];%2$c    char bin[32];%2$c    sprintf(fname,%3$cSully_%%d.c%3$c,i);%2$c    FILE*f=fopen(fname,%3$cw%3$c);%2$c    if(!f) return 1;%2$c    fprintf(f,SRC,SRC,10,34,i-1);%2$c    fclose(f);%2$c    if(i >= 0){%2$c        sprintf(bin,%3$cSully_%%d%3$c,i);%2$c        char cmd[160];%2$c        sprintf(cmd,%3$cclang -Wall -Wextra -Werror -o %%s %%s && ./%%s%3$c,bin,fname,bin);%2$c        system(cmd);%2$c    }%2$c    return 0;%2$c}"

int main(){
    int i = 5;
    if(i < 0) return 0;
    char fname[32], bin[32];
    sprintf(fname, "Sully_%d.c", i);
    FILE *f = fopen(fname, "w");
    if(!f) return 1;
    fprintf(f, SRC, SRC, 10, 34, i - 1);
    fclose(f);
    if(i >= 0){
        sprintf(bin, "Sully_%d", i);
        char cmd[160];
        sprintf(cmd, "clang -Wall -Wextra -Werror -o %s %s && ./%s", bin, fname, bin);
        system(cmd);
    }
    return 0;
}
