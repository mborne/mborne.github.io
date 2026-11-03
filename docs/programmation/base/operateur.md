# Les opérateurs

!!! warning "En construction"

    Notes personnelles à relire et compléter pour servir de support pour les cours.

Un opérateur permet de **réaliser une opération à l'aide d'un symbole**.

Les langages mettent à disposition plusieurs types d'opérateurs :

* [L'opérateur d'affectation](#loperateur-daffectation)
* [Les opérateurs arithmétiques](#les-operateurs-arithmetiques)
* [Les opérateurs booléens](#les-operateurs-booleens)
* [Les opérateurs de comparaison](#les-operateurs-de-comparaison)
* [Les opérateurs de manipulation des bits](#les-operateurs-de-manipulation-des-bits)

Ces opérateurs permettent de former des [expressions](expression.md).

## L'opérateur d'affectation

Il permet d'assigner une valeur à une variable (`a = 3` ou `a = b`).

## Les opérateurs arithmétiques

* L'addition (`a+b`)
* La soustraction (`a-b`)
* Le moins unaire (`-a`)
* La multiplication (`a*b`)
* La division (`a/b`)
* Le modulo (`a%b`)
* La puissance (`a**b`) qui n'est pas toujours disponible
* Les opérateurs d'incrémentation et décrémentation post-fixés (`a++`,`a--`) et pré-fixés (`++a` et `--a`)

## Les opérateurs booléens

* ET (`a && b`)
* OU (`a || b`)
* NON (`!a`)

## Les opérateurs de comparaison

* Strictement inférieur (`a < b`)
* Strictement supérieur (`a > b`)
* Inférieur ou égal (`a <= b`)
* Supérieur ou égal (`a >= b`)
* Égal (`a == b`)
* Différent (`a != b`)

## Les opérateurs de manipulation des bits

* ET bit à bit (`a & b`)
* OU bit à bit (`a | b`)
* OU exclusif bit à bit (`a ^ b`)
* Décalage à droite (`a >> 1`)
* Décalage à gauche (`a << 1`)
* Complément à un (`~a`)
