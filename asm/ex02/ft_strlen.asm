section .text
    global ft_strlen

ft_strlen:
    mov esi, [esp + 4]
    xor eax, eax

.loop:
    cmp byte [esi], 0
    je .done

    inc esi
    inc eax
    jmp .loop

.done:
    ret


section .note.GNU-stack noalloc noexec nowrite progbits


; esp est le registre qui correpond a la pile
; pour recuperer le premier argument on fait esp + 4
; pourquoi ?
; esp addresse de retour empile par call
;   comme on est en 32 bits chaque element vaut 4 octeds
;   apres esp (valeur de retour) se trouce les arguments
; donc 
; pour argument 1 esp + 4
; pour argument 2 esp + 8 
; etc

; esi est un registre 32 bits pour pointer une source
; En gros esi contient une adresse stockers en 32 bits 
; qui dans notre cas cas pointer vers une chaine de char
;

; ret est comme un return en c il dit cette fonction est termine...
; il y a une convention d'appel qui dit que le resultat de chaque fonction est dans le registre eax
;
;
;
;