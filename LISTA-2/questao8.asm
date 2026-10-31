.data
Save: .word 2, 4, 6, 8, 10, 12, 14, 16
Matriz: .word 10, 20, 30, 40, 50, 60, 70, 80

mensagem1: .asciiz "Resultado A (a): "
mensagem2: .asciiz "\nResultado C (b): "
mensagem3: .asciiz "\nResultado B (c): "
mensagem4: .asciiz "\nResultado A (d): "

.text
.globl main

main:
    la $s0, Save
    la $s1, Matriz

    addi $t0, $zero, 2
    addi $t1, $zero, 7

    sll $t2, $t0, 2
    add $t2, $s0, $t2
    lw $t3, 0($t2)
    and $t0, $t1, $t3

    la $a0, mensagem1
    addi $v0, $zero, 4
    syscall

    add $a0, $zero, $t0
    addi $v0, $zero, 1
    syscall

    addi $t0, $zero, 8
    addi $t1, $zero, 5
    addi $t2, $zero, 8

IF_B:
    slt $t3, $t1, $t0
    beq $t3, $zero, ELSE_B
    nop

    bne $t2, $t0, ELSE_B
    nop

THEN_B:
    add $t2, $zero, $t0
    j FIM_B
    nop

ELSE_B:
    j FIM_B
    nop

FIM_B:
    la $a0, mensagem2
    addi $v0, $zero, 4
    syscall

    add $a0, $zero, $t2
    addi $v0, $zero, 1
    syscall

    addi $t1, $zero, 2
    addi $t2, $zero, 3

IF_C:
    slti $t4, $t1, 5
    beq $t4, $zero, THEN_C
    nop

    slti $t4, $t1, 10
    bne $t4, $zero, THEN_C
    nop

ELSE_C:
    sll $t5, $t1, 2
    add $t5, $s0, $t5
    lw $t6, 0($t5)
    addi $t2, $t6, 4
    j FIM_C
    nop

THEN_C:
    sll $t5, $t2, 2
    add $t5, $s1, $t5
    lw $t6, 0($t5)

    sll $t7, $t1, 2
    add $t7, $s0, $t7
    sw $t6, 0($t7)

FIM_C:
    la $a0, mensagem3
    addi $v0, $zero, 4
    syscall

    add $a0, $zero, $t2
    addi $v0, $zero, 1
    syscall

    addi $t0, $zero, 6
    addi $t1, $zero, 3
    addi $t2, $zero, 5

    and $t3, $t0, $t1
    or $t0, $t3, $t2

    la $a0, mensagem4
    addi $v0, $zero, 4
    syscall

    add $a0, $zero, $t0
    addi $v0, $zero, 1
    syscall

    addi $v0, $zero, 10
    syscall
