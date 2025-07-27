section .text
    global ft_putstr
    extern ft_strlen
    
ft_putstr:
    push ebp
    mov ebp, esp
    push esi

    mov esi, [ebp + 8]    ; ESI ← adresse de la chaîne (1er argument)
    push esi              ; sauvegarde ESI pour ft_strlen
    call ft_strlen        ; EAX ← longueur
    pop esi               ; restaure ESI

    mov edx, eax          ; EDX ← longueur
    mov ecx, esi          ; ECX ← adresse de la chaîne
    mov ebx, 1            ; EBX ← descripteur (1 = stdout)
    mov eax, 4            ; EAX ← syscall write
    int 0x80              ; appel système

    pop esi
    mov esp, ebp
    pop ebp
    ret

section .note.GNU-stack noalloc noexec nowrite progbits