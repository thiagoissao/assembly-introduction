.section .data

saida: .asciz "Teste %d: o valor do registrador é : %X\n\n"
saida2: .asciz "Teste %d: os valores dos registradores sao: %X e %X\n\n"
saida3: .asciz "Teste %d:\n EAX = %X\n EBX = %X\n ECX = %X\n EDX = %X\n ESI = %X\n EDI = %X\n\n"

.section .text
.globl _start
_start:

#teste1

movl $0x12345678, %ebx
pushl %ebx
pushl $1
pushl $saida
call printf

#teste2

movw $0xABCD, %bx
pushl %ebx
pushl $2
pushl $saida
call printf

#teste3

movb $0xEE, %bh
movb $0xFF, %bl
pushl %ebx
pushl $3
pushl $saida
call printf

#teste4
movl $0xAAAAAAAA, %eax
movl $0xBBBBBBBB, %ebx
movl $0xCCCCCCCC, %ecx
movl $0xDDDDDDDD, %edx
movl $0xEEEEEEEE, %esi
movl $0xFFFFFFFF, %edi

pushl %edi
pushl %esi
pushl %edx
pushl %ecx
pushl %ebx
pushl %eax
pushl $4
pushl $saida3
call printf

#teste5

pushl %edi
pushl %esi
pushl %edx
pushl %ecx
pushl %ebx
pushl %eax
pushl $5
pushl $saida3
call printf

addl $40, %esp

#teste6
popl %eax
popl %ebx
popl %ecx
popl %edx
popl %esi
popl %edi

pushl %edi
pushl %esi
pushl %edx
pushl %ecx
pushl %ebx
pushl %eax
pushl $6
pushl $saida3
call printf

addl $32, %esp

movl $0x12345678, %eax
roll $16, %eax
rolw $8, %ax
rolb $4, %al
pushl %eax
pushl $7
pushl $saida
call printf

movl $0x12345678, %eax
roll $8, %eax
rolw $8, %ax
rolb $4, %al
pushl %eax
pushl $8
pushl $saida
call printf

addl $24, %esp

movl $0x12345678, %eax
rorl $16, %eax
rolw $8, %ax
rolb $4, %al
pushl %eax
pushl $9
pushl $saida
call printf

movl $0x12345678, %eax
rorl $8, %eax
rolw $8, %ax
rolb $4, %al
pushl %eax
pushl $10
pushl $saida
call printf

addl $24, %esp

movl $0x12345678, %eax
sarl $16, %eax
sarw $8, %ax
sarb $4, %al
pushl %eax
pushl $13
pushl $saida
call printf

movl $0x12345678, %eax
sarl $8, %eax
sarw $4, %ax
sarb $4, %al
pushl %eax
pushl $14
pushl $saida
call printf
addl $24, %esp

movl $0x12341234, %eax
movl $0xabcdabcd, %ebx
xchgb %al, %bl
xchgw %ax, %bx
xchgl %eax, %ebx
pushl %ebx
pushl %eax
pushl $15
pushl $saida2
call printf

addl $16, %esp

pushl $0
call exit
