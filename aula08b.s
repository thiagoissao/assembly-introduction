.section .data

  abertura: .asciz "\nPrograma para somar teês numeros\n"
  saida:    .asciz "Soma: %d + %d + %d = %d\n"
  peden1:    .asciz "\nUsuario, digite o numero 1 = "
  peden2:    .asciz "\nUsuario, digite o numero 2 = "
  peden3:    .asciz "\nUsuario, digite o numero 3 = "
  formato:  .asciz "%d" #usado pelo scanf para saber o tipo de dado

  n1: .int 0
  n2: .int 0
  n3: .int 0
  res: .int 0

.section .text
.globl _start
_start:

  pushl $abertura           #imprime abertura
  call printf

  pushl $peden1             #empilha a mensagem pedido o número
  call printf               #le a mensagem
  pushl $n1                 #empilha o endereço da variável
  pushl $formato            #empilha o formato da variavel
  call scanf                #le o dado digitado

  pushl $peden2             #empilha a mensagem pedido o número
  call printf               #le a mensagem
  pushl $n2                 #empilha o endereço da variável
  pushl $formato            #empilha o formato da variavel
  call scanf                #le o dado digitado

  pushl $peden3             #empilha a mensagem pedido o número
  call printf               #le a mensagem
  pushl $n3                 #empilha o endereço da variável
  pushl $formato            #empilha o formato da variavel
  call scanf                #le o dado digitado

  movl n3, %eax
  addl n2, %eax
  addl n1, %eax
  movl %eax, res

  pushl res
  pushl n3
  pushl n2
  pushl n1
  pushl $saida
  call printf
  addl $60, %esp

  pushl $0
  call exit
