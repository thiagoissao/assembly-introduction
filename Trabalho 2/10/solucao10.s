.section .data
  titulo:     .asciz "\nPROGRAMA PARA TESTAR FUNCOES REAIS\n"
  titulo1:    .asciz "\nTESTE DA FUNCAO SENO(X)"
  titulo2:    .asciz "\nTESTE DA FUNCAO COSSENO(X)"
  titulo3:    .asciz "\nTESTE DA FUNCAO TANGENTE(X)"
  titulo4:    .asciz "\nTESTE DA FUNCAO DE POTENCIA >> X ELEVADO A N <<"
  titulo5:    .asciz "\nTESTE DA FUNCAO RAIZ QUADRADA (X)"
  titulo6:    .asciz "\nTESTE DE CONVERSAO DE STRING EM VALOR NUMERICO"

  menu:       .asciz "\nEscolha uma Opcao: \n<1> Seno \n<2> Cosseno\n<3> Tangente\n<4> Potencia \n<5> Raiz Quadrada \n<6> Converte String \n<?> Nenhuma\n>>> "

  pedestrf:   .asciz "\nDigite uma String contendo um Valor em Float => "
  pedestri:   .asciz "\nDigite uma String contendo um Valor Inteiro => "

  pedexrad:   .asciz "\nDigite um Valor float de X em Radianos\npi = 3.1416, digite 0 < X < 2pi => "

  pederealx:  .asciz "\nDigite um Valor float para X => "
  pederealn:  .asciz "Digite um Valor float para N => "

  pergcont:   .asciz "\nDeseja nova execucao ?\n<1> Sim \n<2> Nao\n\n"

  mostraval:  .asciz "\nValor da Funcao = %.2lf\n"

  mostraint:  .asciz "\nValor Inteiro = %d\n"
  mostrafloat:.asciz "\nValor em Float = %.4lf\n"

  strfloat:   .asciz "12345678901234567890"
  strint:     .asciz "12345678901234567890"

  val1:       .double 0.0
  val2:       .double 0.0

  formatolf:  .asciz "%lf"
  formatod:   .asciz "%d"
  formatos:   .asciz "%s"
  opcao:      .int 0

.section .text
.globl _start
_start:

pushl $titulo
call printf
pushl $menu
call printf
pushl $opcao
pushl $formatod
call scanf
addl $16, %esp

movl opcao, %eax

cmpl $1, %eax
je calcsen

cmpl $2, %eax
je calccos

cmpl $3, %eax
je calctan

cmpl $4, %eax
je calcpot

cmpl $5, %eax
je calcraizq

cmpl $6, %eax
je convstr

jmp fim

calcsen:
  pushl $titulo1
  call printf
  pushl $pedexrad
  call printf
  pushl $val1
  pushl $formatolf
  call scanf
  addl $16, %esp

  finit
  fldl val1
  subl $8, %esp
  fstl (%esp)
  call sin

  subl $8, %esp
  fstl (%esp)
  pushl $mostraval
  call printf

  addl $20, %esp
  jmp fim

calccos:
  pushl $titulo2
  call printf
  pushl $pedexrad
  call printf
  pushl $val1
  pushl $formatolf
  call scanf
  addl $16, %esp

  finit
  fldl val1
  subl $8, %esp
  fstl (%esp)
  call cos
  
  subl $8, %esp
  fstl (%esp)
  pushl $mostraval
  call printf

  addl $20, %esp
  jmp fim

calctan:
  pushl $titulo3
  call printf
  pushl $pedexrad
  call printf
  pushl $val1
  pushl $formatolf
  call scanf
  addl $16, %esp

  finit
  fldl val1
  subl $8, %esp
  fstl (%esp)

  call tan

  subl $8, %esp
  fstl (%esp)
  pushl $mostraval
  call printf

  addl $20, %esp
  jmp fim

calcpot:
  pushl $titulo4
  call printf

  pushl $pederealx
  call printf
  pushl $val1
  pushl $formatolf
  call scanf

  pushl $pederealn
  call printf
  pushl $val2
  pushl $formatolf
  call scanf

  addl $28, %esp

  finit
  fldl val2
  subl $8, %esp
  fstl (%esp)

  fldl val1
  subl $8, %esp
  fstl (%esp)

  call pow

  subl $8, %esp

  fstl (%esp)

  pushl $mostraval
  call printf

  addl $28, %esp
  jmp fim

calcraizq:
  pushl $titulo5
  call printf
  pushl $pederealx
  call printf
  pushl $val1
  pushl $formatolf
  call scanf
  addl $16, %esp

  finit 
  fldl val1
  subl $8, %esp
  fstl (%esp)


  call sqrt
  subl $8, %esp
  fstl (%esp)
  pushl $mostraval
  call printf

  addl $20, %esp
  jmp fim

convstr:
  pushl $titulo6
  call printf

  pushl $pedestri
  call printf

  pushl $strint 
  pushl $formatos
  call scanf
  addl $12, %esp

  pushl $strint
  call atoi
  pushl %eax
  pushl $mostraint
  call printf
  addl $12, %esp

  pushl $pedestrf
  call printf
  pushl $strfloat

  pushl $formatos
  call scanf
  addl $12, %esp

  finit
  pushl $strfloat
  call atof
  subl $8, %esp
  fstl (%esp)
  pushl $mostrafloat
  call printf
  addl $16, %esp

  jmp fim

fim:
  pushl $pergcont
  call printf

  pushl $opcao 
  pushl $formatod
  call scanf
  addl $12, %esp

  movl opcao, %eax
  cmpl $1, %eax

  je _start

  pushl $0
  call exit
