.data
.align 0
string:	.asciiz "Insira o valor positivo:\n"

.text

main:	
	la $a0, string
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $a0, $v0 #a0 is the argument
	jal fat
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
fat:
	subi $sp, $sp, 8
	sw $a0, ($sp)
	sw $ra, 4($sp)
	
	bge $a0, 1, aux_fat
	
	addi $v0, $zero, 1
	addi $sp, $sp, 8
	
	jr $ra
	

aux_fat:
	subi $a0, $a0, 1
	jal fat

	lw $a0, ($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8

	mul $v0, $a0, $v0
	
	jr $ra