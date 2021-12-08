.section .data
  pedido1:              .asciz "\nEntrada de Dados:\n\nDigite A (single float) => "
  pedido2:              .asciz "Digite B (double float) => "
  mostra1:              .asciz "\nValor de A = %.4f\n"
  mostra2:              .asciz "Valor de B = %.4lf\n"

  mostrasom:            .asciz "\nOperacoes Realizadas:\n\B + A = %.4lf\n"
  mostrasub:            .asciz "B - A = %.4lf\n"
  mostradiv:            .asciz "B / A = %.4lf\n"
  mostramul:            .asciz "B * A = %.4lf\n"
  mostratudo:           .asciz "\nTudo Junto:\n\nmultiplicacao = %.2lf divisao = %.2lf subtracao = %.2lf soma = %.2lf\n\n"

  pulalin:              .asciz "\n"

  formato1:             .asciz "%f"
  formato2:             .asciz "%lf"

  float1:               .space 4
  float2:               .space 8

.section .text
.globl _start
_start:
  pushl $pedido1
  call printf
  pushl $float1
  pushl $formato1
  call scanf
  addl $12, %esp

  flds float1 # carrega variavel single float no topo da
              # Pilha PFU, convertendo 4 bytes em 80 bits

  subl $8, %esp # abre espaco de 8 bytes no topo da Pilha do Sistema

  fstl (%esp) # copia do topo da pilha PFU para o topo da
              # Pilha do Sistema, convertendo 80 bits em 8
              # bytes

  pushl $mostra1
  call printf
  addl $4, %esp

  pushl $pedido1
  call printf
  pushl $float1
  pushl $formato1
  call scanf
  addl $12, %esp

  flds float1 # carrega variavel single float no topo da
              # Pilha PFU, convertendo 4 bytes em 80 bits
  subl $4, %esp # abre espaco de 4 bytes no topo da Pilha
                # do Sistema
  fsts (%esp) # copia do topo da pilha PFU para o topo da
              # Pilha do Sistema, convertendo 80 bits em 4
              # bytes
  pushl $mostra1
  call printf
  addl $4, %esp

  pushl $pedido1
  call printf
  pushl $float1
  pushl $formato1
  call scanf
  addl $12, %esp  # le um valor em simples precisao (4 bytes)
                  # limpa a Pilha do Sistema de 3 pushls
  
  pushl $pedido2
  call printf
  pushl $float2
  pushl $formato2
  call scanf
  addl $12, %esp # le outro valor em dupla precisao (8 bytes)
                  # limpa a Pilha do Sistema de 3 pushls

  flds float1 # carrega variavel single float no topo da
              # Pilha PFU, convertendo 4 bytes em 80 bits

  fldl float2 # carrega variavel double float no topo da
              # Pilha PFU, convertendo 8 bytes em 80 bits
  fadd %st(1), %st(0) # faz %st(0) + %st(1) e sobrescreve
                      # em %st(0)
  subl $8, %esp
  fstpl (%esp)

  pushl $mostrasom
  call printf
  addl $4, %esp

  fldl float2
  fsub %st(1), %st(0)

  subl $8, %esp
  fstpl (%esp)

  pushl $mostrasub
  call printf
  addl $4, %esp

  fldl float2
  fdiv %st(1), %st(0)
  
  subl $8, %esp
  fstpl (%esp)

  pushl $mostradiv
  call printf
  addl $4, %esp

  fldl float2
  fmul %st(1), %st(0)

  subl $8, %esp
  fstpl (%esp)

  pushl $mostramul
  call printf
  addl $4, %esp

  pushl $mostratudo
  call printf
  addl $4, %esp

  addl $32, %esp
  pushl $0
  call exit
