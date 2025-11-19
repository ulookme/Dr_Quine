; Colleen.s — comment outside (obligatoire)

global main
extern printf

section .data
S: db "; Colleen.s — comment outside (obligatoire)%2$c%2$cglobal main%2$cextern printf%2$c%2$csection .data%2$cS: db %3$c%1$s%3$c,0%2$c%2$csection .text%2$cprint_source:%2$c  push rbp%2$c  mov rbp, rsp%2$c  lea rdi, [rel S]%2$c  lea rsi, [rel S]%2$c  mov edx, 10%2$c  mov ecx, 34%2$c  xor eax, eax%2$c  call printf%2$c  pop rbp%2$c  ret%2$c%2$cmain:%2$c  ; comment inside main (obligatoire)%2$c  push rbp%2$c  mov rbp, rsp%2$c  call print_source%2$c  xor eax, eax%2$c  pop rbp%2$c  ret",0

section .text
print_source:
  push rbp
  mov rbp, rsp
  lea rdi, [rel S]
  lea rsi, [rel S]
  mov edx, 10
  mov ecx, 34
  xor eax, eax
  call printf
  pop rbp
  ret

main:
  ; comment inside main (obligatoire)
  push rbp
  mov rbp, rsp
  call print_source
  xor eax, eax
  pop rbp
  ret