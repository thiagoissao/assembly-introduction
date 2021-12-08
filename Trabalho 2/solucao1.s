.section .data

  titulo:       .asciz "\n*** Programa Inverte Vetor 1.0 ***\n\n"
  pedetam:      .asciz "Digite o tamanho do vetor (maximo=20) => "
  pedeposnum:    .asciz "Digite o numero que vc deseja procurar "
  formato:      .asciz "%d"
  pedenum:      .asciz "Entre com o elemento %d => "
  mostra1:      .asciz "Elementos Lidos:"
  mostra2:      .asciz " %d"
  mostra3:      .asciz "\nElementos Invertdos:"
  mostra4:      .asciz "Elemento encontrado na posicao: "
  notFoundMessage:     .asciz "número inexistente\n"
  pulalin:      .asciz "\n"
  maxtam:       .int 20
  tam:          .int 0
  num:          .int 0
  numsearch:    .int 0
  indexfound:   .int 21
  vetor:        .space 80 # 4 bytes para cada numero a ser armazenado

.section .text
.globl _start

_start:
  pushl $titulo
  call printf

  call leposnum
  call letam
  call lenum
  call mostravet
  call mostranum
  call invertevetor
  call gira
  call mostravet2
  call mostranum2
  call pegaposicao

fim:
  pushl $0
  call exit

leposnum:
  pushl $pedeposnum
  call printf
  pushl $numsearch
  pushl $formato
  call scanf
  pushl $pulalin
  call printf
  addl $16, %esp
  ret

letam:
  pushl $pedetam
  call printf
  pushl $tam
  pushl $formato
  call scanf
  pushl $pulalin
  call printf

  movl tam, %ecx
  cmpl $0, %ecx
  jle letam               #less than or equal
  cmpl maxtam, %ecx
  jg letam                #greater 

  movl $vetor, %edi       # endereço inicial do vetor (1o inteiro)
  addl $16, %esp          # descarta os elementos empilhados
  movl $0, %ebx           # para enumerar os elementos lidos na leitura
  ret

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
  ret

mostravet:
  pushl $mostra1
  call printf
  addl $4, %esp
  movl tam, %ecx
  movl $vetor, %edi
  ret

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
  ret

invertevetor:
  movl $vetor, %edi
  movl $vetor, %esi
  movl $0, %edx
  movl tam, %eax
  decl %eax

  movl $4, %ebx
  mull %ebx
  addl %eax, %esi
  
  movl tam, %eax
  movl $2, %ebx
  divl %ebx
  movl %eax, %ecx
  ret

gira:
  movl (%edi), %eax
  movl (%esi), %ebx
  movl %eax, (%esi)
  movl %ebx, (%edi)
  addl $4, %edi
  subl $4, %esi
  loop gira
  ret

mostravet2:
  pushl $mostra3
  call printf
  addl $4, %esp
  movl tam, %ecx
  movl $vetor, %edi  
  ret

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
  ret

notFound:
  pushl $notFoundMessage
  call printf
  addl $4, %esp
  ret

atribuir:
  movl %ebx, indexfound
  pushl indexfound
  pushl $mostra2
  call printf
  addl $8, %esp
  ret

pegaposicao:

  pushl $mostra4
  call printf
  addl $4, %esp
  movl $vetor, %edi
  movl tam, %ecx
  movl $1, %ebx

volta:

  movl  (%edi), %eax
  cmpl  numsearch, %eax
  je    atribuir
  
  incl %ebx
  addl $4, %edi
  loop volta

  cmpl $21, indexfound
  je notFound
  
  ret
