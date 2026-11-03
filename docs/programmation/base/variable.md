# Les variables

> 🤖 Rédaction assistée par IA.

## Définition

Une variable permet de **nommer une valeur** manipulée par le programme. Elle est caractérisée par un **nom**, un [type](types.md) et une **portée**.

Nous distinguerons :

* La **déclaration** qui introduit la variable
* L'**initialisation** qui lui donne une première valeur
* L'**affectation** qui modifie sa valeur

=== "TypeScript"

    ```ts
    let age: number = 20; // déclaration et initialisation
    age = 21;             // affectation
    ```

=== "Java"

    ```java
    int age = 20; // déclaration et initialisation
    age = 21;     // affectation
    ```

=== "Python"

    ```python
    age = 20  # déclaration et initialisation
    age = 21  # affectation
    ```

=== "C++"

    ```cpp
    int age = 20; // déclaration et initialisation
    age = 21;     // affectation
    ```

=== "PHP"

    ```php
    $age = 20; // déclaration et initialisation
    $age = 21; // affectation
    ```

## En pratique

### Le nom

Le nom des variables sera plus ou moins libre en fonction du langage utilisé. Les règles suivantes s'appliquent dans de nombreux langages :

* Le nom ne devra pas commencer par un chiffre (ex : `1a`)
* Le nom ne devra pas être un **mot réservé** du langage (`if`, `class`, `return`...)
* Le tiret (`-`) est interdit car il serait interprété comme l'opérateur de soustraction (`my-value` vaut `my - value`)
* Par prudence, nous nous limiterons aux lettres non accentuées (`[a-zA-Z]`), aux chiffres (`[0-9]`) et aux *underscores* (`_`), même si de nombreux langages acceptent les caractères Unicode (ex : `âge`)

En complément, nous noterons que :

* Certains langages imposent un préfixe (ex : `$age` en PHP).
* De nombreux langages disposent d'une [convention de nommage](../bonnes-pratiques/conventions.md) ajoutant des règles complémentaires.

### Le type

Selon le langage, le **type** est porté par la variable (typage statique) ou par la valeur qu'elle contient (typage dynamique) : voir [Les types](types.md).

### La portée

Une variable aura une **portée**, c'est-à-dire qu'elle sera accessible dans tout ou partie du programme :

* Une **variable globale** sera accessible dans tout le programme.
* Une **variable locale** sera accessible dans un bloc d'instructions ou une fonction (voir [Bloc et portée des variables](bloc-instruction.md#bloc-et-portee-des-variables)).

Nous soulignerons que :

* Le concept de portée permet d'avoir **plusieurs variables de même nom** : une variable locale **masque** alors une variable de même nom d'une portée englobante (*shadowing*).
* La gestion de la portée est **spécifique à chaque langage de programmation**.
* Il est important de bien **maîtriser la portée des variables** pour éviter des bugs liés à la lecture ou la modification de la mauvaise variable.

## Pour aller plus loin

* [Les variables et la mémoire](../memoire/index.md) : pile et tas, **pointeurs** en C, **références** en C++, **propriété** en Rust...
* [Le ramasse-miettes](../memoire/ramasse-miettes.md) : les langages de haut niveau gèrent automatiquement la mémoire, les **objets** étant manipulés **par référence** (les types primitifs restant manipulés par valeur en Java ou en JavaScript).
* [Les variables immuables](variable-immuable.md) : variables qui ne peuvent être modifiées après leur initialisation.

## Liens utiles

* [fr.wikipedia.org - Variable (informatique)](https://fr.wikipedia.org/wiki/Variable_(informatique))
* [en.wikipedia.org - Variable shadowing](https://en.wikipedia.org/wiki/Variable_shadowing)
