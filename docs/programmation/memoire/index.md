# Les variables et la mémoire

En pratique, on soulignera que l'utilisation de variables induit l'utilisation d'une mémoire.

## La mémoire de l'OS

Dans les langages de bas niveau, la gestion de la mémoire s'appuiera sur les mécanismes offerts par le système d'exploitation et il faudra considérer :

* La **pile** qui sera utilisée pour les variables locales (de taille raisonnable) et libérée automatiquement à la sortie des fonctions et des blocs d'instructions.
* Le **tas** qui sera utilisé pour allouer dynamiquement de la mémoire et des variables ayant une durée de vie dépassant l'exécution d'une fonction ou d'un bloc d'instructions.

Nous serons ainsi amenés à manipuler des **concepts complémentaires pour les variables avec les langages de bas niveau** :

* [Les pointeurs et références en C++](https://cpp.developpez.com/cours/cpp/?page=page_6)
* [ownership, reference et borrowing](https://doc.rust-lang.org/book/ch04-00-understanding-ownership.html) et [lifetimes](https://doc.rust-lang.org/book/ch10-03-lifetime-syntax.html?highlight=lifetime#validating-references-with-lifetimes) en Rust.

## La mémoire managée

Pour les **langages de haut niveau**, l'exécution s'appuie généralement sur un interpréteur qui prend en charge l'allocation et la libération de la mémoire à l'aide d'un [ramasse-miette (garbage collector)](ramasse-miettes.md).

Il ne sera donc pas nécessaire de se préoccuper de la nature de la variable dans le programme. Nous dirons que "**tout est référence**".

## Pour aller plus loin

* [Le ramasse-miettes (garbage collector)](ramasse-miettes.md)
* [Les variables immuables](variable-immuable.md)
