.section .data
  abertura:     .asciz "\nPrograma para calcular area retangulo\n"
  saida:        .asciz "\n Area do retangulo = %d\n"

  pedeAltura:   .asciz "\n Digite a altura = "
  pedeBase:     .asciz "\n Digite a base = "

  formato:      .asciz "%d"

  altura:   .int 0
  base:     .int 0
  res:      .int 0

.section .text
.globl _start
_start:

    pushl $abertura
    call printf

    pushl $pedeAltura
    call printf
    pushl $altura
    pushl $formato
    call scanf

    pushl $pedeBase
    call printf
    pushl $base
    pushl $formato
    call scanf

    movl base, %eax
    mull altura
    movl %eax, res

    pushl res
    pushl $saida
    call printf
    addl $36, %esp

    pushl $0
    call exit
