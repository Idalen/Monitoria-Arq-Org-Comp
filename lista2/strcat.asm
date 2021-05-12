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
	lb $t7, null_char	#t9 = null char  
				#t1 = current adress os the string1
	la $t1, string1		#t2 = byte read from t1
	
through_str:
	addi $t1, $t1, 1
	lb $t2, ($t1)
	
	beq $t2, $t7, exit_through_str
	beq $t2, $t6, exit_through_str
	j through_str
	
	#in the end, t1 has the adress to the last byte of the string
	##################################################################################
exit_through_str:
				#t9 = null char  
	move $t0, $zero 	#t0 = iterator
	la $t2, string2		#t1 = adress to the last byte of the string1
				#t2 = current adress os the string2
				#t3 = byte read from t2
cat_str:
	lb $t3, ($t2)
	sb $t3, ($t1)
	
	addi $t1, $t1, 1
	addi $t2, $t2, 1
	
	beq $t3, $t7, exit_cat_str
	beq $t3, $t7, exit_cat_str
	j cat_str
exit_cat_str:
	sb $t7, ($t2)
	
	la $a0, string1
	
	li $v0, 4
	syscall
	
	
	li $v0, 10
	syscall
	