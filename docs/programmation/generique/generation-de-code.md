# La programmation générique par génération de code

!!! warning "En construction"

    Notes personnelles à relire et compléter pour servir de support pour les cours.

Dans des langages tels C++ et Rust, la programmation générique permet d'éviter de répéter des codes identiques pour des types différents.

## Principe de fonctionnement avec les fonctions

Il est par exemple possible de définir une template pour le calcul du carré d'un nombre :

```cxx
template < typename T >
T square(const T v){
    return v * v;
}
```

Si cette fonction est appelée dans le programme pour un `int` et pour un `double`, le compilateur se charge de générer le code correspondant et nous évite une duplication de code :

```cxx
int square(const int v){
    return v * v;
}

double square(const double v){
    return v * v;
}
```

## Principe de fonctionnement avec les structures et classes

Le principe de génération de code qui s'applique pour les fonctions s'applique aussi pour les structures et les classes.

À titre d'exemple, pour une structure définissant un intervalle mathématique comme suit :

```cxx
template < typename T >
struct Interval {
    T lower;
    T upper;
};
```

...la déclaration d'un `Interval<double>` et d'un `Interval<float>` générera le code correspondant respectivement pour `double` et `float`.

## En pratique

### Cas du C++

En C++, la programmation générique est la base de la bibliothèque standard *STL (Standard Template Library)* pour fournir des éléments réutilisables :

* [Les conteneurs génériques (vector, list, map...)](https://www.cplusplus.com/reference/stl/)
* [Les pointeurs intelligents (unique_ptr, shared_ptr,...)](https://www.cplusplus.com/reference/memory/)
* [Les algorithmes génériques](https://www.cplusplus.com/reference/algorithm/)

Des bibliothèques telles [Boost](https://www.boost.org/doc/libs/1_79_0/) embrassent aussi ce paradigme.

Il convient d'être conscient que cette approche offre une **généricité au niveau de la compilation** et qu'en fonction des besoins, **il sera parfois préférable de travailler plutôt sur la généricité à l'exécution** avec d'autres mécanismes (héritage et `virtual`).

Pour aller plus loin, il est intéressant de consulter :

* [cpp.developpez.com - Cours de C/C++ - Les templates](https://cpp.developpez.com/cours/cpp/?page=page_14) qui aborde entre autre la **spécialisation des templates** (i.e. comment faire varier l'implémentation en fonction du type)
* [alp.developpez.com - Présentation des classes de Traits et de Politiques en C++](https://alp.developpez.com/tutoriels/traitspolicies/) où la spécialisation des templates est utilisée pour enrichir les informations sur les types (**classe de Traits**) et pour définir des opérations spécifiques à certains types (**classe de Politiques**)
* [www.internalpointers.com - A quick primer on type traits in modern C++](https://www.internalpointers.com/post/quick-primer-type-traits-modern-cpp) qui présente **les classes de Traits standards** (`<type_traits>`) et l'articulation avec les mots clés `static_assert` (clarification des erreurs de compilation) et `if constexpr` (variation des implémentations).

### Cas de Rust

On soulignera que Rust reprend les principes du C++ pour la généricité dans les fonctions et les structures :

* [Rust - Generic Data Types - In Function Definitions](https://doc.rust-lang.org/book/ch10-01-syntax.html#in-function-definitions)
* [Rust - Generic Data Types - In Struct Definitions](https://doc.rust-lang.org/book/ch10-01-syntax.html#in-struct-definitions)

La principale différence entre C++ et Rust réside dans le fait que les **traits** sont sanctuarisés sous forme d'un concept du langage :

* [Rust - Traits: Defining Shared Behavior](https://doc.rust-lang.org/book/ch10-02-traits.html)
