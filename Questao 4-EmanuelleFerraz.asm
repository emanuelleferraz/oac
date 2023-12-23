.data
    input_string: .asciiz "52 3 +"
    stack: .space 100
    space: .asciiz " "

.text
main:
    la $t0, input_string
    la $t1, stack
    jal read_input

    loop:
        lw $t2, 0($t1)
        addi $t1, $t1, 4

        beqz $t2, end

        bltz $t2, process_operator
        sw $t2, 0($t1)
        j loop

    process_operator:
        beq $t2, -1, add_op
        beq $t2, -2, sub_op
        beq $t2, -3, mul_op
        beq $t2, -4, div_op

    add_op:
        lw $t3, 0($t1)
        add $t2, $t3, $t2
        sw $t2, 0($t1)
        j loop

    sub_op:
        lw $t3, 0($t1)
        sub $t2, $t3, $t2
        sw $t2, 0($t1)
        j loop

    mul_op:
        lw $t3, 0($t1)
        mul $t2, $t3, $t2
        sw $t2, 0($t1)
        j loop

    div_op:
        lw $t3, 0($t1)
        div $t2, $t3, $t2
        mflo $t2
        sw $t2, 0($t1)
        j loop

    end:
        li $v0, 10
        syscall

read_input:
    li $v0, 4
    move $a0, $t0
    syscall

    read_loop:
        li $v0, 5
        syscall

        sw $v0, 0($t1)
        addi $t1, $t1, 4

        li $v0, 4
        la $a0, space
        syscall

        lb $t2, 0($t0)
        beqz $t2, end_read

        addi $t0, $t0, 1
        j read_loop

    end_read:
        jr $ra

