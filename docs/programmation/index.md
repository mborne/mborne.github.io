# La programmation

## Les concepts de base

* [Les instructions](base/instruction.md)
* [Les blocs d'instructions](base/instruction-bloc.md)
* [Les variables](base/variable.md)
* [Les fonctions](base/fonction.md)
* [Les opérateurs](base/operateur.md)
* [Les expressions](base/expression.md)
* [Les boucles](base/boucles.md)
* [Les conditions](https://fr.wikipedia.org/wiki/Instruction_conditionnelle_(programmation))
* [Les tableaux](https://fr.wikipedia.org/wiki/Tableau_(structure_de_donn%C3%A9es))
* Les structures (agrégats de variables)
* Les énumérations

## Les concepts de la POO

### Les fondamentaux

* Les **classes** avec leurs **attributs** et leurs **méthodes**
* Les **constructeurs**
* Les **objets**
* La **visibilité** (public, private, protected) et les **accesseurs** (get, set, add, remove,...) : voir [L'encapsulation](poo/encapsulation.md)
* Les **relations** (composition, agrégation)
* L'**héritage** et le **polymorphisme**
* Les **méthodes et classes abstraites**
* Les **interfaces**
* Les **méthodes statiques**
* Les **attributs statiques**

### Quelques concepts avancés

* Les **exceptions** (gestion des erreurs).
* La **sérialisation** (transformation d'un objet dans un format texte ou binaire).
* Les **objets immuables** (non modifiables après la construction).
* Les [propriétés](https://learn.microsoft.com/fr-fr/dotnet/csharp/programming-guide/classes-and-structs/properties) (qui masquent l'appel aux accesseurs)
* Les **foncteurs** ou [objet de fonction](https://learn.microsoft.com/fr-fr/cpp/standard-library/function-objects-in-the-stl?view=msvc-170).
* Les **méthodes magiques**

## Les concepts de base de la programmation fonctionnelle

* [Les collections](fonctionnelle/collections.md)
* Les **générateurs** (ou [coroutine](https://fr.wikipedia.org/wiki/Coroutine))
* Les **fonctions anonymes** (lambda)
* La fonction **filter**
* La fonction **map**
* La fonction **reduce**

## Les concepts de la programmation générique

La programmation générique se reconnaît à l'utilisation d'un **paramètre de type** faisant **abstraction sur le type d'un paramètre ou d'une variable membre** (ex : `Array<number>`). Il existe toutefois deux approches radicalement différentes en fonction des langages :

* [La programmation générique par génération de code](generique/generation-de-code.md) (C++, Rust)
* [La programmation générique par restriction de type](generique/restriction-de-type.md) (TypeScript, Java, PHP,...)

## Les concepts des systèmes d'exploitation

Le système d'exploitation (OS) assume plusieurs rôles. Il offre des éléments qui se retrouvent dans de nombreux langages de programmation :

* Un cadre pour la **construction d'application** :
    * [Les bibliothèques](systeme/bibliotheque.md)
    * Les **programmes** qui peuvent être vus comme des bibliothèques offrant un point d'entrée (la fameuse fonction `main`) pour le démarrage d'un processus.
    * Les **services** qui peuvent être vus comme des **programmes s'exécutant en tâche de fond**.
* Un cadre pour l'**exécution des applications** :
    * Les **processus** qui permettent l'exécution en parallèle de plusieurs programmes sur une même machine.
    * Les **threads** qui permettent plusieurs exécutions en parallèle au sein d'un même processus.
* Un cadre pour la **communication avec le matériel** :
    * Les **bibliothèques systèmes**
    * Les pilotes matériels
* Un cadre pour la **communication entre les applications** :
    * Les **fichiers**
    * Les **pipes**
    * Les **sockets**
* Un cadre pour la **gestion des droits**

## Ressources

Les sites suivants permettent de s'exercer à la programmation :

* [www.codewars.com](https://www.codewars.com/)
* [www.codingame.com](https://www.codingame.com/start/fr/)
* [leekwars.com](https://leekwars.com/)
