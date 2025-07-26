# 📏 Exercice — Implémenter `strlen` en assembleur x86 (32 bits)

> Dans cet exercice, tu vas apprendre à parcourir une chaîne de caractères terminée par `0` pour en calculer la **longueur**, comme la fonction `strlen` en C.

---

## 🎯 Objectif

Écrire unw function en assembleur x86 qui :

* Parcourt une chaîne terminée par un octet nul (`0`)
* Compte le nombre d'octets avant ce `0`
* Stocke la longueur dans un registre (ici : `ecx`)

---

## 🧠 Concepts à comprendre avant

### 🔹 Chaîne terminée par 0

En C et en assembleur, une "vraie" chaîne de texte est souvent suivie d’un **octet `0`** pour marquer sa fin.

```asm
str db "Coucou", 0
```

### 🔹 Lire un octet à l’adresse `esi`

```asm
mov al, [esi]  ; charge l’octet pointé par esi dans al
```

### 🔹 Comparer un octet à zéro

```asm
cmp byte [esi], 0
je .done        ; si c'est 0, on saute à la fin
```

### 🔹 Incrémenter un compteur et un pointeur

```asm
inc ecx   ; compteur
inc esi   ; pointeur sur la chaîne
```

---

## 🔧 Code complet et commenté

```asm
section .data
    str db "Coucou", 0      ; la chaîne de texte terminée par un octet nul

section .text
global _start

_start:
    ; Initialiser les registres
    mov esi, str     ; ESI va pointer sur le début de la chaîne "Coucou"
    xor ecx, ecx     ; ECX sera notre compteur (on le met à 0)

.loop:
    cmp byte [esi], 0    ; est-ce qu'on est à la fin de la chaîne ?
    je .done             ; si oui, on saute à la fin

    inc ecx              ; sinon, on ajoute 1 au compteur
    inc esi              ; on passe au caractère suivant
    jmp .loop            ; on recommence la boucle

.done:
    ; À ce stade, ECX contient la longueur de la chaîne

    ; Fin propre du programme : exit(0)
    mov eax, 1           ; syscall numéro 1 = exit
    xor ebx, ebx         ; code de sortie = 0
    int 0x80
```

---

## 🪜 Étape par étape pour débutant

1. **On écrit la chaîne en mémoire** dans `.data`, avec un `0` à la fin (obligatoire pour `strlen`)
2. **`esi`** est le pointeur : il commence au début de la chaîne
3. **`ecx`** est un compteur : on le met à 0
4. À chaque tour de boucle :

   * on lit l’octet `[esi]`
   * si c’est `0`, on arrête
   * sinon, on fait `inc ecx` et `inc esi`
5. Une fois la boucle terminée, `ecx` contient le nombre de caractères
6. On termine proprement le programme avec `exit`

---

## ✅ Tu as réussi si...

* Le programme compile et s’exécute sans erreur
* Tu peux voir la valeur de `ecx` en la comparant à la vraie longueur (manuellement, ou via gdb)
* Tu comprends comment on parcourt une chaîne avec un pointeur

---

Souhaite-tu un second exercice qui affiche la longueur calculée ? Ou qu’on la passe à `write` ?
