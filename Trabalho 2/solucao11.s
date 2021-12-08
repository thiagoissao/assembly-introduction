.section .data
  titulo:             .asciz "\nPROGRAMA PARA ENCONTRAR RAIZES REAIS\n\n"
  pedeA:              .asciz "\nEntre com o coeficiente a => "
  pedeB:              .asciz "\nEntre com o coeficiente b => "
  pedeC:              .asciz "\nEntre com o coeficiente c => "

  mostraX:            .asciz "\nRaizes Encontradas: X1 = %.2f e X2 = %.2f \n"
  msgErro:            .asciz "\nNao Existem Raizes Reais!\n"
  formato:            .asciz "%lf"

  A:                  .double 0.0
  B:                  .double 0.0
  C:                  .double 0.0
  DELTA:              .double 0.0
  X1:                 .double 0.0
  X2:                 .double 0.0

  quatro:             .double 4.0
  lixo:               .double 0.0
  dois:               .double 2.0
  menosum:            .double -1.0

.section .text
.globl _start
_start:

pedeCoeficientes:
  pushl $titulo
  call printf

  pushl $pedeA
  call printf
  pushl $A
  pushl $formato
  call scanf

  pushl $pedeB
  call printf
  pushl $B
  pushl $formato
  call scanf

  pushl $pedeC
  call printf
  pushl $C
  pushl $formato
  call scanf
  
  finit

calculaDelta:
  fldl B
  fmul %st(0), %st(0)
  fldl quatro
  fmull A
  fmull C
  fsubr %st(1), %st(0)
  fstpl DELTA
  fstpl lixo

verificaDelta:
  fldz
  fldl DELTA
  fcom

  fstsw %ax
  andb $69, %ah

  cmpb $1, %ah
  jz deltaNegativo

calculaRaizes:
  fldl DELTA
  fsqrt 
  fldl A
  fmull dois

  fldl B
  fsubr %st(2), %st(0)
  fdiv %st(1), %st(0)
  fstpl X1

  fldl menosum
  fmul %st(2), %st(0)
  fsubl B
  fdiv %st(1), %st(0)
  fstpl X2

  fstpl lixo

mostraRaizes:
  fldl X2
  subl $8, %esp
  fstpl (%esp)

  fldl X1
  subl $8, %esp

  fstpl (%esp)

  pushl $mostraX
  call printf
  jmp fim

deltaNegativo:
  pushl $msgErro
  call printf

fim:
  pushl $0
  call exit
  