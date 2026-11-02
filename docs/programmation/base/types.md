# Les types

!!! warning "En construction"

    Notes personnelles à relire et compléter pour servir de support pour les cours.

Quel que soit le langage de programmation utilisé, une valeur aura toujours un **type**. Il permettra par exemple d'avoir comme résultat :

* `5` pour l'addition de deux nombres `2` et `3`
* `"23"` pour la concaténation de deux chaînes de caractères `"2"` et `"3"`

En fonction du langage :

* Avec un **typage statique**, le type des variables est connu et vérifié à la compilation (il est déclaré ou déduit par inférence).
* Avec un **typage dynamique**, le type est porté par la valeur et vérifié à l'exécution (une même variable peut successivement contenir des valeurs de types différents).

Ces notions ne doivent pas être confondues avec le **typage fort** et le **typage faible** qui caractérisent la tolérance du langage aux **conversions implicites** (ex : `"2" + 3` vaut `"23"` en JavaScript, typage dynamique et faible, alors que Python lève une `TypeError`, typage dynamique et fort).

Voir [Les spécificités des langages - Typage statique ou typage dynamique](../../architecture/patrons-conception/specificites-langages/index.md#typage-statique-ou-typage-dynamique) pour l'impact sur la conception.

## Les types définis par l'utilisateur

À compléter :

* Les structures (agrégats de variables, ex : `struct Coordinate { x: double, y: double }`, sans les méthodes et l'encapsulation de la [POO](../poo/index.md))
* Les énumérations (dont les énumérations portant des valeurs, ex : `enum` en Rust, qui permettent de construire les types `Result` et `Option` de [la gestion des erreurs](../erreurs/index.md))
* Les alias de type

## Les tableaux

À compléter (voir [fr.wikipedia.org - Tableau (structure de données)](https://fr.wikipedia.org/wiki/Tableau_(structure_de_donn%C3%A9es)) et [Les structures de données](../structures-de-donnees/index.md)).
