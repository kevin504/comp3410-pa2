.data 
           welcome:  .asciiz "Welcome to a wonderful MIPS Program\n" 
           iterate: .asciiz "Iteration: " 
           linebreak: .asciiz "\n" 
            
           first:    .word 21  
                     .word 14 
                     .word 26 
                     .word 39         
                       
  .text 
        
             la $a0, welcome #load welcome message  
         
            li $v0, 4 
            syscall 
             
             
     
            la $s0, first #load address of first into $s0 
            ori $s4, 0 #load into lower 16 the value of 0    
            move $s1, $zero #set s1 to 0 
            
 loop:  slti $s2, $s1, 4 # if s1 greater than 3 then set s2 to 0.     
            beq $s2, $zero, end # if s2 == 0 then branch to end. 
            lw $s3, 0($s0) #load word from s0 into s3 with an offset of 0  
             
             add $s4, $s4, $s3  #add s4 and s3. Store in s4 
            addi $s0, $s0, 4 #add 4 to s0      
            addi $s1, $s1, 1 # add 1 to s1 
              
             la $a0, iterate # load address  
              
            li $v0, 4 
            syscall#print message iterate 
             
            move $a0, $s1 # move the contents of s1 to s0 
           li $v0, 1 
            syscall 
            
             la $a0, linebreak #load linebreak  
            li $v0, 4 
             syscall 
              
              
             j loop #jump back to lo 
             
  
              
    
 end:  
  move $a0, $s4 
  li $v0, 1 
  syscall 