.section .data
  titulo:                     .asciz "\n*** Programa Multiplica Vetores Ponto Flutuante 1.0 ***\n\n"
  pedeTam:                    .asciz "\nEntre com o tamanho dos vetores A e B => "
  pedeVet:                    .asciz "\nDigite os elementos do vetor %c:\n"

  formatoInt:                 .asciz "%d"
  formatoReal:                .asciz "%lf"

  pedeNum:                    .asciz "\n%c[%d] = "

  mostraVet:                  .asciz "\n\nElementos Lidos do Vetor %c:\n"
  mostraNum:                  .asciz "\n%.2lf"
  mostraPE:                   .asciz "\n\nProduto Escalar = %.2lf\n"

  pulaLin:                    .asciz "\n"

  maxTam:                     .int 50
  tam:                        .int 0
  num:                        .double 0
  prodEsc:                    .double 0

  vetorA:                     .int 0
  vetorB:                     .int 0

  A:                          .int 'A'
  B:                          .int 'B'
  vet:                        .int ''

  limpaBuf:                   .string "%*c"

.section .text
.globl _start

_start:

principal:
  pushl $titulo
  call printf
  finit

  call leTam
  call alocaVetores
  call leVetores
  call printVetores
  call calcPE
  call printPE

  jmp fim

leTam:
  pushl $pedeTam
  call printf
  pushl $tam
  pushl $formatoInt
  call scanf

  pushl $limpaBuf
  call scanf

  addl $16, %esp

  movl tam, %ecx
  cmpl $0, %ecx
  jle leTam
  cmpl maxTam, %ecx
  jg leTam

  ret

alocaVetores:
  movl $8, %eax
  movl tam, %ecx
  mull %ecx
  pushl %eax
  call malloc
  movl %eax, vetorA
  call malloc
  movl  %eax, vetorB

  addl $4, %esp
  ret

leVetores:
  movl A, %eax
  movl %eax, vet

  pushl %eax

  pushl $pedeVet
  call printf
  movl vetorA, %edi
  movl tam, %ecx
  call leNum

  movl B, %eax
  movl %eax, vet

  pushl %eax
  pushl $pedeVet
  call printf
  movl vetorB, %edi
  movl tam, %ecx
  call leNum

  addl $16, %esp
  ret

leNum:
  pushl %ecx
  movl tam, %ebx
  addl $1, %ebx
  subl %ecx, %ebx
  pushl %ebx
  movl vet, %eax
  pushl %eax
  pushl $pedeNum
  call printf
  pushl $num
  pushl $formatoReal
  call scanf

  pushl $limpaBuf
  call scanf

  fldl num
  fstpl (%edi)
  addl $8, %edi

  addl $24, %esp
  popl %ecx
  loop leNum

  ret

printVetores:
  movl A, %eax
  movl %eax, vet
  pushl %eax
  pushl $mostraVet
  call printf
  movl tam, %ecx
  movl vetorA, %edi
  call printNros

  movl B, %eax
  movl %eax, vet
  pushl %eax
  pushl $mostraVet
  call printf
  movl tam, %ecx
  movl vetorB, %edi
  call printNros

  addl $16, %esp
  ret

printNros:
  fldl (%edi)
  addl $8, %edi
  pushl %ecx
  subl $8, %esp
  fstpl (%esp)
  pushl $mostraNum
  call printf

  addl $12, %esp
  popl %ecx
  loop printNros

  ret

calcPE:
  movl $0, prodEsc
  movl tam, %ecx
  movl vetorA, %edi
  movl vetorB, %esp

voltaPE:
  fldl (%edi)
  fmull (%esi)
  faddl prodEsc
  fstpl prodEsc
  addl $8, %edi
  addl $8, %esi
  loop voltaPE

  ret

printPE:
  fldl prodEsc
  subl $8, %esp
  fstpl (%esp)

  pushl $mostraPE
  call printf

  addl $12, %esp
  ret

fim:
  pushl $0
  call exit
