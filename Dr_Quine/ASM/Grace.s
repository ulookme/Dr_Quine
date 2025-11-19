; Comment obligatoire
%define FILENAME "Grace_kid.s"
%define SRC "; Comment obligatoire%1$c%%define FILENAME %2$cGrace_kid.s%2$c%1$c%%define SRC %2$c%3$s%2$c%1$c%%macro RUN 0%1$cglobal main%1$cextern fopen, fprintf, fclose%1$csection .data%1$c  fn: db FILENAME,0%1$c  md: db %2$cw%2$c,0%1$c  src: db SRC,0%1$csection .text%1$cmain:%1$c  push rbp%1$c  mov rbp,rsp%1$c  lea rdi,[rel fn]%1$c  lea rsi,[rel md]%1$c  call fopen%1$c  test rax,rax%1$c  jz .e%1$c  mov r12,rax%1$c  mov rdi,r12%1$c  lea rsi,[rel src]%1$c  mov edx,10%1$c  mov ecx,34%1$c  lea r8,[rel src]%1$c  xor eax,eax%1$c  call fprintf%1$c  mov rdi,r12%1$c  call fclose%1$c.e:%1$c  xor eax,eax%1$c  pop rbp%1$c  ret%1$c%%endmacro%1$cRUN"
%macro RUN 0
global main
extern fopen, fprintf, fclose
section .data
  fn: db FILENAME,0
  md: db "w",0
  src: db SRC,0
section .text
main:
  push rbp
  mov rbp,rsp
  lea rdi,[rel fn]
  lea rsi,[rel md]
  call fopen
  test rax,rax
  jz .e
  mov r12,rax
  mov rdi,r12
  lea rsi,[rel src]
  mov edx,10
  mov ecx,34
  lea r8,[rel src]
  xor eax,eax
  call fprintf
  mov rdi,r12
  call fclose
.e:
  xor eax,eax
  pop rbp
  ret
%endmacro
RUN