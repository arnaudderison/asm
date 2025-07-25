# Comprendre l'ASM

L'assembleur est le language le plus proche du **processeur**. On dit qu'il parle directement avec le **CPU**. Il utilise des instructions tres simple que le cpu comprend du style `move`, `add`, `jmp`. Contrairement aux autres languages l'asm ne possede pas de fonction toute faite.

## Comment fonctionne un processeur

Un processeur (comme un X86) travaille avec:

- **Des registres** : mini mémoires ultra rapides (AX, BX, etc.)

- **Des intructions** : Ordres simples (`mov`, `add`, `int`, etc.)

- **Une memoire (RAM)** : ou il lit/ecrit des donnes

- **Des interruptions BIOS** : comme des fonctions prêtes à l’emploi (afficher un caractère, lire une touche, etc.)

## Les registres de base (en 16 bits)

| Registre | Nom complet       | Rôle principal                                                 | Exemple d'utilisation        |
| -------- | ----------------- | -------------------------------------------------------------- | ---------------------------- |
| AX       | Accumulator       | Pour les opérations arithmétiques et les appels système        | `mov ax, 0x1234`             |
| BX       | Base              | Sert souvent à adresser la mémoire (base d’adresse)            | `mov [bx], al`               |
| CX       | Counter           | Utilisé comme compteur dans les boucles ou opérations répétées | `loop .label`                |
| DX       | Data              | Pour des opérations d’entrée/sortie ou division/multiplication | `in al, dx`                  |
| SI       | Source Index      | Utilisé pour lire des données en mémoire (source des chaînes)  | `mov al, [si]`               |
| DI       | Destination Index | Utilisé pour écrire en mémoire (destination des chaînes)       | `mov [di], al`               |
| BP       | Base Pointer      | Sert à accéder à la pile (stack), souvent dans les fonctions   | `mov ax, [bp+4]`             |
| SP       | Stack Pointer     | Pointeur vers le haut de la pile                               | `push ax` / `pop ax`         |
| IP       | Instruction Ptr   | Contient l’adresse de la prochaine instruction (invisible)     | Modifié automatiquement      |
| FLAGS    | Flags Register    | Contient les indicateurs de statut (zero, carry, etc.)         | Affecté par les comparaisons |

## Les intructions de base

| Instruction | Description                                           | Exemple          | Effet                                                   |
| ----------- | ----------------------------------------------------- | ---------------- | ------------------------------------------------------- |
| `mov`       | Copie une valeur dans un registre ou une case mémoire | `mov ax, 0x1234` | Met la valeur 0x1234 dans AX                            |
| `add`       | Additionne deux valeurs                               | `add ax, bx`     | AX = AX + BX                                            |
| `sub`       | Soustrait deux valeurs                                | `sub cx, 1`      | CX = CX - 1                                             |
| `inc`       | Incrémente de 1                                       | `inc si`         | SI = SI + 1                                             |
| `dec`       | Décrémente de 1                                       | `dec sp`         | SP = SP - 1                                             |
| `jmp`       | Saute inconditionnellement à une étiquette            | `jmp boucle`     | Change le flux d’exécution                              |
| `cmp`       | Compare deux valeurs (ne change pas les registres)    | `cmp ax, bx`     | Met à jour les flags pour `je`, `jne`, etc.             |
| `je`        | Saute si égal (`cmp` précédent donne égalité)         | `je fin`         | Saut si AX == BX                                        |
| `jne`       | Saute si différent                                    | `jne erreur`     | Saut si AX ≠ BX                                         |
| `int`       | Appelle une interruption BIOS ou système              | `int 0x10`       | Appelle une fonction d’affichage (écran, clavier, etc.) |
| `nop`       | Ne fait rien (utile pour le timing ou le debug)       | `nop`            | Exécution vide                                          |
| `lodsb`     | Charge un octet depuis `[SI]` dans `AL`, puis `SI++`  | `lodsb`          | AL = [SI], SI = SI + 1                                  |
| `stosb`     | Stocke `AL` dans `[DI]`, puis `DI++`                  | `stosb`          | [DI] = AL, DI = DI + 1                                  |
| `push`      | Empile un registre sur la pile                        | `push ax`        | SP = SP - 2, [SP] = AX                                  |
| `pop`       | Dépile la pile dans un registre                       | `pop dx`         | DX = [SP], SP = SP + 2                                  |
| `call`      | Appelle une sous-routine (fonction)                   | `call afficher`  | Empile IP, saute à `afficher`                           |
| `ret`       | Retour d’une fonction                                 | `ret`            | Dépile l’adresse de retour et saute à cette adresse     |
