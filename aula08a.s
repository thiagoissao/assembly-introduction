.section .data

  saida: .asciz "Soma: %d + %d + %d = %d\n"
  n1: .int 10
  n2: .int 25
  n3: .int 5
  v1: .int 10, 25, 5

.section .bss
  .lcomm res, 4

.section .text
.globl _start
_start:

  movl n3, %eax             #coloca valor de n3 no registrador
  addl n2, %eax             #soma em %eax o valor  de n2
  addl n1, %eax             #soma em %eax o valor de n3
  movl %eax, res            #coloca resultado na memória do rótulo res 

  pushl res
  pushl n3
  pushl n2
  pushl n1
  pushl $saida
  call printf
  addl $20, %esp

  movl $v1, %edi
  movl (%edi), %eax
  addl $4, %edi
  addl (%edi), %eax
  addl $4, %edi
  addl (%edi), %eax
  movl %eax, res

  pushl res
  pushl n3
  pushl n2
  pushl n1
  pushl $saida
  call printf
  pushl $0
  call exit
