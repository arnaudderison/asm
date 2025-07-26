# 🧐 Apprendre l’Assembleur x86 — Exercice 1 : Quitter proprement (`exit(0)`)

> Ce guide est destiné à quelqu’un qui **n’a jamais codé**.
> Tu vas écrire ton **premier programme** en assembleur x86 (32 bits) étape par étape, avec **toute la théorie expliquée**.

---

## 🌟 Objectif

Écrire un programme qui :

1. Commence à s'exécuter
2. Demande à Linux de **quitter**
3. Quitte proprement avec le **code de retour 0**

---

## 🔧 C’est quoi l’assembleur ?

L’assembleur est un langage très bas niveau, **proche du langage machine**.

Contrairement à Python ou JavaScript :

* Tu parles **directement au processeur**
* Tu gères **toi-même la mémoire, les appels système, etc.**
* C’est ultra puissant, mais très précis

---

## 🧱 Structure d’un programme assembleur

Un programme assembleur contient :

* Une **section de texte** pour le code exécutable
* Un **point d’entrée** (`_start`) où le programme commence
* Des **instructions** à exécuter, comme `mov`, `int`, etc.

Exemple :

```asm
section .text        ; ici commence le code du programme
global _start        ; point de départ reconnu par le système

_start:
    ; instructions ici
```

---

## 🧠 Théorie pour l'exercice `exit(0)`

### 1. 🔢 Les registres

Ce sont de petites zones mémoire **dans le processeur**.

| Nom               | Rôle                                                  |
| ----------------- | ----------------------------------------------------- |
| `eax`             | Contient le **numéro du syscall** (ex: 1 pour `exit`) |
| `ebx`             | Contient le **1er argument** du syscall               |
| `ecx`, `edx`, ... | 2e, 3e arguments, etc.                                |

---

### 2. 💥 Les appels système (syscalls)

Linux fournit des **services internes** (écrire à l’écran, lire un fichier, quitter un programme...).

Pour y accéder, tu dois :

* Mettre le **numéro** du service voulu dans `eax`
* Mettre les **paramètres** dans les autres registres
* Exécuter l’instruction `int 0x80` pour **demander au système de faire l’action**

---

### 3. 📦 Exemple du syscall `exit`

Appel système `exit` : il **quitte le programme**

* Numéro = `1` (donc `eax = 1`)
* Argument = code retour (`0`, donc `ebx = 0`)
* Exécution avec `int 0x80`

---

## ✅ Code complet de l’exercice

Créer un fichier appelé `exit.asm` avec le contenu suivant :

```asm
section .text
global _start

_start:
    mov eax, 1      ; syscall numéro 1 = exit
    mov ebx, 0      ; on demande à quitter avec le code 0
    int 0x80        ; déclenche le syscall
```

---

## 💠 Compilation et exécution (sous Linux 32 bits)

### 1. Installer l'assembleur

```bash
sudo apt update
sudo apt install nasm
```

### 2. Compiler

```bash
nasm -f elf32 exit.asm      # assemble le code
```

### 3. Lier

```bash
ld -m elf_i386 -o exit exit.o  # lie et crée l'exécutable 32 bits
```

### 4. Exécuter

```bash
./exit
echo $?
```

Résultat attendu : `0`

---

## 🔍 Explication ligne par ligne

```asm
section .text
```

➡️ Commence la section de code (obligatoire pour écrire des instructions).

```asm
global _start
```

➡️ Déclare le **point d’entrée** du programme. Linux commencera l’exécution ici.

```asm
_start:
```

➡️ Label (nom) marquant le début du programme.

```asm
mov eax, 1
```

➡️ On dit au système : "je veux faire le syscall numéro 1" → `exit`

```asm
mov ebx, 0
```

➡️ On dit : "je veux quitter avec le code retour 0"

```asm
int 0x80
```

➡️ On lance la requête au système (interruption logicielle pour syscall)

---

## 🔍 Où trouver les numéros de syscall ?

Consulte ces tableaux :
🔗 [https://filippo.io/linux-syscall-table/](Pour les 64 bits)
🔗 [https://gist.github.com/GabriOliv/a9411fa771a1e5d94105cb05cbaebd21](Pour le 32 bits)

Exemples utiles :

| Fonction | Numéro | Description                        |
| -------- | ------ | ---------------------------------- |
| `exit`   | `1`    | Quitte un programme                |
| `write`  | `4`    | Écrit dans un fichier ou à l’écran |
| `read`   | `3`    | Lit depuis un fichier              |

---

## 💼 Et si je suis sur Mac M1/M2 ?

Ton Mac est basé sur **ARM64**, donc incompatible avec l’assembleur x86.

➡️ Solution :

1. Installe l’appli gratuite [UTM](https://mac.getutm.app/)
2. Crée une machine virtuelle **Debian i386**
3. Installe `nasm` dans la VM
4. Suis les étapes de compilation et d’exécution dedans

---

## 🧪 Tu as réussi si...

* Le programme compile sans erreur
* Il s’exécute sans afficher d’erreur
* `echo $?` affiche **0**

---

## 🎓 Bravo !

Tu viens de :

* Comprendre les bases du langage assembleur
* Écrire ton premier programme
* Exécuter un syscall système

Tu es prêt pour la suite : **écrire du texte dans le terminal** avec le syscall `write`.

---
