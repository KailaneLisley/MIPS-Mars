.data
Matriz: .word 0, 0, 2, 0, 0, 0
Vetor: .word 0, 0, 3, 0, 4, 0

mensagem1: .asciiz "Resultado de Matriz[2]: "
mensagem2: .asciiz "\nResultado de B: "

.text
.globl main

main:
    la $a0, Matriz
    la $a1, Vetor
    addi $a2, $zero, 12
    addi $a3, $zero, 0

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
    addi $sp, $sp, -28
    sw $a0, 0($sp)
    sw $a1, 4($sp)
    sw $a2, 8($sp)
    sw $a3, 12($sp)
    sw $ra, 24($sp)

    addi $t0, $zero, 12
    addi $t1, $zero, 7

    sw $t0, 16($sp)
    sw $t1, 20($sp)

    lw $t2, 16($sp)
    lw $t3, 4($sp)
    lw $t4, 16($t3)

    slt $t5, $t4, $t2
    beq $t5, $zero, ELSE
    nop

WHILE:
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    lw $t2, 8($sp)

    lw $t3, 8($t0)
    lw $t4, 8($t1)
    lw $t5, 16($t1)

    slt $t6, $t4, $t3
    bne $t6, $zero, FIM_WHILE
    nop

    slt $t6, $t5, $t2
    beq $t6, $zero, FIM_WHILE
    nop

    add $a0, $zero, $t3
    jal Proc2
    nop

    sw $v0, 16($t1)

    lw $t0, 20($sp)
    add $a0, $zero, $t0
    jal Proc3
    nop

    lw $t1, 4($sp)
    lw $t2, 16($t1)
    sub $t3, $v0, $t2

    lw $t0, 0($sp)
    sw $t3, 8($t0)

    j WHILE
    nop

FIM_WHILE:
    lw $t0, 0($sp)
    lw $v0, 8($t0)
    lw $v1, 20($sp)
    j FIM_PROC1
    nop

ELSE:
    lw $t0, 0($sp)
    lw $v0, 8($t0)
    lw $v1, 20($sp)

FIM_PROC1:
    lw $ra, 24($sp)
    addi $sp, $sp, 28
    jr $ra
    nop

Proc2:
    add $v0, $zero, $a0
    jr $ra
    nop

Proc3:
    add $v0, $zero, $a0
    jr $ra
    nop
