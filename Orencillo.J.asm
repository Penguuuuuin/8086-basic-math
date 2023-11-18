.model small

.stack 100

.data               
    d1 db  10d,13d,     '+-------------------------+ $'
    msg0 db 10d,13d,    '|  Simple Mathematics     | $'
    msg00 db 10d,13d,   '|  [1] Addition           | $'   
    msg000 db 10d,13d,  '|  [2] Subtraction        | $'  
    d2 db 10d,13d,      '+-------------------------+ $'
    msg1 db 10d,13d,    'What is your choice: $'
    msg2 db 10d,13d,    'Error! your choice is not an option $'
    msg3 db 10d,13d,    'Enter first integer : $'
    msg4 db 10d,13d,    'Enter second integer : $'
    msg5 db 10d,13d,    'Result : $'
   
    msg6 db 10d,13d,    'Start Again? [Y/N]? $'  
    msg7 db 10d,13d,    'Error! your choice is not an option [Y/N] only. $'
    msg8 db 10d,13d,    'Thank you for running my program. $'
      
.code
    .startup 
    mov dx, offset d1
    mov ah, 09h
    int 21h
    
    mov dx, offset msg0
    mov ah, 09h
    int 21h
    
    mov dx, offset msg00
    mov ah, 09h
    int 21h
    
    mov dx, offset msg000
    mov ah, 09h
    int 21h
    
    mov dx, offset d2
    mov ah, 09h
    int 21h 
    
    ;Operation
    mov dx, offset msg1
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h 
 
    
    ;cmp add/sub
    cmp al, '1'
    je addition
    
    
    cmp al, '2'
    je subtraction
    
    
    call wrong
    Wrong:
    mov dx, offset msg2
    mov ah, 09h
    int 21h    
    jmp .startup 
       
        
    
    
   ;add
    addition:
    ;1st integer
    mov dx, offset msg3
    mov ah, 09h
    int 21h
    
    ;input
    mov ah, 01h
    int 21h
    mov bl,al
                
    ;2nd integer            
    mov dx, offset msg4
    mov ah, 09h
    int 21h
    
    ;input
    mov ah, 01h
    int 21h
    mov bh,al
    
    ;sum
    mov ah, 09h
    mov dx, offset msg5
    int 21h
    
    add bl,bh
    sub bl,48
    mov ah,02h
    mov dl,bl
    int 21h
    
        
    ;start again?
    start_again:
    mov dx, offset msg6
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
   
    
    ;compare Y/N
    cmp al, 'Y'
    je restart
    cmp al, 'y'
    je restart
    
    cmp al, 'N'
    je exit
    cmp al, 'n'
    je exit 
              
    call wrong1
    wrong1:
    mov dx, offset msg7
    mov ah, 09h
    int 21h
    jmp start_again
   
    restart:
    jmp .startup
   
    exit:
    mov dx, offset msg8
    mov ah, 09h
    int 21h
    .exit   
    
    
    ;sub
    subtraction:
    ;1st integer
    mov dx, offset msg3
    mov ah, 09h
    int 21h
    
    ;input
    mov ah, 01h
    int 21h
    mov bl,al
                
    ;2nd integer            
    mov dx, offset msg4
    mov ah, 09h
    int 21h 
    
    ;input
    mov ah, 01h
    int 21h
    mov bh,al
    
    ;difference
    mov dx, offset msg5
    mov ah, 09h
    int 21h
    
    sub bl,bh
    add bl,48
    mov ah,02h
    mov dl,bl
    int 21h
    
    
    ;start again?
    start_again1:
    mov dx, offset msg6
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
   
    
    ;compare Y/N
    cmp al, 'Y'
    je restart
    cmp al, 'y'
    je restart
    
    cmp al, 'N'
    je exit
    cmp al, 'n'
    je exit 
              
    call wrong2
    Wrong2:
    mov dx, offset msg7
    mov ah, 09h
    int 21h
    jmp start_again1
             
    mov dx, offset msg8
    mov ah, 09h
    int 21h
    jmp start_again
     
   .exit 
end