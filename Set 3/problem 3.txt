 #Author : Hussien Tarek
 #SET 3 : (3)
 #for(i = 0; i < a; i++) 
 #   for(j = i; j >= 0; j--) 
 #       C[i] *= j;
 
 #		int C[5] = {1,2,3,4,5}; 
 #      C -> $s0 
 #      a -> $s1 -> 5
 #      i -> $t0 
 #      j -> $t1

		.data
 C: .space 20 # 5 * 4 = 20
		.text
		.globl main
 main:
    la $s0 , C 			#save C addresse in $s0
	li $s1 , 5 			#save array size in $s1
#int C[5] = {1,2,3,4,5}; 
	li $t0 , 1		
	sw $t0 , ($s0)
	
	li $t0 , 2
	sw $t0 , 4($s0)
	
	li $t0 , 3
	sw $t0 , 8($s0)
	
	li $t0 , 4
	sw $t0 , 12($s0)
	
	li $t0 , 5
	sw $t0 , 16($s0)
#for(i = 0; i < a; i++)
	li $t0 , 0 			# i = 0
 outerloop:
	bge $t0 , $s1 , endouterloop
	sll $t2 , $t0 , 2 	# i * 4
	add $t2 , $t2 , $s0	# t2 <- *(C[i]) = i*4 + C 
#   for(j = i; j >= 0; j--)
	add $t1 , $t0 , $0 	# j = i
 innerloop:
	blt $t1 , $0 , endinnerloop
	lw $t3 , ($t2)      # t3 <- C[i]
	mul $t3 , $t3 , $t1 # t3 = C[i] * j
	sw $t3 , ($t2)      # C[i] = t3
	addi $t1 , -1 		# j--
	j innerloop
 endinnerloop:
	addi $t0 , $t0 , 1  # i++
    j outerloop
 endouterloop:
    li $v0 , 10
	syscall
 .end main