.data
banco: .word 1, 2, 3, 4, 5, 6, 7, 8, 1, 0

mensagem1: .asciiz "Total de computadores produzidos: "
mensagem2: .asciiz "\nValor total dos computadores: R$ "
mensagem3: .asciiz "\nValor dos computadores azuis, brancos e pretos: R$ "

.text
.globl main

main:
    addi $sp, $sp, -20
    sw $ra, 16($sp)
    sw $s0, 12($sp)
    sw $s1, 8($sp)
    sw $s2, 4($sp)
    sw $s3, 0($sp)

    la $a0, banco

    add $s0, $zero, $zero
    add $s1, $zero, $zero
    add $s2, $zero, $zero
    add $s3, $zero, $zero

LOOP:
    lw $a1, 0($a0)

    beq $a1, $zero, FIM
    nop

    jal Cor
    nop

    addi $s0, $s0, 1
    addi $s2, $s2, 500

    beq $v0, $zero, PROXIMO
    nop

    addi $s1, $s1, 1
    addi $s3, $s3, 500

PROXIMO:
    addi $a0, $a0, 4
    j LOOP
    nop

FIM:
    la $a0, mensagem1
    addi $v0, $zero, 4
    syscall

    add $a0, $zero, $s0
    addi $v0, $zero, 1
    syscall

    la $a0, mensagem2
    addi $v0, $zero, 4
    syscall

    add $a0, $zero, $s2
    addi $v0, $zero, 1
    syscall

    la $a0, mensagem3
    addi $v0, $zero, 4
    syscall

    add $a0, $zero, $s3
    addi $v0, $zero, 1
    syscall

    lw $s3, 0($sp)
    lw $s2, 4($sp)
    lw $s1, 8($sp)
    lw $s0, 12($sp)
    lw $ra, 16($sp)
    addi $sp, $sp, 20

    addi $v0, $zero, 10
    syscall

Cor:
    addi $v0, $zero, 0

    addi $t0, $zero, 1
    beq $a1, $t0, ESPECIAL
    nop

    addi $t0, $zero, 2
    beq $a1, $t0, ESPECIAL
    nop

    addi $t0, $zero, 3
    beq $a1, $t0, ESPECIAL
    nop

    jr $ra
    nop

ESPECIAL:
    addi $v0, $zero, 1
    jr $ra
    nop
