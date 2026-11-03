# Les boucles

!!! warning "En construction"

    Notes personnelles à relire et compléter pour servir de support pour les cours.

Une boucle permet de répéter l'exécution d'un [bloc d'instructions](bloc-instruction.md).

## Les boucles classiques

En fonction des langages, nous trouverons différents types de boucles. Par exemple :

* La **boucle for** :

```js
for ( /* initialisation */ ; /* condition */ ; /* incrémentation */ ){
    // bloc d'instruction répété
}
```

* La **boucle while** :

```js
while ( /* condition */ ){
    // bloc d'instruction répété
}
```

* La **boucle do/while** :

```js
do {
    // bloc d'instruction répété
} while ( /* condition */ );
```

## Les boucles ensemblistes

Nous pourrons aussi trouver des boucles permettant d'**itérer sur les éléments d'un ensemble** avec des variantes en fonction des langages :

* [for/of](https://www.w3schools.com/js/js_loop_forof.asp) et [for/in](https://www.w3schools.com/js/js_loop_forin.asp) en JavaScript
* [for user in users:](https://www.w3schools.com/python/python_for_loops.asp) avec Python
* [for ( User user : users){...}](https://www.w3schools.com/java/java_foreach_loop.asp) en Java
* [foreach](https://www.w3schools.com/php/php_looping_foreach.asp) en PHP
* ...

## La parallélisation de l'exécution

En fonction des langages, nous trouvons différentes stratégies pour paralléliser l'exécution de certaines boucles.

Par exemple, OpenMP apporte une instruction `omp parallel for` qui répartit les itérations sur plusieurs **threads** (voir [Système et interfaçage](../systeme/index.md)).
