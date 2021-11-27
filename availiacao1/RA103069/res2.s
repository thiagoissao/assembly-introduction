.section .data
  abertura:               .asciz "\nSolucao exercicio 2\n"
  saidaRetangulo:         .asciz "Area do retangulo = %d\n"
  saidaTriangulo:         .asciz "Area do triangulo = %d\n"
  saidaCircunferencia:    .asciz "Area da circunferencia = %d\n"

  pedeBaseRaio:           .asciz "Digite a base/raio = "
  pedeAltura:             .asciz "Digite a altura = "

  formato:                .asciz "%d"

  base:                   .int 0
  altura:                 .int 0
  resRetangulo:           .int 0
  resTriangulo:           .int 0
  resCircunferencia:      .int 0                   

.section .text
.globl _start
_start:

  pushl $abertura
  call printf

  pushl $pedeBaseRaio
  call printf
  pushl $base
  pushl $formato
  call scanf

  pushl $pedeAltura
  call printf
  pushl $altura
  pushl $formato
  call scanf

  movl base, %eax
  mull altura
  movl %eax, resRetangulo

  pushl resRetangulo
  pushl $saidaRetangulo
  call printf

  movl base, %eax
  mull altura
  movl $2, %ebx
  div %ebx
  movl %eax, resTriangulo

  pushl resTriangulo
  pushl $saidaTriangulo
  call printf

  movl base, %eax
  mull base
  movl $3, %ebx
  mull %ebx
  movl %eax, resCircunferencia

  pushl resCircunferencia
  pushl $saidaCircunferencia
  call printf

  addl $52, %esp

  pushl $0
  call exit
