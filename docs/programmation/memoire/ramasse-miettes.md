# Le ramasse-miettes (garbage collector)

!!! warning "En construction"

    Notes personnelles à relire et compléter pour servir de support pour les cours.

Le ramasse-miettes se charge de libérer la mémoire lorsqu'une variable n'est plus utilisée.

## Points clés

* La méthode la plus simple s'appuie sur le **comptage de références**.
* Le comptage de références ne permet pas d'identifier les cycles (voir cas du [Ramasse-miettes PHP](https://www.php.net/manual/fr/features.gc.php) où `gc_collect_cycles()` doit être explicitement invoquée)
* L'implémentation d'un ramasse-miettes traitant de manière transparente le problème des cycles sans bloquer l'exécution est loin d'être triviale (c.f. [jmdoudoux.developpez.com - Java - La gestion de la mémoire](https://jmdoudoux.developpez.com/cours/developpons/java/chap-gestion_memoire.php#gestion_memoire-1))

## Alternative

En **C++ moderne**, les **pointeurs intelligents** permettent d'amener une gestion automatique de la mémoire avec un traitement au cas par cas et une surcouche minimale :

* [std::unique_ptr](https://en.cppreference.com/w/cpp/memory/unique_ptr) : Libération automatique en cas de propriétaire unique.
* [std::shared_ptr](https://en.cppreference.com/w/cpp/memory/shared_ptr) : Libération automatique par comptage de références en cas de propriétaires multiples.

**Rust** va un cran plus loin avec un compilateur qui s'assure qu'il y a un **unique propriétaire de la variable**.
