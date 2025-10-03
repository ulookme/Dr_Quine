; Colleen.s — comment outside (obligatoire)

global  main
extern  printf

section .data
; La chaîne S contient le source avec un printf-style quine
S:  db ";\x20Colleen.s — comment outside (obligatoire)%2$c%2$cglobal%2$c%2$c%1$s%2$cextern%2$c%2$c%3$s%2$c%2$csection .data%2$c; La chaîne S contient le source avec un printf-style quine%2$cS:%2$c  db %4$c%5$s%4$c,0%2$cFMT: db %4$c%6$s%4$c,0%2$c%2$csection .text%2$cprint_source:%2$c  push rbp%2$c  mov rbp, rsp%2$c  lea rdi, [rel FMT]%2$c  lea rsi, [rel S]%2$c  mov edx, 10%2$c  mov ecx, 34%2$c  xor eax, eax%2$c  call printf%2$c  mov eax, 0%2$c  pop rbp%2$c  ret%2$c%2$cmain:%2$c  ; comment inside main (obligatoire)%2$c  push rbp%2$c  mov rbp, rsp%2$c  call print_source%2$c  mov eax, 0%2$c  pop rbp%2$c  ret%2$c",0

; pour lisibilité, on sépare les sous-chaînes passées à printf
FMT: db "%1$s",10,0

section .text
print_source:
  push rbp
  mov rbp, rsp
  lea rdi, [rel FMT]   ; "%1$s\n"
  lea rsi, [rel S]     ; arg1 = S
  mov edx, 10          ; %2$c = '\n'
  mov ecx, 34          ; %3$c/%4$c = '"'
  xor eax, eax
  call printf
  mov eax, 0
  pop rbp
  ret

main:
  ; comment inside main (obligatoire)
  push rbp
  mov rbp, rsp
  call print_source
  mov eax, 0
  pop rbp
  ret
