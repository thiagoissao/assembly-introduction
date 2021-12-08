.section .data
  titulo:         .asciz "\nPrograma que aloca a memoria e insere registros\n\n"
  pedenome:       .asciz "\nDigite o nome: "
  pedera:         .asciz "\nDigite o ra: "
  pedesexo:       .asciz "\nQual o sexo, <F>eminino ou <M>asculino?: "
  pedecurso:      .asciz "\nDigite o nome do curso: "
  mostranome:     .asciz "\nNome: %s"
  mostrara:       .asciz "\nRA: %d"
  mostrasexo:     .asciz "\nSexo: %c"     
  mostracurso:    .asciz "\nCurso: %s\n"
  mostrapt:       .asciz "\nptlista = %d\n"
  formastr:       .asciz "%s"
  formach:        .asciz "%c"
  formanum:       .asciz "%d"
  pulalinha:      .asciz "\n"
  NULL:           .int 0
  naloc:          .int 80
  ptlista1:       .int 0

.section .text
.globl _start
_start:
  jmp main
  
le_dados:
  pushl %edi

  pushl $pedenome
  call printf
  addl $4, %esp
  call gets

  popl %edi
  addl $44, %edi
  pushl %edi

  pushl $pedera
  call printf
  addl $4, %esp
  pushl $formanum
  call scanf
  addl $4, %esp

  popl %edi
  addl $4, %edi
  pushl %edi

  pushl $formach
  call scanf
  addl $4, %esp

  pushl $pedesexo
  call printf
  addl $4, %esp
  pushl $formach
  call scanf
  addl $4, %esp

  popl %edi
  addl $4, %edi
  pushl %edi

  pushl $formach
  call scanf
  addl $4, %esp

  pushl $pedecurso
  call printf
  addl $4, %esp

  call gets

  popl %edi
  addl $24, %edi
  movl $NULL, (%edi)

  subl $76, %edi
  ret


mostra_dados:
  pushl %edi
  
  pushl $mostranome
  call printf
  addl $4, %esp

  popl %edi
  addl $44, %edi
  pushl %edi
  
  pushl (%edi)
  pushl $mostrara
  call printf
  addl $8, %esp

  popl %edi
  addl $4, %edi
  pushl %edi

  pushl (%edi)
  pushl $mostrasexo
  call printf
  addl $8, %esp

  popl %edi
  addl $4, %edi
  pushl %edi

  pushl $mostracurso
  call printf
  addl $4, %esp
  popl %edi
  subl $52, %edi
  ret

main:
  pushl $titulo
  call printf

  movl naloc, %ecx
  pushl %ecx
  call malloc
  movl %eax, ptlista1

  pushl ptlista1
  pushl $mostrapt
  call printf

  addl $16, %esp
  movl ptlista1, %edi
  call le_dados
  call mostra_dados

fim:
  pushl $0
  call exit
