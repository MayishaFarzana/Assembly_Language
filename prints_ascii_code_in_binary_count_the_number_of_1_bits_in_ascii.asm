.MODEL SMALL
 .STACK 100H

 .DATA
   STR1  DB  'Enter any character : $'
   STR2  DB  0DH,0AH,'Binary of the character : $'
   STR3  DB  0DH,0AH,'Number of '1': $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                 
     MOV DS, AX

     LEA DX, STR1                
     MOV AH, 9
     INT 21H

     MOV AH, 1                    
     INT 21H

     XOR BX, BX                   
     MOV BL, AL                   

     LEA DX, STR2           
     MOV AH, 9
     INT 21H

     XOR BH, BH                  
     MOV CX, 8                    
     MOV AH, 2                    

     PRINT_OUTPUT:                     
       SHL BL, 1                  

       JNC PRINT_ZERO                  
       INC BH                    
       MOV DL, 31H               
       JMP DISPLAY               

       PRINT_ZERO:                     
         MOV DL, 30H             

       DISPLAY:                  
        INT 21H                  
     LOOP PRINT_OUTPUT                 
     LEA DX, STR3             
     MOV AH, 9
     INT 21H

     OR BH, 30H                  

     MOV AH, 2                    
     MOV DL, BH
     INT 21H

     MOV AH, 4CH                  
     INT 21H
   MAIN ENDP
 END MAIN
