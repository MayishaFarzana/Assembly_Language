.MODEL SMALL
.STACK 100H  
.DATA
MSG1 DB 'ENTER A STRING$'

 .CODE
 MAIN PROC
   MOV AX,@DATA
   MOV DS,AX  
   
   LEA DX,MSG1
   MOV AH,9
   INT 21H
   
    XOR CX,CX  ;COUNT=0
    
    MOV AH,1     ;TAKING INPUT
    INT 21H
    
 WHILE_:                ;CARRAGE RETURN?
    CMP AL,0DH
    JE END_WHILE
    
    PUSH AX ;PUSH IT ON THE STACK
    INC CX    ;COUNT=COUNT+1
    
    INT 21H  ;READ A CHAR
    JMP WHILE_
    
    END_WHILE:
    
    MOV AH,2       ;GO TO NEW LINE
    MOV DL,0DH     ;CR
    INT 21H
    MOV DL,0AH   ;LINE FEED
    INT 21H
    JCXZ EXIT ;JUMP SHORT IF CX REGISTER IS 0
    
    TOP:
    POP DX    ;POP A CHAR FROM STACK
    INT 21H    ;DISPLAY IT 
    LOOP TOP
   ;END FOR 
    EXIT:
    MOV AH,4CH
    INT 21H
 MAIN ENDP
 END MAIN
 