.data
.align 0
string1:	.asciiz "Insira a primeira string (tamanho max = 20 char):\n"
string2:	.asciiz "Insira a segunda string (tamanho max =  20 char):\n"
null_char:	.byte '\0'
breakline:	.byte '\n'
		
.text
main:	
	la $a0, string1
	li $v0, 4
	syscall
	
	li $a1, 21
	li $v0, 8 
	syscall
	
	la $a0, string2
	li $v0, 4
	syscall

	li $v0, 8 
	syscall
	
	lb $t6, breakline
	lb $t7, null_char	 
	
	move $t0, $zero			
	la $t1, string1
	la $t2, string2

strcmp:		
	lb $t3, ($t1)
	lb $t4, ($t2)
	
	bne $t3, $t4, exit
	beq $t3, $t7, exit
	beq $t3, $t6, exit
	
	addi $t1, $t1, 1
	addi $t2, $t2, 1
	
	j strcmp
	
			
exit:
	sub $a0, $t3, $t4
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall