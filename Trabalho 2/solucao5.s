.section .data
  titulo:       .asciz "\n*** Ordena Vetor Bubble Sort ***\n\n"
  pedetam:      .asciz "Digite o tamanho do vetor (maximo=20) => "
  formato:      .asciz "%d"
  pedenum:      .asciz "Entre com o elemento %d => "
  mostra1:      .asciz "Elementos Lidos:"
  mostra2:      .asciz " %d"
  mostra3:      .asciz "\nElementos Ordenados:"
  pulalin:      .asciz "\n"

  maxtam:       .int 20
  tam:          .int 0
  tamaux:       .int 0
  num:          .int 0
  soma:         .int 0
  vetor:        .space 80

.section .text
.globl _start
_start:

  pushl $titulo
  call printf

letam:
  pushl $pedetam
  call printf
  pushl $tam
  pushl $formato
  call scanf
  pushl $pulalin
  call printf

  movl tam, %ecx
  movl %ecx, tamaux
  cmpl $0, %ecx
  jle letam
  cmpl maxtam, %ecx
  jg letam
  
  movl $vetor,%edi
  addl $16, %esp
  movl $0, %ebx

lenum:
  incl %ebx
  pushl %edi
  pushl %ecx
  pushl %ebx

  pushl $pedenum
  call printf
  pushl $num
  pushl $formato
  call scanf
  pushl $pulalin
  call printf
  addl $16, %esp

  popl %ebx
  popl %ecx
  popl %edi
  movl num, %eax
  movl %eax, (%edi)
  addl $4, %edi
  loop lenum

mostravet:
  pushl $mostra1
  call printf
  addl $4, %esp
  movl tam, %ecx
  movl $vetor, %edi

mostranum:
  movl (%edi), %ebx
  addl $4, %edi

  pushl %edi
  pushl %ecx
  pushl %ebx

  pushl $mostra2
  call printf
  addl $8, %esp

  popl %ecx
  popl %edi
  loop mostranum


  movl tam, %ecx
  cmpl $1, %ecx
  jle mostravet2

ordenavetor:
  movl $vetor, %edi
  movl %edi, %esi
  addl $4, %esi

  subl $1, %ecx
  pushl %ecx

giro:
  movl (%edi), %eax
  movl (%esi), %ebx
  cmpl %eax, %ebx
  jl trocaelemento

avanca:
  addl $4, %edi
  addl $4, %esi
  loop giro

proximociclo:
  movl tamaux, %eax
  decl %eax
  movl %eax, tamaux
  movl %eax, %ecx

  cmpl $1, %ecx
  jle mostravet2
  jmp ordenavetor

trocaelemento:
  movl %eax, (%esi)
  movl %ebx, (%edi)
  jmp avanca

mostravet2:
  pushl $mostra3
  call printf
  addl $4, %esp
  movl tam, %ecx
  movl $vetor, %edi

mostranum2:
  movl (%edi), %ebx
  addl $4, %edi

  pushl %edi
  pushl %ecx
  pushl %ebx

  pushl $mostra2
  call printf
  addl $8, %esp

  popl %ecx
  popl %edi
  loop mostranum2

  pushl $pulalin
  call printf
  pushl $pulalin
  call printf
  addl $8, %esp

fim:
  pushl $0
  call exit
  