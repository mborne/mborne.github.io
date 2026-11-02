# Les variables

!!! warning "En construction"

    Notes personnelles à relire et compléter pour servir de support pour les cours.

Une variable permet de **nommer une valeur** manipulée par le programme. Nous retrouverons les notions suivantes pour les variables dans la plupart des langages :

* Un **nom**
* Un [type](types.md)
* Une **portée**

En complément, il conviendra de noter que :

* [Les variables et la mémoire](../memoire/index.md) sont intimement liées et que des concepts complémentaires sont présents dans les langages de plus bas niveau (notion de **pointeur** en C, de **référence** en C++, de **propriété des variables** en Rust,...).
* Les **langages de plus haut niveau** épargnent ces subtilités aux développeurs en considérant que **tout est référence** avec des mécanismes de **gestion automatique de la mémoire** qu'il est intéressant de connaître (c.f. [ramasse-miettes](../memoire/ramasse-miettes.md)).
* La notion de [variable immuable](../memoire/variable-immuable.md) est présente avec certains langages pour caractériser des variables qui ne peuvent être modifiées après assignation.

## Le nom

Le nom des variables sera plus ou moins libre en fonction du langage utilisé. On notera que les règles suivantes s'appliquent dans de nombreux langages en raison de contraintes techniques :

* Le nom ne devra pas commencer par un chiffre (ex : `1a`)
* Le nom devra contenir uniquement des lettres non accentuées (`[a-zA-Z]`), des chiffres (`[0-9]`) et des *underscores* (`_`). Le tiret (`-`) est interdit car il serait interprété comme l'opérateur de soustraction (`my-value` vaut `my - value`)

On soulignera que de nombreux langages disposent d'une [convention de nommage](../bonnes-pratiques/conventions.md) ajoutant des règles complémentaires.

## Le type

Selon le langage, le **type** est porté par la variable (typage statique) ou par la valeur qu'elle contient (typage dynamique) : voir [Les types](types.md).

## La portée des variables

Une variable aura une **portée**, c'est-à-dire qu'elle sera accessible dans tout ou partie du programme :

* Une **variable globale** sera accessible dans tout le programme.
* Une **variable locale** sera accessible dans un [bloc d'instruction](instruction-bloc.md).

On soulignera que :

* Le concept de portée permet d'avoir **plusieurs variables de même nom** dans le code d'un programme.
* La gestion de la portée est **spécifique à chaque langage de programmation**.
* Il est important de bien **maîtriser la portée des variables** pour éviter des bugs liés à la lecture ou la modification de la mauvaise variable.
