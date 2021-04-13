  .MODEL SMALL
 .STACK 100H

 .DATA
   MSG1  DB  0DH,0AH,'Enter a Hex number ( 0000 - FFFF ) : $'
   MSG2  DB  0DH,0AH,'Enter another Hex number ( 0000 - FFFF ) : $'
   MSG3  DB  0DH,0AH,'The SUM of given Hex numbers in Hex form is : $'
   MSG4  DB  0DH,0AH,'Wrong Hex digit.Try again.$'

   COUNT     DB  ?
   VALUE     DW  ?

 .CODE
   MAIN PROC
     MOV AX, @DATA               
     MOV DS, AX

     JMP DISPLAY_MSG1               
     DISPLAY_MSG4:                   
       LEA DX, MSG4            
       MOV AH, 9
       INT 21H

     DISPLAY_MSG1:                    
       LEA DX, MSG1          
       MOV AH, 9
       INT 21H

       XOR BX, BX              
       MOV COUNT, 30H             

     INPUT:                   
       MOV AH, 1                  
       INT 21H                    

       CMP AL, 0DH                
       JNE CHECK               

       CMP COUNT, 30H            
       JBE DISPLAY_MSG4            
       JMP @END_1                 

       CHECK:                  

       CMP AL, "A"               
       JB @DECIMAL_1             

       CMP AL, "F"                
       JA DISPLAY_MSG4               
       ADD AL, 09H               
       JMP @OK_1                 

       @DECIMAL_1:                
         CMP AL, 30H              
         JB DISPLAY_MSG4              

         CMP AL, 39H              
         JA DISPLAY_MSG4              

       @OK_1:                    

       INC COUNT                  

       AND AL, 0FH                

       MOV CL, 4                  
       SHL AL, CL                 

       MOV CX, 4                 

       @LOOP_1:                  
         SHL AL, 1               
         RCL BX, 1               
                                  
       LOOP @LOOP_1               

       CMP COUNT, 34H             
       JE @END_1                  
       JMP INPUT              
       @END_1:                    

       MOV VALUE, BX            

       LEA DX, MSG2          
       MOV AH, 9
       INT 21H

       XOR BX, BX                 
       MOV COUNT, 30H            

       @START_4:                  
         MOV AH, 1                
         INT 21H                  

         CMP AL, 0DH              
         JNE @SKIP_2              

         CMP COUNT, 30H         
         JBE DISPLAY_MSG4             
         JMP @END_2               

         @SKIP_2:                 

         CMP AL, "A"              
         JB @DECIMAL_2           

         CMP AL, "F"              
         JA @JUMP                 
         ADD AL, 09H              
         JMP @OK_2               

         @DECIMAL_2:             
           CMP AL, 30H            
           JB @JUMP               

           CMP AL, 39H            
           JA @JUMP               
           JMP @OK_2               

         @JUMP:                   
           JMP DISPLAY_MSG4           

         @OK_2:                   

         INC COUNT                

         AND AL, 0FH              

         MOV CL, 4                
         SHL AL, CL            

         MOV CX, 4                

         @LOOP_2:                
           SHL AL, 1              
           RCL BX, 1              
                                 
         LOOP @LOOP_2            

         CMP COUNT, 34H           
         JE @END_2               
         JMP @START_4            

       @END_2:                    

     LEA DX, MSG3             
     MOV AH, 9
     INT 21H

     ADD BX, VALUE              
     JNC @SKIP                   
     MOV AH, 2                    
     MOV DL, 31H                 
     INT 21H                     
 
     @SKIP:                      

     MOV COUNT, 30H            

     @LOOP_3:                   
       XOR DL, DL                 
       MOV CX, 4                  

       @LOOP_4:                  
         SHL BX, 1                
         RCL DL, 1                
                                  
       LOOP @LOOP_4               

       MOV AH, 2                  

       CMP DL, 9                  
       JBE @NUMERIC_DIGIT         
       SUB DL, 9                 
       OR DL, 40H                
       JMP @DISPLAY              

       @NUMERIC_DIGIT:            
         OR DL, 30H              

       @DISPLAY:                 
         INT 21H                  

       INC COUNT                  
       CMP COUNT, 34H            
       JNE @LOOP_3                

     ENDPROC:                        

     MOV AH, 4CH                  
     INT 21H
   MAIN ENDP
 END MAIN
