.data
vetor: .word 0, 5, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
array: .word 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0

mensagem1: .asciiz "Valor final de A: "
mensagem2: .asciiz "\nValor final de Array[5]: "

.text
.globl main

main:
    addi $a0, $zero, 1
    addi $a1, $zero, 2
    la $a2, array

    jal Proc1
    nop

    add $t0, $zero, $v0
    add $t1, $zero, $v1

    la $a0, mensagem1
    addi $v0, $zero, 4
    syscall

    add $a0, $zero, $t0
    addi $v0, $zero, 1
    syscall

    la $a0, mensagem2
    addi $v0, $zero, 4
    syscall

    add $a0, $zero, $t1
    addi $v0, $zero, 1
    syscall

    addi $v0, $zero, 10
    syscall

Proc1:
    addi $sp, $sp, -24
    sw $a0, 0($sp)
    sw $a1, 4($sp)
    sw $a2, 8($sp)
    sw $ra, 12($sp)

WHILE:
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    lw $t2, 8($sp)

    lw $t3, 20($t2)

    la $t4, vetor
    lw $t5, 32($t4)

    slt $t6, $t1, $t0
    beq $t6, $zero, VERIFICA_IGUALDADE
    nop

    slt $t6, $t3, $t5
    bne $t6, $zero, WHILE2
    nop

VERIFICA_IGUALDADE:
    sll $t7, $t0, 2
    add $t7, $t4, $t7
    lw $t7, 0($t7)

    beq $t7, $t3, WHILE2
    nop

    j FIM
    nop

WHILE2:
    lw $t2, 8($sp)
    lw $t3, 20($t2)

    la $t4, vetor
    lw $t5, 32($t4)

    slt $t6, $t3, $t5
    beq $t6, $zero, FIM_WHILE2
    nop

    lw $a1, 4($sp)
    lw $a0, 0($sp)

    jal Proc2
    nop

    sw $v0, 16($sp)

    lw $t0, 0($sp)
    sll $t0, $t0, 2
    la $t1, vetor
    add $t0, $t1, $t0
    lw $a2, 0($t0)

    lw $a3, 4($sp)

    jal Proc3
    nop

    lw $t2, 8($sp)
    lw $t3, 16($sp)
    add $t3, $t3, $v0
    sw $t3, 20($t2)

    j WHILE2
    nop

FIM_WHILE2:
    la $t0, vetor
    lw $t1, 32($t0)

    lw $t2, 8($sp)
    lw $t3, 20($t2)

    add $t1, $t1, $t3
    sw $t1, 0($sp)

    j WHILE
    nop

FIM:
    lw $v0, 0($sp)

    lw $t0, 8($sp)
    lw $v1, 20($t0)

    lw $ra, 12($sp)
    addi $sp, $sp, 24

    jr $ra
    nop

Proc2:
    add $v0, $a1, $a0
    jr $ra
    nop

Proc3:
    add $v0, $a2, $a3
    jr $ra
    nop
