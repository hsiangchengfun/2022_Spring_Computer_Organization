.data
n: .word 5  
str1: .string "Array："
str2: .string "Sorted："
space: .string " "
array: .word 5, 3, 6 , 7, 31
changeline: .string "\n"

.text
main:
    la a0,str1
    li a7,4
    ecall
    addi t4,zero,1
    
    la t0,array
    lw t2,n
    jal ra,print_array
    
    
    la t0,array
    lw t2,n
    #for i , i is t1
    addi t1,zero,1
    #for j , j is t3,j = i-1
    addi t3,t1,-1
    addi s5,zero,1
    
    #t5 == 1 , means if t2 > 1 then do bubble
    bge t2,s5,bubble
    
    li a7,10
    ecall
    
    
bubble:
    #first loop

    #if i > num of num then ready to print
    bge t1,t2,ready_end
    #j = i-1
    addi t3,t1,-1  

bubble_calcu:
    # second loop == j for loop
    
    # if j < 0 then out
    blt t3,zero,add_i
    #num = 4
    addi s2,zero,4
    #let s5 be 4*j to point the array
    mul s2,s2,t3
    add s2,t0,s2
    
    lw s3,0(s2)
    lw s4,4(s2)
    
    #if s3 < s4 then out to add_i 
    ble s3,s4,add_i
    j swap
    
    #j--
    addi t3,t3,-1
    j bubble_calcu
        
    
    
add_i: # means next i_for_loop
    addi t1,t1,1 #i++
    j bubble
    
ready_end:
    la a0,str2
    li a7,4
    ecall
    
    jal ra,print_array
    
    li a7,10
    ecall  
    
swap:
    #num = 4
    addi s2,zero,4
    #let s5 be 4*j to point the array
    mul s2,s2,t3
    add s2,t0,s2
    
    lw s3,0(s2)
    lw s4,4(s2)
    
    sw s3,4(s2)
    sw s4,0(s2)
    
 ret
    
print_array:
    
    la a0,space
    li a7,4
    ecall
    
    li a7,1
    lw t1,0(t0)
    mv a0,t1
 
    ecall
    
    addi t0,t0,4
    addi t2,t2,-1
    
    bne t2,zero,print_array
    
    la a0,changeline
    li a7,4
    ecall
    
    ret 