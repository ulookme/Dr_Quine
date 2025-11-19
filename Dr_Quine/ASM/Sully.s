; i = 5
global main
extern fopen, fprintf, fclose, sprintf, system

section .data
i: dd 5
src: db "; i = %4$d%1$cglobal main%1$cextern fopen, fprintf, fclose, sprintf, system%1$c%1$csection .data%1$ci: dd %4$d%1$csrc: db %2$c%3$s%2$c,0%1$cfn: db %2$cSully_%%d.s%2$c,0%1$cmd: db %2$cw%2$c,0%1$ccmd: db %2$cnasm -f elf64 Sully_%%1$d.s && gcc -no-pie Sully_%%1$d.o -o Sully_%%1$d && ./Sully_%%1$d%2$c,0%1$c%1$csection .bss%1$cfilename: resb 64%1$ccmdline: resb 256%1$c%1$csection .text%1$cmain:%1$c  push rbp%1$c  mov rbp,rsp%1$c  push rbx%1$c  push r12%1$c  push r13%1$c  push r14%1$c  mov ebx,[rel i]%1$c  mov r14d,ebx%1$c  dec r14d%1$c  cmp r14d,0%1$c  jl .end%1$c  lea rdi,[rel filename]%1$c  lea rsi,[rel fn]%1$c  mov edx,r14d%1$c  xor eax,eax%1$c  call sprintf%1$c  lea rdi,[rel filename]%1$c  lea rsi,[rel md]%1$c  call fopen%1$c  test rax,rax%1$c  jz .run%1$c  mov r12,rax%1$c  mov rdi,r12%1$c  lea rsi,[rel src]%1$c  mov edx,10%1$c  mov ecx,34%1$c  lea r8,[rel src]%1$c  mov r9d,r14d%1$c  xor eax,eax%1$c  call fprintf%1$c  mov rdi,r12%1$c  call fclose%1$c.run:%1$c  cmp ebx,0%1$c  jle .end%1$c  lea rdi,[rel cmdline]%1$c  lea rsi,[rel cmd]%1$c  mov edx,r14d%1$c  xor eax,eax%1$c  call sprintf%1$c  lea rdi,[rel cmdline]%1$c  call system%1$c.end:%1$c  pop r14%1$c  pop r13%1$c  pop r12%1$c  pop rbx%1$c  xor eax,eax%1$c  pop rbp%1$c  ret%1$c",0
fn: db "Sully_%d.s",0
md: db "w",0
cmd: db "nasm -f elf64 Sully_%1$d.s && gcc -no-pie Sully_%1$d.o -o Sully_%1$d && ./Sully_%1$d",0

section .bss
filename: resb 64
cmdline: resb 256

section .text
main:
  push rbp
  mov rbp,rsp
  push rbx
  push r12
  push r13
  push r14
  mov ebx,[rel i]
  mov r14d,ebx
  dec r14d
  cmp r14d,0
  jl .end
  lea rdi,[rel filename]
  lea rsi,[rel fn]
  mov edx,r14d
  xor eax,eax
  call sprintf
  lea rdi,[rel filename]
  lea rsi,[rel md]
  call fopen
  test rax,rax
  jz .run
  mov r12,rax
  mov rdi,r12
  lea rsi,[rel src]
  mov edx,10
  mov ecx,34
  lea r8,[rel src]
  mov r9d,r14d
  xor eax,eax
  call fprintf
  mov rdi,r12
  call fclose
.run:
  cmp ebx,0
  jle .end
  lea rdi,[rel cmdline]
  lea rsi,[rel cmd]
  mov edx,r14d
  xor eax,eax
  call sprintf
  lea rdi,[rel cmdline]
  call system
.end:
  pop r14
  pop r13
  pop r12
  pop rbx
  xor eax,eax
  pop rbp
  ret