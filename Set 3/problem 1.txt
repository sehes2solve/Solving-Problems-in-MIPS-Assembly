#Author : Hussien Tarek
#SET 3 : (1)
#if (g >= h)
#	g++;
#else 
#	g--;

#	$s0 <- g
#	$s1 <- h
.data
.text
.globl main
 main:
	bge $s0 , $s1 , if
	
	addi $s0 , $s0 ,-1
	j else;
 if:
	addi $s0 , $s0 , 1
 
 else:
	li $v0 , 10
	syscall
 
.end main
