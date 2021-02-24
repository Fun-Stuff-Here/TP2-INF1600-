.data
.globl adr_temp,adr_res
adr_temp:
     .int 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,3,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64
adr_res:
     .int 1

.text  
.globl calcul_3

calcul_3 :
     # prologue
     pushl %ebp
     movl %esp, %ebp
     pushl %ebx

     # init
     movl $63, %ecx                     # nIteration BOUCLE_INIT
     movl $256, %edx                    # index de fin
     movl $1, adr_temp(%edx)            # force temp[256] a 1
     # loopyloop for little endian adr_temp(index 00000....1)

BOUCLE_INIT: 
     movl $0, adr_temp(,%ecx,4)         # force temp[:255] a zero 
     loop BOUCLE_INIT                   # loopppylooop

     movl $0, %eax                      # force eax a zero
     movl $10, %ecx                     # nIteration BOUCLE_PUISSANCE
     movl $0, %ebx                      # initialise i

BOUCLE_PUISSANCE:
     pushl %ecx                         # sauvegarde ecx

     # init
     movl $64, %ecx                     # nIteration BOUCLE_ADDITION
     movl $0, %edx                      # initialise j
BOUCLE_ADDITION:
     CLC                                # clear CF

     # addition
     movl adr_temp(,%edx,4), %eax       # prend le dernier multiple de trois
     adc adr_temp(,%edx,4),%eax         # additionne une deuxieme fois multiple de trois
     adc adr_temp(,%edx,4),%eax         # additionne une troisieme fois multiple de trois
     movl %eax, adr_res(%ebx,%edx,4)    # sauvegarde du resultat    
     movl %eax, adr_temp(,%edx,4)       # sauvegarde du resultat dans temp 

     inc %edx                           # j++
     loop BOUCLE_ADDITION               #
     popl %ecx                          # reprend nIteration BOUCLE_PUISSANCE

     add $256, %ebx                     # i++
     loop BOUCLE_PUISSANCE              # loopyyloop

FIN:
     # epilogue 
     popl %ebx
     leave
     ret
