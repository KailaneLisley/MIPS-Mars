.data
mensagem: .asciiz "Resultado de Z: "

.text
.globl main

main:
    addi $a0, $zero, 20
    addi $a1, $zero, 2
    addi $a2, $zero, 3
    addi $a3, $zero, 2

    jal ProcZ
    nop

    add $t0, $zero, $v0

    la $a0, mensagem
    addi $v0, $zero, 4
    syscall

    add $a0, $zero, $t0
    addi $v0, $zero, 1
    syscall

    addi $v0, $zero, 10
    syscall

ProcZ:
    addi $sp, $sp, -24
    sw $a0, 0($sp)
    sw $a1, 4($sp)
    sw $a2, 8($sp)
    sw $a3, 12($sp)
    sw $ra, 16($sp)

    add $a0, $zero, $a1
    add $a1, $zero, $a3
    jal MULT
    nop

    sw $v0, 20($sp)

    lw $a2, 0($sp)
    lw $a3, 20($sp)
    jal DIV
    nop

    add $a0, $zero, $v0
    lw $a1, 8($sp)
    jal POT
    nop

    lw $ra, 16($sp)
    addi $sp, $sp, 24
    jr $ra
    nop

MULT:
    mul $v0, $a0, $a1
    jr $ra
    nop

DIV:
    div $a2, $a3
    mflo $v0
    jr $ra
    nop

POT:
    addi $t0, $zero, 1
    add $t1, $zero, $zero

    beq $a1, $zero, FIM_POT
    nop

LOOP_POT:
    mul $t0, $t0, $a0
    addi $t1, $t1, 1
    beq $t1, $a1, FIM_POT
    nop
    j LOOP_POT
    nop

FIM_POT:
    add $v0, $zero, $t0
    jr $ra
    nop
