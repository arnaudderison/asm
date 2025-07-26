; En asm le code est separer en plusieurs sections (les donnes, etc)
; .text est la section pour ecrire le code (lieu ou ecrire les instructions pour le cpu)
section .text
; cette ligne declare un label* _start pour dire le programme commence ici a "_start"
global _start

_start:
mov eax, 1 ; numero su syscall 'exit'
xor ebx, ebx ; code de sortie = 0
int 0x80 ; appel system


;LABEL: nom donne a une position dans le code (ne fais rien juste permet de separer le code un peu comme une fonction)