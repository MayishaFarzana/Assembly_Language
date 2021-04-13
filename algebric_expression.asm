   .MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 0DH,0AH,'Type an algebric expression: $'
    MSGC DB 0DH,0AH,'Expression is correct.$'
    MSGL DB 0DH,0AH,'Too many left brackets.$'
    MSGR DB 0DH,0AH,'Too many right brackets.$'
    MSGM DB 0DH,0AH,'Bracket mismatch.Start over.$'
    MSGY DB 0DH,0AH,'If you want to continue,type "y".$'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    BEGIN:
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV CX,0
    MOV AH,1
    
    INPUT:
    INT 21H
    CMP AL,0DH
    JE END
    
    CMP AL,"["
    JE PUSHBR
             
    CMP AL,"{"
    JE PUSHBR
    
    CMP AL,"("
    JE PUSHBR
    
    CMP AL,")"
    JE ROUNDBR
    
    CMP AL,"}"
    JE CURLYBR
    
    CMP AL,"]"
    JE SQUAREBR  
    
    JMP INPUT
    
    PUSHBR:
    INC CX
    PUSH AX
    JMP INPUT
    
    ROUNDBR:
    POP DX
    DEC CX
    CMP CX,0
    JL RIGHTBR
    
    CMP DL,"("
    JNE MISMATCH
    JMP INPUT
    
    CURLYBR:
    POP DX
    DEC CX
    CMP CX,0
    JL RIGHTBR
    
    CMP DL,"{"
    JNE MISMATCH
    JMP INPUT
    
    SQUAREBR:
    POP DX
    DEC CX
    CMP CX,0
    JL RIGHTBR
    
    CMP DL,"["
    JNE MISMATCH
    JMP INPUT
    
    END:
    CMP CX,0
    JNE LEFTBR
    
    MOV AH,9
    LEA DX,MSGC
    INT 21H
    
    MOV AH,9
    LEA DX,MSGY
    INT 21H    
    
    MOV AH,1
    INT 21H
    
    
    CMP AL,"y"
    JNE EXIT
    JMP BEGIN
    
    MISMATCH:
    MOV AH,9
    LEA DX,MSGM
    INT 21H
    JMP BEGIN
    
    LEFTBR:
    MOV AH,9
    LEA DX,MSGL
    INT 21H
    JMP BEGIN 
    
    RIGHTBR:
    MOV AH,9
    LEA DX,MSGR
    INT 21H
    JMP BEGIN
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    