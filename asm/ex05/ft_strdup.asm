section .text
    global ft_strdup
    extern malloc
    extern ft_strlen

ft_strdup:
    push ebp
    mov ebp, esp
    push esi ; pointer source pour s1
    push edi

    mov esi, [ebp + 8] ; dans esi s1

    push esi
    call ft_strlen
    add esp, 4 ; nettoyage de la pile

    inc eax ; pour le /0
    push eax
    call malloc
    add esp, 4 ; nettoyage de la pile

    test eax, eax
    jz .fail

    ; si pas fail alors on va copier
    mov edi, eax ; pointer source

.copy:
    mov cl, [esi]
    mov [edi], cl
    inc esi
    inc edi
    test cl, cl
    jnz .copy

    pop edi
    pop esi
    mov esp, ebp
    pop ebp

    ret

.fail:
    xor eax, eax
    pop edi
    pop esi
    mov esp, ebp
    pop ebp
    ret


section .note.GNU-stack noexec nowrite progbits