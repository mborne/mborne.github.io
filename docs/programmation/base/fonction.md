# Les fonctions

!!! warning "En construction"

    Notes personnelles à relire et compléter pour servir de support pour les cours.

Les fonctions apparaissent dès l'assembleur pour **nommer et réutiliser des [blocs d'instructions](instruction-bloc.md)**. Dans les langages de plus haut niveau, les fonctions font **abstraction sur le passage des paramètres** et sont plus proches de leurs équivalents en mathématiques. Elles sont définies par :

* Un **nom**
* Une liste de **paramètres formels**
* La possibilité de renvoyer une **valeur de retour**
* Un [bloc d'instructions](instruction-bloc.md) formant le **corps** de la fonction

## En pratique

* La syntaxe pour la déclaration et l'appel d'une fonction varie en fonction du langage.
* Le mot clé `return` est généralement utilisé pour renvoyer le résultat.
* Un type dédié est souvent utilisé pour matérialiser l'absence de valeur de retour (`void`)
* Certains langages (Fortran, PLPGSQL...) font la distinction entre une **function** (renvoyant une valeur de retour) et une **procedure** (ne renvoyant pas de valeur de retour)

## Récursivité

Une fonction qui s'appelle elle-même est dite récursive. Un exemple classique est la fonction `factorielle(n)` qui renvoie `1 * 2 * ... * n` :

```js
function factorielle(n){
    return n > 1 ? n * factorielle(n - 1) : 1 ;
}
```

## La pile d'appel

L'exécution des fonctions s'appuie généralement sur une pile d'appel (*callstack*). Le passage de paramètres aux fonctions et la récupération du résultat requiert la définition d'une [convention d'appel](https://h-deb.clg.qc.ca/Sujets/AuSecours/Conventions-appel.html) de la fonction.

## Signature de fonction

Dans les **langages typés** s'appuyant sur un mécanisme de **signature de fonction** (C++, Java,...), il est possible d'avoir plusieurs fonctions de même nom avec des paramètres de types différents (**surcharge**). Voir [La décoration des noms](../systeme/decoration-noms.md) pour la mise en œuvre par le compilateur.
