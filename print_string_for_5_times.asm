   INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV CX,5  ;given input
    MOV BX,0  ;initialize
    START:       ;for(int i=0;i<n;i++)
    CMP BX,CX    ;i<n
    JE LAST
    PRINTN 'HELLO'  
    INC BX
    
   JNE START: 
   LAST:
   PRINTN 'THE PROGRAM HAS STOPPED'
    
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN