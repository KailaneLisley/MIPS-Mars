.data                                    // Inicia a área declaração de dados
arrayA: .word 10, 20, 30, 40, 50         // Reserva 5_posições consecutivas na memória (cada posição com uma palavra de 32_bits (4_bytes))
arrayB: .word 1, 2, 3, 4, 5              // Reserva 5_posições consecutivas na memória (cada posição com uma palavra de 32_bits (4_bytes))

msgA: .asciiz "\nArray A: "              
msgB: .asciiz "\nArray B: "
espaco: .asciiz " "

.text
.globl main

main:
    addi $a0, $zero, 5
    la $a1, arrayA
    la $a2, arrayB

    jal Troca
    nop

    la $a0, msgA
    addi $v0, $zero, 4
    syscall

    la $t0, arrayA
    addi $t1, $zero, 5

ImprimeA:
    lw $a0, 0($t0)
    addi $v0, $zero, 1
    syscall

    la $a0, espaco
    addi $v0, $zero, 4
    syscall

    addi $t0, $t0, 4
    addi $t1, $t1, -1
    bne $t1, $zero, ImprimeA
    nop

    la $a0, msgB
    addi $v0, $zero, 4
    syscall

    la $t0, arrayB
    addi $t1, $zero, 5

ImprimeB:
    lw $a0, 0($t0)
    addi $v0, $zero, 1
    syscall

    la $a0, espaco
    addi $v0, $zero, 4
    syscall

    addi $t0, $t0, 4
    addi $t1, $t1, -1
    bne $t1, $zero, ImprimeB
    nop

    addi $v0, $zero, 10
    syscall

Troca:
    add $t5, $zero, $zero
    addi $t6, $a0, -1

Loop:
    add $t1, $t5, $t5
    add $t1, $t1, $t1
    add $t1, $a1, $t1

    add $t2, $t6, $t6
    add $t2, $t2, $t2
    add $t2, $a2, $t2

    lw $t3, 0($t1)
    lw $t4, 0($t2)

    add $t7, $zero, $t3
    add $t3, $zero, $t4
    add $t4, $zero, $t7

    sw $t3, 0($t1)
    sw $t4, 0($t2)

    addi $t5, $t5, 1
    addi $t6, $t6, -1

    beq $t5, $a0, FIM
    nop

    j Loop
    nop

FIM:
    jr $ra
    nop
