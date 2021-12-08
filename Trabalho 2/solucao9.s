.section .data

  titulo:                 .asciz "\nPROGRAMA PARA CALCULAR AREAS\n\n"
  menu:                   .asciz "\n1 - QUADRATICO\n2 - CIRCUNFERENCIA\n3 - TRIANGULO\n4 - SAIR\n>"
  msgerro:                .asciz "\nOpcao Invalida!\n"
  pedelado1:              .asciz "\nDigite o lado 1: "
  pedelado2:              .asciz "\nDigite o lado 2: "
  pederaio:               .asciz "\nDigite o raio: "
  pedebase:               .asciz "\nDigite a base: "
  pedealtura:             .asciz "\nDigite a altura: "

  mostraarea:             .asciz "\nArea = %f\n"

  resp:                   .int 0
  
  lado1:                  .float 0
  lado2:                  .float 0
  
  base:                   .float 0
  altura:                 .float 0

  raio:                   .float 0
  
  dois:                   .float 2

  area:                   .double 0

  formanum:               .asciz "%d"
  formanumf:              .asciz "%f"

.section .text
.globl _start
_start:

    pushl $titulo
    call printf
    finit

menuop:
  pushl $menu
  call printf
  pushl $resp
  pushl $formanum
  call scanf

  addl $16, %esp
  cmpl $1, resp
  jz calcquad
  cmpl $2, resp
  jz calccirc
  cmpl $3, resp
  jz calctri
  cmpl $4, resp
  jz fim

  pushl $msgerro
  call printf
  jmp menuop

calcquad:
  pushl $pedelado1
  call printf
  pushl $lado1
  pushl $formanumf
  call scanf

  pushl $pedelado2
  call printf
  pushl $lado2
  pushl $formanumf
  call scanf

  flds lado1
  fmuls lado2

  subl $8, %esp
  fstpl (%esp)

  pushl $mostraarea
  call printf
  addl $36, %esp

  jmp menuop

calccirc:
  pushl $pederaio
  call printf
  pushl $raio
  pushl $formanumf
  call scanf

  flds raio
  fmuls raio
  fldpi
  fmul %st(1), %st(0)

  subl $8, %esp
  fstpl (%esp)
  pushl $mostraarea
  call printf

  addl $24, %esp
  jmp menuop

calctri:
  pushl $pedebase
  call printf
  pushl $base
  pushl $formanumf
  call scanf

  pushl $pedealtura
  call printf
  pushl $altura
  pushl $formanumf
  call scanf

  flds base
  fmuls altura
  fdivs dois

  subl $8, %esp
  fstpl (%esp)
  pushl $mostraarea
  call printf

  addl $36, %esp
  jmp menuop

fim:
  pushl $0
  call exit
