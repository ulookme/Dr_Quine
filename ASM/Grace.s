; Grace.s — unique commentaire demandé

global  main
extern  fopen
extern  fprintf
extern  fclose

section .data
SELF:    db "global  main%2$cextern  fopen%2$cextern  fprintf%2$cextern  fclose%2$c%2$csection .data%2$cSELF:%2$c    db %3$c%1$s%3$c,0%2$cNAME:    db %3$cGrace_kid.s%3$c,0%2cMODE:    db %3$cw%3$c,0%2cFMT:     db %3$c%4$s%3$c,0%2$c%2$csection .text%2$cmain:%2$c  push rbp%2$c  mov rbp, rsp%2$c  ; ouvre le fichier et écrit le source%2$c  lea rdi, [rel NAME]%2$c  lea rsi, [rel MODE]%2$c  call fopen%2$c  test rax, rax%2$c  jz .end%2$c  mov r12, rax%2$c  lea rdi, [rel FMT]%2$c  lea rsi, [rel SELF]%2$c  mov edx, 10%2$c  mov ecx, 34%2$c  mov rdi, r12%2$c  ; rdi=FILE*, rsi=fmt, rdx=SELF, rcx=10, r8=34 (on repasse)%2$c  lea rsi, [rel FMT]%2$c  lea rdx, [rel SELF]%2$c  mov r8d, 10%2$c  mov r9d, 34%2$c  sub rsp, 32%2$c  call fprintf%2$c  add rsp, 32%2$c  mov rdi, r12%2$c  call fclose%2$c.end:%2$c  mov eax, 0%2$c  pop rbp%2$c  ret%2$c",0
NAME:    db "Grace_kid.s",0
MODE:    db "w",0
FMT:     db "%1$s",10,0

section .text
main:
  push rbp
  mov rbp, rsp
  ; ouvre le fichier et écrit le source
  lea rdi, [rel NAME]
  lea rsi, [rel MODE]
  call fopen
  test rax, rax
  jz .end
  mov r12, rax

  ; fprintf(FILE*, "%1$s\n", SELF)
  mov rdi, r12
  lea rsi, [rel FMT]
  lea rdx, [rel SELF]
  xor eax, eax
  sub rsp, 32
  call fprintf
  add rsp, 32

  mov rdi, r12
  call fclose
.end:
  mov eax, 0
  pop rbp
  ret
