.data
vetor: .word 6, 9, 2, 3, 8, 1, 0, 7
num: .word 8

.text
addi $t0, $zero, 1
la $s2, num
lw $t1, 0($s2)

la $s1, vetor

laco:
beq $t0, $t1, fimLaco

sub $s3, $t1, $t0
addi $t2, $zero, 0

lacoInterno:
beq $t2, $s3, fimLacoInterno
lw $t3, 0($s1)
lw $t4, 4($s1)

slt $s4, $t4, $t3
beq $s4, 1, troca
j saida

troca:
sw $t3, 4($s1)
sw $t4, 0($s1)

saida:
addi $t2, $t2, 1
addi $s1, $s1, 4
j lacoInterno

fimLacoInterno:
addi $t0, $t0, 1
j laco

fimLaco:
