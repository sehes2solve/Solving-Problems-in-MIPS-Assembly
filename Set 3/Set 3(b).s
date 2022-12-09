 #Author : Hussien Tarek
 #SET 3 : (2)
 #takes an array of characters,
 #then reverses it in memory 
 #and prints the reversed version.
		.data
 out: .asciiz "Hallo World!"
 buffer: .space 1000
		.text
		.globl main
 main:
  #take String
	la $a0 , buffer
	li $a1 , 1000 
	li $v0 , 8
    syscall
	
  #get addresse of last char
	la $t1 , buffer
 loop1:
	lb $t3 , 0($t1)         #current char in iteration
	beq $t3 , $0 , endloop1
	addi $t1 , $t1 , 1
	j loop1
 endloop1:
	addi $t1 , $t1 , -1
	addi $t1 , $t1 , -1
  #reverse string
 loop2:
    bge $a0 , $t1 , endloop2
  #swap
    lb $t2 , 0($a0) #read char on left
	lb $t3 , 0($t1) #read char on right
	sb $t2 , 0($t1) #put char on left
	sb $t3 , 0($a0) #put char on right
  #inc & dec addresses --> shrink window <--
	addi $a0 , $a0 , 1
	addi $t1 , $t1 , -1
	j loop2
endloop2:
  #print reversed string	
    la $a0 , buffer
	li $v0 , 4
	syscall
	
	li $v0 , 10
	syscall
.end main
 