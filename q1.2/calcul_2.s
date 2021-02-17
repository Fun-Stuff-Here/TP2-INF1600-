.text
.globl calcul_2
calcul_2 :

########
#votre code ici
########

    #init
    movl $64, %ecx
    movl $0, %ebx
    movl $0, %edx
    jmp BOUCLE


RETENUE:
    add $1, %ebx

BOUCLE:
    CLC
    movl adr_x(%edx), %ebx 
    addl adr_y(%edx), %ebx
    movl %ebx, adr_z(%edx)
    movl $0, %ebx
    add $4, %edx

    #Condition
    subl $1, %ecx
    jecxz FIN
    jc RETENUE
    jnc BOUCLE

FIN:
    ret


   

