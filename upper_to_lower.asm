INCLUDE 'EMU8086.INC'
 .MODEL SMALL
.STACK 100H
.DATA 
MSG1 DB 'ENTER  $'
MSG2 DB 'LOWER :$ '
C DB ?,'$'
.CODE
MAIN PROC  
    MOV AX,@DATA
    MOV DS,AX  
    
    MOV AH,9
    LEA DX,MSG1    
    INT 21H
    
     MOV AH,1
     INT 21H
     MOV C,AL 
     ADD C,20H  
     
     PRINTN
     MOV AH,2
     MOV DL,C
     INT 21H          
     
      MOV AH,4CH
      INT 21H
      
      END MAIN
      
 