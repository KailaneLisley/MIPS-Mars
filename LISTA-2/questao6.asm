.data
origem: .word 10, 20, -100, 75, 30, 40, 50, 60
destino: .space 32
mensagem: .asciiz "Quantidade de palavras contadas: "
mensagem2: .asciiz "\nPalavras copiadas: "
espaco: .asciiz " "

.text
.globl main

main:
    la $a0, origem
    la $a1, destino

    add $v0, $zero, $zero

    addi $t3, $zero, -1020
    addi $t4, $zero, -5
    addi $t5, $zero, 50
    addi $t6, $zero, 150
    add $t8, $zero, $zero

LOOP:
    lw $t0, 0($a0)
    lw $t1, 4($a0)

    sw $t0, 0($a1)
    sw $t1, 4($a1)

    addi $t8, $t8, 2

    slt $t7, $t3, $t0
    beq $t7, $zero, VERIFICA_INVERSO
    nop

    slt $t7, $t0, $t4
    beq $t7, $zero, VERIFICA_INVERSO
    nop

    slt $t7, $t5, $t1
    beq $t7, $zero, CONTINUA
    nop

    slt $t7, $t6, $t1
    bne $t7, $zero, CONTINUA
    nop

    j FIM
    nop

VERIFICA_INVERSO:
    slt $t7, $t3, $t1
    beq $t7, $zero, CONTINUA
    nop

    slt $t7, $t1, $t4
    beq $t7, $zero, CONTINUA
    nop

    slt $t7, $t5, $t0
    beq $t7, $zero, CONTINUA
    nop

    slt $t7, $t6, $t0
    bne $t7, $zero, CONTINUA
    nop

    j FIM
    nop

CONTINUA:
    addi $v0, $v0, 2
    addi $a0, $a0, 8
    addi $a1, $a1, 8
    j LOOP
    nop

FIM:
    add $t2, $zero, $v0

    la $a0, mensagem
    addi $v0, $zero, 4
    syscall

    add $a0, $zero, $t2
    addi $v0, $zero, 1
    syscall

    la $a0, mensagem2
    addi $v0, $zero, 4
    syscall

    la $t9, destino
    add $t7, $zero, $zero

IMPRIME:
    slt $t1, $t7, $t8
    beq $t1, $zero, ENCERRA
    nop

    lw $a0, 0($t9)
    addi $v0, $zero, 1
    syscall

    la $a0, espaco
    addi $v0, $zero, 4
    syscall

    addi $t9, $t9, 4
    addi $t7, $t7, 1
    j IMPRIME
    nop

ENCERRA:
    addi $v0, $zero, 10
    syscall
