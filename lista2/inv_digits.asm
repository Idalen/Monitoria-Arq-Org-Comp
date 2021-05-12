.data
.align 0
string:	.asciiz "Insira o valor positivo até 9999:\n"

.text

#x0 = (n % 10)/ 1
#n = n - x0
#x1 = (n % 100)/10
#n = n - x1
#x2 = (n % 1000)/100

main:	
	la $a0, string
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	rem $t0, $v0, 10
	
	sub $v0, $v0, $t0
	
	rem $t3, $v0, 100
	div $t1, $t3, 10
	
	sub $v0, $v0, $t1
	
	rem $t3, $v0, 1000
	div $t2, $t3, 100
	
	mul $t0, $t0, 100
	mul $t1, $t1, 10
	
	move $a0, $t2
	add $a0, $a0, $t1
	add $a0, $a0, $t0
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall