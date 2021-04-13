INCLUDE 'EMU8086.INC'
.MODEL SMALL  
.STACK 100H
.DATA
MSG DW 'THREE INITIAL WORDS $'
F DB ,'?'
M DB ,'?'
L DB ,'?'
.CODE 
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV F,AL
    MOV AH,1
    INT 21H
    MOV M,AL
    MOV AH,1  
    INT 21H
    MOV L,AL
    
    PRINTN
    MOV DL,F
    MOV AH,2
    INT 21H
    PRINTN
    MOV DL,M
    MOV AH,2
    INT 21H
    PRINTN
    MOV DL,L
    MOV AH,2
    INT 21H
    MAIN ENDP
END MAIN