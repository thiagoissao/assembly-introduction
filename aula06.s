.section .data
  
  output: .ascii "O ID do fabricante é 'xxxxxxxxxxxx'!\n"

.section .text

.globl _start

_start: 

  movl $0, %eax
  cpuid

  movl $output, %edi
  movl %ebx, 23(%edi) #caractere 24 da area apontada
  movl %ecx, 27(%edi) #caractere 28 da area apontada
  movl %edx, 31(%edi) #caracatere 32 da area apontada

  movl $4, %eax
  movl $1, %ebx
  movl $output, %ecx
  movl $38, %edx
  int $0x80

  movl $1, %eax #codigo da chamada ao sistema exit
  movl $0, %ebx #codigo do termino normal da aplicacao
  int $0x80
  