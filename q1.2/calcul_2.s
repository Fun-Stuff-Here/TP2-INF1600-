.text
.globl calcul_2
calcul_2 :

    #prologue
    pushl %ebp
    movl %esp , %ebp

    #initialisation
    movl $64, %ecx                  #nIteration = 64
    movl $0, %eax                   #eax =0
    movl $0, %edx                   #ebx=0
    jmp BOUCLE


RETENUE:
    inc %eax                        #ajoute la retenue 

BOUCLE:
    CLC                             #clear CF
    addl adr_x(,%edx,4), %eax       #add xi
    addl adr_y(,%edx,4), %eax       #add yi
    movl %eax, adr_z(,%edx,4)       #store zi
    movl $0, %eax                   #eax =0 
    inc %edx                        #augment l'index

    #Condition
    dec %ecx                        #nIteration -1
    jecxz FIN                       #jump fin si nIteration ==0
    jc RETENUE                      #jump RETENUE si CF=1
    jmp BOUCLE                      #jump BOUCLE 

FIN:
    #epilogue
    leave
    ret


   

