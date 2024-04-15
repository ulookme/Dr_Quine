#include <stdio.h>
#include <stdlib.h>  // Inclusion de stdlib.h pour la fonction system

#define SULLY_CODE "#include <stdio.h>%2$c#include <stdlib.h>%2$c#define SULLY_CODE %3$c%1$s%3$c%2$cint main() {%2$c    int i = %4$d;%2$c    if (i < 0) return 0;%2$c    char filename[50];%2$c    sprintf(filename, %3$cSully_%%d.c%3$c, i);%2$c    char command[150];%2$c    sprintf(command, %3$cgcc -o Sully_%%d %%s && ./Sully_%%d%3$c, i, filename, i);%2$c    FILE *fp = fopen(filename, %3$cw%3$c);%2$c    if(fp) {%2$c        fprintf(fp, SULLY_CODE, SULLY_CODE, 10, 34, i - 1);%2$c        fclose(fp);%2$c        system(command);%2$c    }%2$c    return 0;%2$c}"

int main() {
    int i = 5;
    if (i < 0) return 0;
    char filename[50];
    sprintf(filename, "Sully_%d.c", i);
    char command[150];
    sprintf(command, "gcc -o Sully_%d %s && ./Sully_%d", i, filename, i);
    FILE *fp = fopen(filename, "w");
    if(fp) {
        fprintf(fp, SULLY_CODE, SULLY_CODE, 10, 34, i - 1);
        fclose(fp);
        system(command);
    }
    return 0;
}