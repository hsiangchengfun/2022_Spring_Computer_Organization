.data
num1: .word 4 
num2: .word 8 
str1: .string "GCD value of "
str2: .string " and "
str3: .string " is "

.text
main:

	lw	    a0, num1
	lw	    a1, num2
	jal	    ra, gcd		


	mv	    a2, a0		
	lw	    a0, num1
	lw	    a1, num2
	jal	    ra, print	

	li	    a7,10		
	ecall

gcd:
	addi	    sp, sp, -24

	sw	    ra, 16(sp)		
	sw	    a1, 8(sp)			
	sw	    a0, 0(sp)
	
    # t0 = i , do i for loop 
	addi 	t0, a1, -1
    # if i still > 0 , them keep doing calcu
	bge	    t0, zero, ngcd

	addi    	sp, sp, 24	
    ret

ngcd:		
    # t1 = a0 % a1 
	rem	    t1, a0, a1	

    mv      a0,a1
    mv      a1,t1
	jal	    ra, gcd		

	mv      t2,a0	
	lw	    a0, 0(sp)	
	lw	    a1, 8(sp)	
	lw	    ra, 16(sp)	

	addi	    sp, sp, 24	

	mv      a0,t2		
	ret		

print:
        mv       t0, a0		
        mv       t1, a1		
		mv	     t2, a2			

        la       a0, str1	
        li       a7, 4
        ecall

        mv       a0, t0		
        li       a7, 1
        ecall

        la       a0, str2	
        li       a7, 4
        ecall

        mv       a0, t1		
        li       a7, 1
        ecall

		la       a0, str3	
        li       a7, 4
        ecall

        mv       a0, t2		
        li       a7, 1
        ecall

        ret