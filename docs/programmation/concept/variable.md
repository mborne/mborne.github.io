# Les variables

Une variable permet de **nommer une valeur** manipulée par le programme. Nous retrouverons les notions suivantes pour les variables dans la plupart des langages :

* Un **nom**
* Un **type**
* Une **portée**

En complément, il conviendra de noter que :

* [Les variables et la mémoire](variable-memoire.md) sont intiment liées et que des concepts complémentaires sont présents dans les langages de plus bas niveau (notion de **pointeur** en C, de **référence** en C++, de **propriété des variables** en Rust,...).
* Les **langages de plus haut niveau** épargnent ces subtilités aux développeurs en considérant que **tout est référence** avec des mécanismes de **gestion automatique de la mémoire** qu'il est intéressant de connaître (c.f. [ramasse-miette](gc.md)).
* La notion de [variable immuable](variable-immuable.md) est présente avec certains langages pour caractériser des variables qui ne peuvent être modifiées après assignation.

## Le nom

Le nom des variables sera plus ou moins libre en fonction du langage utilisé. On notera que les règles suivantes s'appliquent dans le nombreux langages en raison de contraintes techniques :

* Le nom ne devra pas commencer par un chiffre (ex : `1a`)
* Le nom devra contenir uniquement des lettres non accentués (`[a-zA-Z]`), des chiffres (`[0-9]`), des tirets (`-`) et des *underscores* (`_`)

On soulignera que de nombreux langages disposent d'une [convention des nommages](conventions.md) ajoutant des règles complémentaires.

## Le type

Quelque soit le langage de programmation utilisé, une variable aura toujours un **type**. Il permettra par exemple d'avoir comme résultat :

* `5` pour l'addition de deux nombres `2` et `3`
* `"23"` pour l'addition de deux chaînes de caractères `"2"` et `"3"`

En fonction du langage, ce type devra ou non être spécifié :

* Le langage est dit à **typage statique** (ou **typage fort**) si le type est déclaré lors de la définition de la variable.
* Un langage est dit à **typage dynamique**  (ou **typage faible**) si le type est connu après affectation d'une valeur à la variable (il peut changer pendant l'exécution du programme)

## La portée des variables

Une variable aura une **portée**, c'est à dire qu'elle sera accessible dans tout ou partie du programme :

* Une **variable globale** sera accessible dans tout le programme.
* Une **variable locale** sera accessible dans un [bloc d'instruction](instruction-bloc.md).

On soulignera que :

* Le concept de portée permet d'avoir **plusieurs variables de même nom** dans le code d'un programme.
* La gestion de la portée est **spécifique à chaque langage de programmation**.
* Il est important de bien **maîtriser la portée des variables** pour éviter des bugs liés à la lecture ou la modification de la mauvaise variable.
