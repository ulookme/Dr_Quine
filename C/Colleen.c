#include <stdio.h>
#define QUOTE(x) #x
#define TOSTRING(x) QUOTE(x)
#define COLLEEN_CODE "#include <stdio.h>%2$c#define QUOTE(x) #x%2$c#define TOSTRING(x) QUOTE(x)%2$c#define COLLEEN_CODE %3$c%1$s%3$c%2$c%2$cvoid print_source() {%2$c  printf(COLLEEN_CODE, COLLEEN_CODE, 10, 34);%2$c}%2$cint main() {%2$c  print_source();%2$c  /* Comment inside main */%2$c  return 0;%2$c}%2$c/* Comment outside */%2$c"

void print_source() {
  printf(COLLEEN_CODE, COLLEEN_CODE, 10, 34);
}
int main() {
  print_source();
  /* Comment inside main */
  return 0;
}
/* Comment outside */
