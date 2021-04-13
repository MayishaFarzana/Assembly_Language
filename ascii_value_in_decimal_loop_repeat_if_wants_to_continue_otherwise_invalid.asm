 .MODEL SMALL
.STACK 100H
.DATA         
MSG DB 0DH,0AH,"ENTER A HEX DIGIT 0 TO 9 OR A TO F: $"
MSG1 DB  0DH,0AH,"DO YOU WANT TO ANOTHER  INPUT: $"
MSG2 DB  0DH,0AH,"IN DECIMAL IT IS: $"
MSG4 DB 0DH,0AH,"INVALID INPUT"
.CODE      

MAIN PROC
   
  
    AGAIN_INPUT: 
    MOV AX,@DATA
    MOV DS,AX 
    LEA DX,MSG
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H 
    MOV BL,AL
    CMP BL,'F'
    JG INVALID_INPUT 
    CMP BL,'9'
    JE NUMBER_HEXA
    JL NUMBER_HEXA 
    JG HEXA_DIGIT 
      
    NUMBER_HEXA:
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    MOV AH,2   
    MOV DL,BL
    INT 21H 
    JMP AGAIN_YES_NO 
                       
          
    HEXA_DIGIT:
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,31H
    INT 21H
    SUB BL,11H
    MOV AH,2
    MOV DL,BL
    INT 21H
    JMP AGAIN_YES_NO
     
    AGAIN_YES_NO:
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    CMP AL,'Y'
    JE AGAIN_INPUT
    CMP AL,'N'
    JE END
    
    INVALID_INPUT:
    LEA DX,MSG4
    MOV AH,9
    INT 21H    
    JMP AGAIN_INPUT
    
    END:  

    MOV AH,4CH
    INT 21H
    END MAIN
