  .MODEL SMALL
.STACK 100H

.DATA 
   COUNTER DW  0
   MSG1  DB  'Enter A String : $'
   MSG2  DB  0DH,0AH,'In reverse order : $'


.CODE
   MAIN PROC
     MOV AX, @DATA                
     MOV DS, AX
      
      
     LEA DX,MSG1            
     MOV AH, 9
     INT 21H
     XOR CX, CX                   
     MOV AH, 1                

    @USERINPUT:
                      
     INT 21H                   
     CMP AL, 0DH              
     JE @END_USERINPUT            
     PUSH AX                 
     INC CX                   
     JMP @USERINPUT                  

    
    @END_USERINPUT:                  
               
               
     MOV BX, 50H                
     XCHG BX, SP                  
     PUSH 0020H                   
     XCHG BX, SP                 
     INC COUNTER
                     
    
     @LOOP_1:                  
       
      POP DX                    
      XCHG BX, SP             
      PUSH DX                  
      XCHG BX, SP              
      INC COUNTER
                        
     LOOP @LOOP_1                
     
     
     LEA DX, MSG2             
     MOV AH, 9
     INT 21H

     MOV CX, COUNTER               
     MOV COUNTER, 0                
 
     PUSH 0020H                  
     INC COUNTER                

     @PRINT:                     
      
      XCHG BX, SP               
      POP DX                    
      XCHG BX, SP              
      CMP DL, 20H               
      JNE @SKIP_PRINTING        
      MOV AH, 2                 

       @LOOP_2:                  
        
      POP DX                   
      INT 21H                  
        
      DEC COUNTER              
      JNZ @LOOP_2               

      MOV DX, 0020H             

     
      @SKIP_PRINTING:        

       PUSH DX                   
       INC COUNTER                 
       LOOP @PRINT                 
     
     
      MOV AH, 4CH                
      INT 21H 
      
     MAIN ENDP
    
     END MAIN