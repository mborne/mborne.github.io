# La programmation générique par génération de code

> 🤖 Rédaction assistée par IA.

## Définition

Dans des langages tels C++ et Rust, la programmation générique permet d'**éviter de répéter des codes identiques pour des types différents** : le compilateur **génère une version du code pour chaque type** effectivement utilisé (on parle de **monomorphisation**).

## En pratique

### Avec les fonctions

Il est par exemple possible de définir un *template* pour le calcul du carré d'un nombre :

```cpp
template <typename T>
T square(const T v) {
    return v * v;
}
```

Si cette fonction est appelée dans le programme pour un `int` et pour un `double` (ex : `square(3)` et `square(1.5)`), le compilateur se charge de générer le code correspondant et nous évite une duplication de code :

```cpp
int square(const int v) {
    return v * v;
}

double square(const double v) {
    return v * v;
}
```

Ces deux fonctions se retrouvent effectivement dans le programme compilé (ex : `nm -C` affiche `int square<int>(int)` et `double square<double>(double)`).

### Avec les structures et les classes

Le principe de génération de code qui s'applique pour les fonctions s'applique aussi pour les structures et les classes.

À titre d'exemple, pour une structure définissant un intervalle mathématique comme suit :

```cpp
template <typename T>
struct Interval {
    T lower;
    T upper;
};
```

...la déclaration d'un `Interval<double>` et d'un `Interval<float>` générera le code correspondant respectivement pour `double` et `float`.

### Contraintes sur les types

Un paramètre de type pourra être **contraint** pour exiger certaines opérations (ex : la comparaison) :

=== "C++"

    ```cpp
    // C++ >= 20 : concept de la bibliothèque standard
    template <std::totally_ordered T>
    const T& largest(const T& a, const T& b) {
        return a < b ? b : a;
    }
    ```

=== "Rust"

    ```rust
    // trait de la bibliothèque standard
    fn largest<T: PartialOrd>(a: T, b: T) -> T {
        if a < b { b } else { a }
    }
    ```

En Rust, les contraintes (**traits**) sont **obligatoires** : le code générique ne peut utiliser que les opérations déclarées par les traits. En C++, les **concepts** (C++ >= 20) sont **optionnels** : sans eux, les erreurs ne sont détectées qu'à l'**instanciation** du *template*, avec des messages souvent difficiles à lire.

### Cas du C++

En C++, la programmation générique est la base de la bibliothèque standard *STL (Standard Template Library)* pour fournir des éléments réutilisables :

* [Les conteneurs génériques (vector, list, map...)](https://www.cplusplus.com/reference/stl/)
* [Les pointeurs intelligents (unique_ptr, shared_ptr,...)](https://www.cplusplus.com/reference/memory/)
* [Les algorithmes génériques](https://www.cplusplus.com/reference/algorithm/)

Des bibliothèques telles [Boost](https://www.boost.org/doc/libs/1_79_0/) embrassent aussi ce paradigme.

Pour aller plus loin, il est intéressant de consulter :

* [cpp.developpez.com - Cours de C/C++ - Les templates](https://cpp.developpez.com/cours/cpp/?page=page_14) qui aborde entre autres la **spécialisation des templates** (i.e. comment faire varier l'implémentation en fonction du type)
* [alp.developpez.com - Présentation des classes de Traits et de Politiques en C++](https://alp.developpez.com/tutoriels/traitspolicies/) où la spécialisation des templates est utilisée pour enrichir les informations sur les types (**classe de Traits**) et pour définir des opérations spécifiques à certains types (**classe de Politiques**)
* [www.internalpointers.com - A quick primer on type traits in modern C++](https://www.internalpointers.com/post/quick-primer-type-traits-modern-cpp) qui présente **les classes de Traits standards** (`<type_traits>`) et l'articulation avec les mots clés `static_assert` (clarification des erreurs de compilation) et `if constexpr` (variation des implémentations).
* [en.cppreference.com - Constraints and concepts](https://en.cppreference.com/w/cpp/language/constraints)

### Cas de Rust

Rust reprend les principes du C++ pour la généricité dans les fonctions et les structures :

* [Rust - Generic Data Types - In Function Definitions](https://doc.rust-lang.org/book/ch10-01-syntax.html#in-function-definitions)
* [Rust - Generic Data Types - In Struct Definitions](https://doc.rust-lang.org/book/ch10-01-syntax.html#in-struct-definitions)
* [Rust - Traits: Defining Shared Behavior](https://doc.rust-lang.org/book/ch10-02-traits.html)

## Mises en garde

* Cette approche offre une **généricité au niveau de la compilation**. En fonction des besoins, **il sera parfois préférable de travailler plutôt sur la généricité à l'exécution** avec d'autres mécanismes (héritage et `virtual`, voir [L'héritage et le polymorphisme](../poo/polymorphisme.md)).
* La génération d'une version par type **augmente la taille du programme compilé** et le **temps de compilation**.
* En C++, le code des *templates* doit être **visible là où il est utilisé** : il est généralement placé dans les fichiers d'en-tête (`.h` / `.hpp`).

## Liens utiles

* [fr.wikipedia.org - Programmation générique](https://fr.wikipedia.org/wiki/Programmation_g%C3%A9n%C3%A9rique)
