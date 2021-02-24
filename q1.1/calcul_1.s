.data
.globl adr
adr:
   .int 1,2,3,4,5,6,7,8,9,10,11,12,12,14,15,16,17,18    #Cases memoires debutant de l'adresse adr
   
.text
.globl calcul_1

calcul_1 :

   #prologue
   pushl %ebp
   movl %esp , %ebp
   pushl %ebx             #Respect convention c

   #init
   movl $18, %ecx          #load nIteration
   movl adr, %ebx          #load premier nombre
   movl $0, %edx           #reset edx

BOUCLE:
   movl %ebx,  %eax        # load dans eax l'element ecx du tableau adr
   addl %eax, %ebx         # += x
   addl %eax, %ebx         # += x
   movl %ebx, adr(%edx)    # store ebx dans l'element ecx du tableau adr 
   addl $4, %edx           # increase offset

   #Condition
   loop BOUCLE     

   #epilogue
   popl %ebx
   leave    
   ret



   

