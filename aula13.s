.section .data
  abert: .asciz "\nPrograma para ordenar 3 numeros\n\n"
  pedeN: .asciz "\nDigite N%d => "
  tipoN: .asciz "%d"

  mostra: .asciz "\nNumeros Ordenados: %d, %d, %d\n\n"

  perg: .asciz "\nDeseja realizar nova ordenacao? <S>im\\ <N>ao"

  tipoC: .asciz "%c"

  n1: .int 0
  n2: .int 0
  n3: .int 0

  resp: .byte 'n'

.section .text
.globl _start
_start:

  pushl $abert
  call printf

  pushl $1
  pushl $pedeN
  call printf
  pushl $n1
  pushl $tipoN
  call scanf

  pushl $2
  pushl $pedeN
  call printf
  pushl $n2
  pushl $tipoN
  call scanf

  pushl $3
  pushl $pedeN
  call printf
  pushl $n3
  pushl $tipoN
  call scanf

  addl $52, %esp

  mov n2, %eax
  cmpl n1, %eax
  jg n1_n2

n2_n1:
  movl n3, %eax
  cmpl n1, %eax
  jg n2_n1_n3

  cmpl  n2, %eax
  jg n2_n3_n1

n3_n2_n1:
  pushl n1
  pushl n2
  pushl n3
  jmp fim

n2_n3_n1:
  pushl n1
  pushl n3
  pushl n2
  jmp fim

n2_n1_n3:
  pushl n3
  pushl n1
  pushl n2
  jmp fim

n1_n2:
  movl n3, %eax
  cmpl n2, %eax
  jg n1_n2_n3

  cmpl n1, %eax
  jg n1_n3_n2

n3_n1_n2: 
  pushl n2
  pushl n1
  pushl n3
  jmp fim

n1_n3_n2:
  pushl n2
  pushl n3
  pushl n1
  jmp fim

n1_n2_n3:
  pushl n3
  pushl n2
  pushl n1

fim:
  pushl $mostra 
  call printf

  addl $16, %esp

  pushl $perg
  call printf

  pushl $resp
  pushl $tipoC
  call scanf

  movb resp, %al
  cmpb $'s', %al
  je _start


  pushl $0
  call exit
