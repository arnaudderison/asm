section .data
    msg db "Hello World!", 0x0A ; 0x0A -> pour le retour a la ligne (valeur ascii em Hex)
    len equ $ - msg

section .text
global _start

_start:
    ;write message
    mov eax, 0x04
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    ;exit
    mov eax, 1 ; numero du syscall 'exit'
    xor ebx, ebx ; code de sortie = 0
    int 0x80 ; appel system