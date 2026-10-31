.data
mensagem: .asciiz "Media ponderada: "
virgula: .asciiz ","

.text
.globl main

main:
    addi $t0, $zero, 5
    addi $t1, $zero, 7
    addi $t2, $zero, 9
    addi $t3, $zero, 10

    addi $s0, $zero, 10
    addi $s1, $zero, 22
    addi $s2, $zero, 30
    addi $s3, $zero, 38

    addi $sp, $sp, -4
    sw $ra, 0($sp)

    add $s4, $zero, $zero

    add $a0, $zero, $t0
    add $a1, $zero, $s0
    jal MULT
    add $s4, $s4, $v0

    add $a0, $zero, $t1
    add $a1, $zero, $s1
    jal MULT
    add $s4, $s4, $v0

    add $a0, $zero, $t2
    add $a1, $zero, $s2
    jal MULT
    add $s4, $s4, $v0

    add $a0, $zero, $t3
    add $a1, $zero, $s3
    jal MULT
    add $s4, $s4, $v0

    add $s5, $s0, $s1
    add $s5, $s5, $s2
    add $s5, $s5, $s3

    add $a0, $zero, $s4
    add $a1, $zero, $s5
    jal DIV

    add $t8, $zero, $v0
    add $t9, $zero, $v1

    la $a0, mensagem
    addi $v0, $zero, 4
    syscall

    add $a0, $zero, $t8
    addi $v0, $zero, 1
    syscall

    la $a0, virgula
    addi $v0, $zero, 4
    syscall

    add $a0, $zero, $t9
    addi $v0, $zero, 1
    syscall

    lw $ra, 0($sp)
    addi $sp, $sp, 4

    addi $v0, $zero, 10
    syscall

MULT:
    mul $v0, $a0, $a1
    jr $ra

DIV:
    div $a0, $a1
    mflo $v0
    mfhi $v1
    jr $ra
