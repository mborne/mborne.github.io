# Le ramasse-miettes (garbage collector)

> 🤖 Rédaction assistée par IA.

## Définition

Le **ramasse-miettes** (*garbage collector*) libère automatiquement la mémoire occupée par les **objets qui ne sont plus atteignables** depuis les variables du programme (variables locales, globales...).

Il décharge le développeur de la libération manuelle de la mémoire (ex : `free` en C, `delete` en C++).

## En pratique

### Le comptage de références

Chaque objet mémorise le **nombre de références** qui pointent vers lui et il est libéré dès que ce nombre tombe à zéro (ex : CPython, PHP, Swift).

Ce mécanisme ne libère pas les **références circulaires**. CPython et PHP le complètent par un **collecteur de cycles** qui se déclenche automatiquement (`gc.collect()` en Python et [`gc_collect_cycles()`](https://www.php.net/manual/fr/features.gc.collecting-cycles.php) en PHP permettent de le forcer) :

```python
import gc

a = {}
b = {"other": a}
a["other"] = b  # cycle a -> b -> a
del a, b  # les compteurs ne tombent pas à zéro : rien n'est libéré
gc.collect()  # le collecteur de cycles libère a et b
```

### Le traçage

Le ramasse-miettes parcourt périodiquement les objets **atteignables** à partir des variables du programme et libère les autres (algorithme *mark and sweep*). Les cycles sont alors traités naturellement (ex : Java, JavaScript, C#, Go).

### Les alternatives au ramasse-miettes

* La **libération manuelle** (`malloc` / `free` en C, `new` / `delete` en C++), source de **fuites mémoire** et de **libérations multiples**.
* Les **pointeurs intelligents** en C++ moderne :
    * [std::unique_ptr](https://en.cppreference.com/w/cpp/memory/unique_ptr) : propriétaire unique, libération à la sortie de la portée ([RAII](https://fr.wikipedia.org/wiki/Resource_acquisition_is_initialization))
    * [std::shared_ptr](https://en.cppreference.com/w/cpp/memory/shared_ptr) : comptage de références en cas de propriétaires multiples, avec [std::weak_ptr](https://en.cppreference.com/w/cpp/memory/weak_ptr) pour casser les cycles
* La **propriété** (*ownership*) en Rust : chaque valeur a un **propriétaire unique** et est libérée quand celui-ci sort de la portée, ce que le compilateur vérifie (`Rc` / `Weak` pour les propriétaires multiples).

## Mises en garde

* Le ramasse-miettes peut **interrompre l'exécution** (pauses) : les implémentations modernes (générationnelles, concurrentes) limitent ce problème sans le supprimer (c.f. [jmdoudoux.developpez.com - Java - La gestion de la mémoire](https://jmdoudoux.developpez.com/cours/developpons/java/chap-gestion_memoire.php#gestion_memoire-1)).
* Le **moment de la libération n'est pas garanti** : il ne faut pas compter sur lui pour fermer un fichier ou une connexion (voir la libération des ressources dans [La gestion des erreurs](../erreurs/index.md)).

## Liens utiles

* [fr.wikipedia.org - Ramasse-miettes (informatique)](https://fr.wikipedia.org/wiki/Ramasse-miettes_(informatique))
* [developer.mozilla.org - Gestion de la mémoire](https://developer.mozilla.org/fr/docs/Web/JavaScript/Memory_management)
* [docs.python.org - gc](https://docs.python.org/3/library/gc.html)
* [www.php.net - Collecter les cycles](https://www.php.net/manual/fr/features.gc.collecting-cycles.php)
* [doc.rust-lang.org - What is Ownership?](https://doc.rust-lang.org/book/ch04-01-what-is-ownership.html)
