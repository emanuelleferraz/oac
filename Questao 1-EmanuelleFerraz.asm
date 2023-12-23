.data
a: .word 4
b: .word 5
f: .word 1

.text
main:
la $s1, a
la $s2, b
la $s4, f

jal func
#movendo o resultado para a variavel $s5 que é a valor:
move $s5, $s0

addi $v0, $zero, 1
add $a0, $zero, $s5
syscall

addi $v0, $zero, 10
syscall

func:
lw $t0, 0($s4)
beq $t0, 1, soma
j subt

soma:
lw $t1, 0($s1)
lw $t2, 0($s2)
add $s0, $t1, $t2
jr $ra

subt:
lw $t1, 0($s1)
lw $t4, 0($s2)
sub $s0, $t1, $t2
jr $ra
