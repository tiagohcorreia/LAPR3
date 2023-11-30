.section .text
    .globl extract_token

extract_token:

    movl $0, %ecx               
    
search_token:
    movb (%edi, %ecx), %al      
    cmpb $0, %al                 
    je token_not_found           
    cmpb $'=', %al              
    je check_token              
    incl %ecx                    
    jmp search_token            

check_token:
   
    movl $0, %esi               
    incl %ecx                    
    
compare_token:
    movb (%esi), %al             
    cmpb $0, %al                 
    je token_found              
    movb (%esi), %al             
    cmpb (%edi, %ecx), %al       
    jne token_not_found          
    incl %ecx                   
    incl %esi                   
    jmp compare_token            

token_found:
    # Extrair o valor associado ao token
    movl $0, %edx                
    incl %ecx                    
    movl $0, %ebx                
    
convert_digit:
    movb (%edi, %ecx), %al       
    cmp $'0', %al                
    jl token_not_found           
    cmp $'9', %al                
    jg token_not_found           
    imull $10, %edx              
    sub $'0', %al               
    add %eax, %edx              
    incl %ecx                   
    jmp convert_digit           

token_not_found:
    movl $-1, %edx               
    jmp check_end                

check_end:
    ret
