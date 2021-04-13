INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
 .DATA
 MSG1 DB 'ENTER TWO CAPITAL LETTERS $'
 .CODE
MAIN PROC
  MOV AX,@DATA
  MOV DS,AX
   LEA DX,MSG1
   MOV AH,9
   INT 21H
   
   MOV AH,1
   INT 21H
   MOV BL,AL
   
   MOV AH,1
   INT 21H
   MOV BH,AL
   
    PRINTN
    
    CMP BH,BL
    JGE FIRST_BIG  
    JLE SECOND_BIG
    
    FIRST_BIG:
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    JMP END
    
   SECOND_BIG:
   MOV AH,2
   MOV DL,BH
   INT 21H
   MOV AH,2
   MOV DL,BL
   INT 21H
   JMP END
   END:
   MOV AH,4CH
   INT 21H
   MAIN ENDP
   END MAIN
    
    
  