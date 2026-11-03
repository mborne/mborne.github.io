# La programmation générique

> 🤖 Rédaction assistée par IA.

## Définition

La programmation générique se reconnaît à l'utilisation d'un **paramètre de type** faisant **abstraction sur le type d'un paramètre ou d'une variable membre** (ex : `List<User>` en Java, `Array<number>` en TypeScript). Elle permet d'écrire **une seule fois** du code (fonctions, classes, structures) **valable pour plusieurs types**.

## Les approches

Il existe deux approches radicalement différentes en fonction des langages :

* [La programmation générique par génération de code](generation-de-code.md) (C++, Rust) : le compilateur **génère une version du code pour chaque type** utilisé.
* [La programmation générique par restriction de type](restriction-de-type.md) (Java, TypeScript, Python, PHP avec des annotations) : un même code est utilisé pour tous les types, les paramètres de type permettant de **vérifier les types avant l'exécution** (compilation ou analyse statique)[^csharp].

Nous noterons que la programmation générique est à la base des **conteneurs** fournis par les langages (voir [Les structures de données](../structures-de-donnees/index.md)) et de types tels `Result<T, E>` et `Option<T>` (voir [La gestion des erreurs](../erreurs/index.md)).

## Liens utiles

* [fr.wikipedia.org - Programmation générique](https://fr.wikipedia.org/wiki/Programmation_g%C3%A9n%C3%A9rique)

[^csharp]: C# occupe une position intermédiaire : comme en Java, un même code est partagé, mais les paramètres de type sont **conservés à l'exécution** (ex : `typeof(T)`).
