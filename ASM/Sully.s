global  main
extern  fopen
extern  fprintf
extern  fclose
extern  sprintf
extern  system

section .data
; Gabarit du source enfant : même fichier, avec i remplacé par %d-1 dans la chaine
SRC: db "global  main%2$cextern  fopen%2$cextern  fprintf%2$cextern  fclose%2$cextern  sprintf%2$cextern  system%2$c%2$csection .data%2$ci: dd %5$d%2$cSRC: db %3$c%1$s%3$c,0%2$cFMT: db %3$c%4$s%3$c,0%2$cNAMEFMT: db %3$cSully_%%d.s%3$c,0%2$cCMDFMT:  db %3$cnasm -felf64 Sully_%%d.s -o Sully_%%d.o && gcc -no-pie Sully_%%d.o -o Sully_%%d && ./Sully_%%d%3$c,0%2$c%2$csection .bss%2$cname: resb 32%2$ccmd:  resb 256%2$c%2$csection .text%2$cmain:%2$c  push rbp%2$c  mov rbp, rsp%2$c  mov eax, [rel i]%2$c  mov ebx, eax%2$c  ; if(i < 0) return 0;%2$c  cmp eax, 0%2$c  jl .end%2$c  ; name = sprintf(""Sully_%%d.s"", i)%2$c  lea rdi, [rel name]%2$c  lea rsi, [rel NAMEFMT]%2$c  mov edx, ebx%2$c  xor eax, eax%2$c  call sprintf%2$c  ; fopen(name, ""w"")%2$c  lea rdi, [rel name]%2$c  lea rsi, [rel MODE]%2$c  call fopen%2$c  test rax, rax%2$c  jz .maybe_run%2$c  mov r12, rax%2$c  ; fprintf(f, SRC, SRC,10,34, i-1)%2$c  mov rdi, r12%2$c  lea rsi, [rel FMT]%2$c  lea rdx, [rel SRC]%2$c  mov rcx, 10%2$c  mov r8, 34%2$c  mov r9d, ebx%2$c  dec r9d%2$c  sub rsp, 40%2$c  call fprintf%2$c  add rsp, 40%2$c  mov rdi, r12%2$c  call fclose%2$c.maybe_run:%2$c  ; if(i > 0) system(""nasm ... && gcc ... && ./Sully_i"")%2$c  cmp ebx, 0%2$c  jle .end%2$c  ; sprintf(cmd, CMDFMT, i,i,i,i)%2$c  lea rdi, [rel cmd]%2$c  lea rsi, [rel CMDFMT]%2$c  mov edx, ebx%2$c  mov ecx, ebx%2$c  mov r8d, ebx%2$c  mov r9d, ebx%2$c  sub rsp, 32%2$c  call sprintf%2$c  add rsp, 32%2$c  lea rdi, [rel cmd]%2$c  call system%2$c.end:%2$c  mov eax, 0%2$c  pop rbp%2$c  ret%2$c",0

FMT:    db "%1$s",10,0
MODE:   db "w",0
NAMEFMT: db "Sully_%d.s",0
CMDFMT:  db "nasm -felf64 Sully_%d.s -o Sully_%d.o && gcc -no-pie Sully_%d.o -o Sully_%d && ./Sully_%d",0

section .bss
name:   resb 32
cmd:    resb 256

section .data
i:      dd 5

section .text
main:
  push rbp
  mov rbp, rsp
  mov eax, [rel i]
  mov ebx, eax
  cmp eax, 0
  jl .end

  ; name = sprintf(name, "Sully_%d.s", i)
  lea rdi, [rel name]
  lea rsi, [rel NAMEFMT]
  mov edx, ebx
  xor eax, eax
  call sprintf

  ; f = fopen(name, "w")
  lea rdi, [rel name]
  lea rsi, [rel MODE]
  call fopen
  test rax, rax
  jz .maybe_run
  mov r12, rax

  ; fprintf(f, SRC, SRC,10,34, i-1)
  mov rdi, r12
  lea rsi, [rel FMT]
  lea rdx, [rel SRC]
  mov rcx, 10
  mov r8, 34
  mov r9d, ebx
  dec r9d
  sub rsp, 40
  call fprintf
  add rsp, 40

  mov rdi, r12
  call fclose

.maybe_run:
  cmp ebx, 0
  jle .end

  ; sprintf(cmd, CMDFMT, i,i,i,i)
  lea rdi, [rel cmd]
  lea rsi, [rel CMDFMT]
  mov edx, ebx
  mov ecx, ebx
  mov r8d, ebx
  mov r9d, ebx
  sub rsp, 32
  call sprintf
  add rsp, 32

  lea rdi, [rel cmd]
  call system

.end:
  mov eax, 0
  pop rbp
  ret
