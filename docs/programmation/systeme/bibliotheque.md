# Les bibliothèques

Le concept de **bibliothèque** donne un cadre pour la mise à disposition de fonctionnalités réutilisables dans plusieurs programmes (fonctions, structures,...).

## Les bibliothèques standards

Les langages s'accompagnent d'une **bibliothèque standard** offrant des fonctionnalités génériques (fonctions mathématiques, structures de données, algorithmes...).

## Les bibliothèques systèmes

L'OS vient avec un ensemble de **bibliothèques systèmes** qui font abstraction du le pilotage du matériel :

* Manipulation de la mémoire vive (`malloc`,`free`,...)
* Manipulation des fichiers (`FILE`, `fopen`, `fclose`,...)
* Communications réseaux (`socket`)
* ...

Ces bibliothèques sont généralement :

* Mises à disposition au niveau de l'OS sous forme de bibliothèque en langage C.
* Rendues disponibles dans les autres langages via des mécanismes d'[interfaçage entre les langages de programmation](interfacage.md).
