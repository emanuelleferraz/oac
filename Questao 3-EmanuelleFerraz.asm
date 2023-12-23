.data
tamanho: .space 6
string: .space 6
palindromo: .asciiz "\nA palavra é um palíndromo."
naoPalindromo: .asciiz "\nA palavra não é um palíndromo."
info: .asciiz "Informe uma palavra (5 caracteres): "

.text
la $a0, info
addi $v0, $zero, 4
syscall

la $a0, string
addi $a1, $zero, 6
addi $v0, $zero, 8
syscall

la $t1, string
addi $s5, $zero, 5
lb $s0, 0($t1)
add $t4, $t1, 4 
lb $s1, 0($t4)

loopString:
bne $s0, $s1, naoEhPalindromo
beq $s5, $s0, ehPalindromo

addi $t1, $t1, 1
lb $s0, 0($t1)
sub $t4, $t4, 1
lb $s1, 0($t4)
sub $s5, $s5, 1
j loopString

ehPalindromo:
la $a0, palindromo
addi $v0, $zero, 4
syscall
j fim

naoEhPalindromo:
la $a0, naoPalindromo
addi $v0, $zero, 4
syscall

fim:
