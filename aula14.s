# programa para calculo de media de turma de alunos

.section .data
	abert:		.asciz	"\nPrograma para Calculo de Media de Turma\n\n\n"
	pedeNroAl:	.asciz	"\nDigite o numero de alunos => "
	pedeMedia:	.asciz	"\nDigite a media do aluno %d => "
	mostra:		.asciz	"\nMedia da Turma = %d\n\n"

	nroAl:	.int	0
	mediaA:	.int	0
	mediaT:	.int	0

	tipo1:	.asciz	"%d"	

.section .text

.globl	_start
_start:

	pushl	$abert
	call	printf

	pushl	$pedeNroAl
	call	printf
	pushl	$nroAl
	pushl	$tipo1
	call	scanf

	movl	nroAl, %ecx
	movl	$1, %ebx

volta:

	pushl	%ecx

	pushl	%ebx
	pushl	$pedeMedia
	call	printf
	pushl	$mediaA
	pushl	$tipo1
	call	scanf

	movl	mediaT, %eax
	addl	mediaA, %eax
	movl	%eax, mediaT

	addl	$12, %esp
	popl	%ebx
	popl	%ecx

	incl	%ebx	
  
	loop volta

	movl	$0, %edx
	movl	mediaT, %eax
	divl	nroAl
	movl	%eax, mediaT

	pushl	%eax
	pushl	$mostra
	call	printf

fim:

	pushl	$0
	call 	exit

