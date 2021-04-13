.MODEL SMALL
.STACK 100H
.DATA

MSG DB 'AA$'
X DB ?
Y DB ?
Z DB ?

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 2
    MOV DL, '?'
    INT 21H
    
    ;START INPUT
    MOV AH, 1
    INT 21H
    MOV X, AL
    
    MOV AH, 1
    INT 21H
    MOV Y, AL
    
    MOV AH, 1
    INT 21H
    MOV Z, AL
     
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    
    
    ;COMPARISON
    LOOP:
    
    MOV BL, X
    CMP BL, Y
    JG XY
    
    MOV BL, Y
    CMP BL, Z
    JG YZ   
    
    JMP END
    
    ;SWAPING
    
    XY:
    MOV CL, Y
    MOV X, CL
    MOV Y, BL
    JMP LOOP
    
    YZ:
    MOV CL, Z
    MOV Y, CL
    MOV Z, BL
    JMP LOOP
   
   END: 
 
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    
    
    MOV AH, 2
    MOV DL, X
    INT 21H
    
    MOV AH, 2
    MOV DL, Y
    INT 21H
    
    MOV AH, 2
    MOV DL, Z
    INT 21H
    
    
    MOV AH, 4CH
    INT 21H
    
    END MAIN
    