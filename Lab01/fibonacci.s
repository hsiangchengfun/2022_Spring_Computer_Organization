.data
N:    .word 7    
str1:    .string "th number in the Fibonacci sequence is "


.text
main:              
        lw    a0, N
        li    s5, 1         
        jal   ra, fibo         

        mv    a1, a0
        lw    a0, N
        jal   ra, print

        li a7,10
        ecall

fibo:
        #sp  8  8  8
        #sp n-1 n ra
        
        #if n <=1 then return 
        ble   a0, s5, return   
            
        addi  sp, sp, -24      
        
        sw    ra, 16(sp)    
        sw    a0, 8(sp)        
        
        addi  a0, a0, -1       
        jal   ra, fibo         

        #save f(n-1)
        sw    a0, 0(sp)        

        #from 8(which is n)get n-2
        lw    a0, 8(sp)        
        addi  a0, a0, -2       
        jal   ra, fibo          
        #get f(n-1) and do f(n)=f(n-1)+f(n-2)
        lw    t0, 0(sp)        
        add   a0, a0, t0       
        
        lw    ra, 16(sp)        
        addi  sp, sp, 24       
        ret                    
	
return:
        ret             

print: 
        mv    t0, a0
        mv    t1, a1
        
        mv    a0, t0
        li    a7, 1
        ecall              
        
        la    a0, str1
        li    a7, 4
        ecall         
       
        mv    a0, t1
        li    a7, 1
        ecall            
        ret
