# Les conventions de nommage et de codage

!!! warning "En construction"

    Notes personnelles à relire et compléter pour servir de support pour les cours.

## Convention de nommage

Une **convention de nommage** fixe des règles de nommage des concepts qui améliorent la lisibilité des programmes. Par exemple :

* L'utilisation de **CamelCase** ou de **underscore_case** pour le nommage des variables (`myValue` ou `my_value`), fonctions/méthodes (`doSomething()` ou `do_something()`) et types/classes (`MonType` ou `mon_type`).
* L'utilisation de **UNDERSCORE_CASE** en majuscule pour le nommage des constantes (`PI`,`HTTP_SUCCESS`,...)
* La réservation de la première lettre en majuscule pour la définition des types (ex : `Point`)

## Convention de codage

Une **convention de codage** fixe les règles de mise en forme du code. Par exemple :

* L'utilisation de tabulations ou d'espaces pour l'indentation
* Le nombre d'espaces utilisés le cas échéant
* Les règles de mise en forme des accolades
* ...

## Avantages

L'utilisation de conventions **améliore la lisibilité du code**, **facilite la maintenance corrective** (calcul de différence entre les différentes versions du programme) et **évite des questionnements inutiles sur le nommage**.

## Inconvénients

La présence d'une convention ajoute une contrainte sur le développement. Cette contrainte est toutefois relativement indolore dans la mesure où il existe des outils permettant :

* De contrôler le respect des conventions de nommage
* De mettre en forme automatiquement le code pour respecter les conventions de codage.
