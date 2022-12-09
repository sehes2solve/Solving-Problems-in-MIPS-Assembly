 #Author : Hussien Tarek
 #SET 3 : (4)
 #int main() {
 #		...
 #	t1 = fact(8);
 #	t2 = fact(3);
 #	t3 = t1 + t2;
 #		...
 #}
 #int fact(int n) {
 #	int i, result = 1;
 #	for (i = n; i > 1; i--)
 #	result  = result * i;
 #	return result;
 #}

 #		1 -> $t0 
 #      i -> $t4 
 #      result -> $v0

 
		.data
		.text
 fact:
	li $v0 , 1				# return <- v0 <- result = 1;
	li $t0 , 1				# t0 <- 1
	add $t4 , $a0 , 0       # t4 <- i = n; -> a0
	
 loop:
	ble $t4 , $t0 , endloop
	mul $v0 , $v0 , $t4	    # result = result * i;
	addi $t4 , $t4 , -1     # i--;
	j loop
 endloop:
	jr $ra
	
		.globl main
 main:
 
	li $a0 , 8			   # fact(n = 8)
	jal fact
	add $t1 , $v0 , $0 	   # t1 = fact(8);
	li $a0 , 3			   # fact(n = 3)
	jal fact
	add $t2 , $v0 , $0	   # t2 = fact(3);
	add $t3 , $t1 , $t2    # t3 = t1 + t2 ;
	li $v0 , 10
	syscall 
	
 .end main