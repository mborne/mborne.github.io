# Les instructions

> 🤖 Rédaction assistée par IA.

## Définition

Une instruction est une **étape élémentaire** d'un programme : elle décrit **une action à réaliser** (affecter une valeur, appeler une fonction, répéter un traitement...).

À la différence d'une [expression](expression.md) qui produit une valeur (ex : `a + 1`), une instruction **réalise une action** (ex : `a = a + 1;`).

## En pratique

Nous distinguerons les **instructions machine**, exécutées directement par le processeur, des **instructions des langages de haut niveau** (*statements*), qui seront traduites en une ou plusieurs instructions machine.

### Langage machine ou assembleur

* Le **langage machine** est constitué des instructions binaires définies par le [jeu d'instructions](https://fr.wikipedia.org/wiki/Jeu_d%27instructions) du processeur (x86-64, ARM...).
* L'**assembleur** donne un nom lisible à chacune de ces instructions (voir par exemple [www.felixcloutier.com - x86 and amd64 instruction reference](https://www.felixcloutier.com/x86/)).

### Langage de haut niveau

Les **langages de haut niveau** apportent des abstractions :

* Un **compilateur** les traduit en langage machine (C, C++, Rust...).
* Un **interpréteur** ou une **machine virtuelle** les exécute, souvent via un *bytecode* intermédiaire et une compilation à la volée (Python, Java, JavaScript...).

Par exemple, pour l'incrémentation d'un entier `x` stocké dans le registre `eax` :

| Niveau | Instruction |
| ------ | ----------- |
| Langage C | `x = x + 1;` |
| Assembleur x86 | `add eax, 1` |
| Langage machine | `83 C0 01` |

Nous retrouverons notamment les instructions suivantes :

* L'**affectation** (`a = 3;`, voir [Les opérateurs](operateur.md#loperateur-daffectation))
* L'**appel de fonction** (`print(a);`, voir [Les fonctions](fonction.md))
* Le **retour de fonction** (`return a;`)
* Les **instructions conditionnelles** (`if`, `switch`)
* Les **boucles** (`for`, `while`, voir [Les boucles](boucles.md))

Ces instructions sont séparées par un **point-virgule** (C, Java, JavaScript...) ou un **saut de ligne** (Python) et peuvent être regroupées en [blocs d'instructions](instruction-bloc.md).

## Liens utiles

* [fr.wikipedia.org - Instruction (informatique)](https://fr.wikipedia.org/wiki/Instruction_(informatique))
* [fr.wikipedia.org - Jeu d'instructions](https://fr.wikipedia.org/wiki/Jeu_d%27instructions)
* [godbolt.org](https://godbolt.org/) permet de visualiser le code assembleur généré par les compilateurs.
