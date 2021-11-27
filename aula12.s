.section .data
  pedido1: .asciz "\nTeste %d: Digite um caractere => "
  mostra1: .asciz "\nTeste %d: Caractere Digitado = %c\n"
  tecla: .int 'A'

  pedido2: .asciz "\nTeste %d: Digite um numero inteiro => "
  mostra2: .asciz "\nTeste %d: Numero digitado = %d\n "
  numero: .int 0

  pedido3: .asciz "\nTeste %d: Digite uma palavra nao composta => "
  mostra3: .asciz "\nTeste %d: Palavra digitada = %s\n "
  frase: .space 64

  pedido4_1: .asciz "\nTeste %d: Digite dois numeros inteiros \n N1 = "
  pedido4_2: .asciz "\nN2 = "
  mostra4_1: .asciz "\nTeste %d: Numeros lidos: n1 = %d e n2 = %d\n"
  mostra4_2: .asciz "\nTeste%d: n1 eh igual a n2\n"
  mostra4_3: .asciz "\nTeste%d: n2 eh menor a n1\n"
  mostra4_4: .asciz "\nTeste%d: n2 eh maior a n1\n"
  mostra4_5: .asciz "\nTeste%d: Acabaram as comparacoes!\n"

  n1: .int 0
  n2: .int 0

  pedido5: .asciz "\nTeste %d: Quantos giros voce quer no loop? "
  pedido5_1: .asciz "\nTeste %d: Girando %d...\n"
  pedido5_2: .asciz "\nTeste %d: Acabou o loop!\n"

  pedido6: .asciz "\n %d: Digite uma frase composta => "
  mostra6: .asciz "\n %d: A frase digitada eh => %s\n"

  tipocar: .asciz "%c"
  tipocar2: .asciz " %c" #Despreza o <enter> e pega o proximo valor
  tiponum: .asciz "%d"
  tipostr: .asciz "%s"

.section .text
.globl _start
_start:

  pushl $1
  pushl $pedido1
  call printf
  pushl $tecla
  pushl $tipocar
  call scanf
  pushl tecla
  pushl $1
  pushl $mostra1
  call printf

  pushl $2
  pushl $pedido2
  call printf
  pushl $numero
  pushl $tiponum
  call scanf
  pushl numero
  pushl $2
  pushl $mostra2
  call printf

  pushl $3
  pushl $pedido3
  call printf
  pushl $frase
  pushl $tipostr
  call scanf
  pushl $frase
  pushl $3
  pushl $mostra3
  call printf

  pushl $4
  pushl $pedido2
  call printf
  pushl $numero
  pushl $tiponum
  call scanf
  pushl numero
  pushl $4
  pushl $mostra2
  call printf

  pushl $4
  pushl $pedido1
  call printf
  pushl $tecla
  pushl $tipocar
  call scanf
  pushl tecla
  pushl $4
  pushl $mostra1
  call printf

  pushl $4
  pushl $pedido3
  call printf
  pushl $frase
  pushl $tipostr
  call scanf
  pushl $frase
  pushl $4
  pushl $mostra3
  call printf

  pushl $4
  pushl $pedido1
  call printf
  pushl $tecla
  pushl $tipocar
  call scanf
  pushl tecla
  pushl $4
  pushl $mostra1
  call printf

  pushl $0
  call exit
