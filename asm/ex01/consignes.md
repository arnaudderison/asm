# 🧪 Exercice — Afficher un message simple avec `write` (assembleur x86)

> Cet exercice te permet d’apprendre à utiliser un appel système pour afficher un texte dans le terminal. Tu ne dois pas recopier une solution, mais suivre les consignes pour le faire toi-même.

---

## 🎯 Objectif

Écris un programme en assembleur x86 (32 bits) qui :

* Affiche "Hello, world!" avec un retour à la ligne
* Utilise le syscall `write` (numéro 4)
* Quitte proprement avec `exit(0)` (numéro 1)

---

## 📚 Ce que tu dois savoir avant

* Le système Linux permet d'afficher un message via un **appel système** appelé `write`
* Pour faire cet appel système, on utilise l'instruction `int 0x80`
* Le texte à afficher doit être stocké dans la section `.data`
* Les registres à remplir sont :

  * `eax` : numéro du syscall (4 pour `write`)
  * `ebx` : le fichier de sortie (1 pour le terminal)
  * `ecx` : adresse du message
  * `edx` : longueur du message

---

## 🔧 Consignes

### Partie 1 — Données

1. Crée une section `.data`
2. Écris une chaîne de caractères "Hello, world!" avec un retour à la ligne (code ASCII : 0xA)
3. Ne termine pas la chaîne par 0 : ce n'est pas une chaîne C

### Partie 2 — Code

4. Crée une section `.text` avec un label `_start`
5. Prépare les registres pour appeler `write` avec ta chaîne
6. Appelle `int 0x80`
7. Ensuite, prépare un appel `exit(0)` avec les bons registres
8. Appelle `int 0x80` à nouveau

### Partie 3 — Compilation

9. Compile ton fichier avec `nasm` et `ld` :

   * Format de sortie : `elf32`
   * Linker 32 bits : `-m elf_i386`

---

## 🧩 Questions pour t'aider

* Où est stockée ta chaîne ? Quelle est sa longueur exacte ?
* Quels registres dois-tu configurer pour appeler `write` ?
* Que se passe-t-il si tu ne fais pas `exit(0)` ?

---

## ✅ Critères de réussite

* Le programme affiche **Hello, world!** dans le terminal, suivi d’un retour à la ligne
* Il quitte proprement (code de retour = 0)
* Tu as **écrit tout toi-même** sans copier de solution

---

Quand tu as fini, demande un retour ou passe à un prochain défi comme `puts` ou `strlen`.
