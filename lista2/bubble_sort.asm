.data
.align 2

vector:	.word 7, 6, 5, 4, 3, 2, 1
length:	.word 7

.text

main:
	lw $t0, length
	la $t1, vector
	
	
	addi $t6, $zero, -1 # t6 = i
	
loopi:	
	addi $t6, $t6, 1
	
	beq $t6, $t0, exit
	
	addi $t7, $t6, 1   #t7 = j
	mul $t4, $t6, 4    #t4 = i*4
	

loopj:	
	lw $t2, vector($t4)
	beq $t7, $t0, loopi
	
	mul $t5, $t7, 4  # t5 = j*4
	lw $t3, vector($t5)
	add $t7, $t7, 1
	
	bgt $t3, $t2, loopj
		 
	
switch:
	sw $t3, vector($t4)
	sw $t2, vector($t5)
	
	j loopj
	
exit:
	li $v0, 10
	syscall
