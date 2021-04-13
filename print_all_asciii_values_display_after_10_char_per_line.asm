INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV CL,0
    MOV BL,0
    CONTINUE:
     PRINTN
     MOV BL,0
     
    LOOP:
    MOV AH,2
    MOV DL,CL  
    INT 21H
    INC CL
    INC BL
    CMP BL,10
    JE CONTINUE 
    
    CMP CL,255
    JNE LOOP
    
     MOV AX,4CH
     INT 21H
     
     MAIN ENDP
END MAIN
