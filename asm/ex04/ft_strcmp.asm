section .text
    global ft_strcmp

ft_strcmp:
    push esi
    push edi
    mov esi, [esp + 12] ; s1
    mov edi, [esp + 16] ; s2

.loop:
    mov al, [esi]
    mov cl, [edi]

    cmp al, cl
    jne .diff
    cmp al, 0
    je .equal

    inc esi
    inc edi
    jmp .loop

.diff:
    movzx eax, al
    movzx ecx, cl
    sub eax, ecx
    jmp .end

.equal:
    xor eax, eax
    jmp .end

.end:
    pop edi
    pop esi
    ret