.section .data

  Message: .asciz "Hello World!\n"

.section .text

.globl _start


_start: 
  pushl $Message
  call printf
  addl $4, %esp

  pushl $0
  call exit

