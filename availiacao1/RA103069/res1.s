.section .data

	abertura:	.asciz	"\nSolucao exercicio 2\n\n"
	pedeLado:	.asciz	"Digite o lado %d do triangulo =  "
	tipoLado:	.asciz	"%d"

	isosceles:	.asciz	"\nO triangulo eh isosceles"
  equilatero:	.asciz	"\nO triangulo eh equilatero"
  escaleno:	  .asciz	"\nO triangulo eh escaleno"

	pergunta:	.asciz	"\n\nDeseja nova ordenacao <S>im/<N>ao? " 

	tipoC:	.asciz	" %c"

	lado1:	.int	0
	lado2:	.int	0
	lado3:	.int	0

	resp:	.byte	'n'
	

.section .text
.globl _start

_start:

	pushl	$abertura
	call	printf

	pushl	$1
	pushl	$pedeLado
	call	printf
	pushl	$lado1
	pushl	$tipoLado
	call	scanf

	pushl	$2
	pushl	$pedeLado
	call	printf
	pushl	$lado2
	pushl	$tipoLado
	call	scanf

	pushl	$3
	pushl	$pedeLado
	call	printf
	pushl	$lado3
	pushl	$tipoLado
	call	scanf

	addl	$52, %esp

	movl	lado2, %eax
	cmpl	lado1, %eax
	je	lado1_lado2_igual
  jmp lado1_lado3

lado1_lado2_igual:
  pushl $isosceles
  call printf
	movl	lado3, %eax
	cmpl	lado2, %eax
  je todos_os_lados_iguais
  jmp fim

todos_os_lados_iguais:
  pushl $equilatero
  call printf
  jmp fim

lado1_lado3:
  movl lado1, %eax
  cmpl lado3, %eax
  je lado1_lado3_igual
  jmp lado2_lado3

lado1_lado3_igual: 
  pushl $isosceles
  call printf
  jmp fim

lado2_lado3:
  movl lado2, %eax
  cmpl lado3, %eax
  je lado1_lado3_igual
  jmp lados_diferentes

lados_diferentes:
  pushl $escaleno
  call printf
  jmp fim

fim:

	pushl	$pergunta
	call	printf

	pushl	$resp
	pushl	$tipoC
	call	scanf

	movb	resp, %al
	cmpb	$'s',%al
	je	_start

	addl	$28, %esp
  
  pushl	$0
	call	exit
