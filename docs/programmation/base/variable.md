# Les variables

!!! warning "En construction"

    Notes personnelles à relire et compléter pour servir de support pour les cours.

Une variable permet de **nommer une valeur** manipulée par le programme. Nous retrouverons les notions suivantes pour les variables dans la plupart des langages :

* Un **nom**
* Un **type**
* Une **portée**

En complément, il conviendra de noter que :

* [Les variables et la mémoire](../memoire/index.md) sont intimement liées et que des concepts complémentaires sont présents dans les langages de plus bas niveau (notion de **pointeur** en C, de **référence** en C++, de **propriété des variables** en Rust,...).
* Les **langages de plus haut niveau** épargnent ces subtilités aux développeurs en considérant que **tout est référence** avec des mécanismes de **gestion automatique de la mémoire** qu'il est intéressant de connaître (c.f. [ramasse-miettes](../memoire/ramasse-miettes.md)).
* La notion de [variable immuable](../memoire/variable-immuable.md) est présente avec certains langages pour caractériser des variables qui ne peuvent être modifiées après assignation.

## Le nom

Le nom des variables sera plus ou moins libre en fonction du langage utilisé. On notera que les règles suivantes s'appliquent dans de nombreux langages en raison de contraintes techniques :

* Le nom ne devra pas commencer par un chiffre (ex : `1a`)
* Le nom devra contenir uniquement des lettres non accentuées (`[a-zA-Z]`), des chiffres (`[0-9]`) et des *underscores* (`_`). Le tiret (`-`) est interdit car il serait interprété comme l'opérateur de soustraction (`my-value` vaut `my - value`)

On soulignera que de nombreux langages disposent d'une [convention de nommage](conventions.md) ajoutant des règles complémentaires.

## Le type

Quel que soit le langage de programmation utilisé, une valeur aura toujours un **type**. Il permettra par exemple d'avoir comme résultat :

* `5` pour l'addition de deux nombres `2` et `3`
* `"23"` pour la concaténation de deux chaînes de caractères `"2"` et `"3"`

En fonction du langage :

* Avec un **typage statique**, le type des variables est connu et vérifié à la compilation (il est déclaré ou déduit par inférence).
* Avec un **typage dynamique**, le type est porté par la valeur et vérifié à l'exécution (une même variable peut successivement contenir des valeurs de types différents).

Ces notions ne doivent pas être confondues avec le **typage fort** et le **typage faible** qui caractérisent la tolérance du langage aux **conversions implicites** (ex : `"2" + 3` vaut `"23"` en JavaScript, typage dynamique et faible, alors que Python lève une `TypeError`, typage dynamique et fort).

Voir [Les spécificités des langages - Typage statique ou typage dynamique](../../architecture/patrons-conception/specificites-langages/index.md#typage-statique-ou-typage-dynamique) pour l'impact sur la conception.

## La portée des variables

Une variable aura une **portée**, c'est-à-dire qu'elle sera accessible dans tout ou partie du programme :

* Une **variable globale** sera accessible dans tout le programme.
* Une **variable locale** sera accessible dans un [bloc d'instruction](instruction-bloc.md).

On soulignera que :

* Le concept de portée permet d'avoir **plusieurs variables de même nom** dans le code d'un programme.
* La gestion de la portée est **spécifique à chaque langage de programmation**.
* Il est important de bien **maîtriser la portée des variables** pour éviter des bugs liés à la lecture ou la modification de la mauvaise variable.
