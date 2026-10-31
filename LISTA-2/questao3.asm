.data
arrayA: .space 400
arrayB: .space 400
arrayC: .space 400

msgQtd: .asciiz "\nQuantidade de elementos copiados: "
msgC: .asciiz "\nArray C: "
espaco: .asciiz " "

.text
.globl main

main:
    la $t0, arrayA
    addi $t1, $zero, 10
    sw $t1, 0($t0)
    addi $t1, $zero, 20
    sw $t1, 4($t0)
    addi $t1, $zero, 5
    sw $t1, 8($t0)

    la $t0, arrayB
    addi $t1, $zero, 1
    sw $t1, 396($t0)
    addi $t1, $zero, 30
    sw $t1, 392($t0)

    addi $a0, $zero, 100
    la $a1, arrayA
    la $a2, arrayB
    la $a3, arrayC

    jal Proc3
    nop

    add $t9, $zero, $v0

    la $a0, msgQtd
    addi $v0, $zero, 4
    syscall

    add $a0, $zero, $t9
    addi $v0, $zero, 1
    syscall

    la $a0, msgC
    addi $v0, $zero, 4
    syscall

    la $t0, arrayC
    add $t1, $zero, $t9

ImprimeC:
    beq $t1, $zero, Encerrar
    nop

    lw $a0, 0($t0)
    addi $v0, $zero, 1
    syscall

    la $a0, espaco
    addi $v0, $zero, 4
    syscall

    addi $t0, $t0, 4
    addi $t1, $t1, -1
    j ImprimeC
    nop

Encerrar:
    addi $v0, $zero, 10
    syscall

Proc3:
    addi $t5, $zero, 5
    add $t8, $zero, $zero
    add $t0, $zero, $zero
    addi $a0, $zero, 100
    addi $t1, $a0, -1

Loop:
    slt $t6, $t0, $a0
    beq $t6, $zero, FIM
    nop

    add $t2, $t0, $t0
    add $t2, $t2, $t2
    add $t2, $a1, $t2
    lw $t3, 0($t2)

    beq $t3, $t5, FIM
    nop

    add $t2, $t1, $t1
    add $t2, $t2, $t2
    add $t2, $a2, $t2
    lw $t4, 0($t2)

    beq $t4, $t5, FIM
    nop

    slt $t6, $t3, $t4
    beq $t6, $zero, copA
    nop

    add $t7, $zero, $t4
    j C
    nop

copA:
    add $t7, $zero, $t3

C:
    add $t2, $t8, $t8
    add $t2, $t2, $t2
    add $t2, $a3, $t2
    sw $t7, 0($t2)

    addi $t0, $t0, 1
    addi $t1, $t1, -1
    addi $t8, $t8, 1

    j Loop
    nop

FIM:
    add $v0, $zero, $t8
    jr $ra
    nop