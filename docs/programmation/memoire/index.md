# Les variables et la mémoire

> 🤖 Rédaction assistée par IA.

## Définition

Les valeurs manipulées par un programme sont stockées en **mémoire vive**. La **gestion de la mémoire** consiste à **allouer** la mémoire nécessaire à ces valeurs et à la **libérer** lorsqu'elles ne sont plus utiles.

## En pratique

### La pile et le tas

Nous distinguerons deux zones mémoire :

* La **pile** (*stack*) utilisée pour les variables locales (de taille raisonnable) et libérée automatiquement à la sortie des fonctions et des blocs d'instructions.
* Le **tas** (*heap*) utilisé pour allouer dynamiquement de la mémoire pour des valeurs ayant une durée de vie dépassant l'exécution d'une fonction ou d'un bloc d'instructions.

Dans les langages de bas niveau (C, C++, Rust), le développeur choisit où sont stockées les valeurs. Dans les langages de haut niveau, ce choix est fait par le langage (ex : les objets sont alloués sur le tas en Java et en JavaScript).

### Pointeurs, références et propriété

Les langages de bas niveau exposent des concepts complémentaires :

* Les **pointeurs** (adresse d'une valeur, ex : `int* p = &a;` en C et C++) et les **références** (alias d'une variable, ex : `int& r = a;` en C++), voir [cpp.developpez.com - Les pointeurs et références en C++](https://cpp.developpez.com/cours/cpp/?page=page_6)
* La **propriété** (*ownership*), l'**emprunt** (*borrowing*) et les **durées de vie** (*lifetimes*) en Rust, voir [doc.rust-lang.org - Understanding Ownership](https://doc.rust-lang.org/book/ch04-00-understanding-ownership.html) et [doc.rust-lang.org - Validating References with Lifetimes](https://doc.rust-lang.org/book/ch10-03-lifetime-syntax.html)

### Passage par valeur ou par référence

Lors de l'appel d'une fonction, un paramètre peut être transmis :

* **Par valeur** : la fonction reçoit une **copie**, ses modifications sont sans effet pour l'appelant.
* **Par référence** : la fonction accède à la **même donnée**, ses modifications sont visibles par l'appelant.

Les langages ne se comportent pas de la même manière :

=== "TypeScript"

    ```ts
    function update(n: number, values: number[]): void {
        n = 2;          // sans effet pour l'appelant (copie de la valeur)
        values.push(2); // visible par l'appelant (même tableau)
    }

    let n = 1;
    const values = [1];
    update(n, values); // n vaut 1, values vaut [1, 2]
    ```

=== "Java"

    ```java
    static void update(int n, List<Integer> values) {
        n = 2;         // sans effet pour l'appelant (copie de la valeur)
        values.add(2); // visible par l'appelant (même liste)
    }

    int n = 1;
    List<Integer> values = new ArrayList<>(List.of(1));
    update(n, values); // n vaut 1, values vaut [1, 2]
    ```

=== "Python"

    ```python
    def update(n: int, values: list[int]) -> None:
        n = 2  # sans effet pour l'appelant (réaffectation locale)
        values.append(2)  # visible par l'appelant (même liste)


    n = 1
    values = [1]
    update(n, values)  # n vaut 1, values vaut [1, 2]
    ```

=== "C++"

    ```cpp
    void byValue(std::vector<int> values) {
        values.push_back(2); // sans effet pour l'appelant (copie)
    }

    void byReference(std::vector<int>& values) {
        values.push_back(2); // visible par l'appelant (référence)
    }

    std::vector<int> values{1};
    byValue(values);     // values vaut {1}
    byReference(values); // values vaut {1, 2}
    ```

=== "PHP"

    ```php
    function byValue(array $values): void
    {
        $values[] = 2; // sans effet pour l'appelant (les tableaux sont copiés)
    }

    function byReference(array &$values): void
    {
        $values[] = 2; // visible par l'appelant (passage par référence)
    }

    $values = [1];
    byValue($values);     // $values vaut [1]
    byReference($values); // $values vaut [1, 2]
    ```

En TypeScript, Java et Python, la référence vers l'objet est elle-même copiée : réaffecter le paramètre (ex : `values = []`) reste sans effet pour l'appelant.

### La mémoire managée

Dans les **langages de haut niveau**, l'environnement d'exécution (interpréteur, machine virtuelle) prend en charge l'allocation et la libération de la mémoire à l'aide d'un [ramasse-miettes](ramasse-miettes.md). Les **objets** y sont manipulés **par référence**, les types primitifs restant manipulés par valeur en Java ou en JavaScript.

## Pour aller plus loin

* [Le ramasse-miettes (garbage collector)](ramasse-miettes.md)

## Liens utiles

* [fr.wikipedia.org - Pile (informatique)](https://fr.wikipedia.org/wiki/Pile_(informatique))
* [fr.wikipedia.org - Allocation de mémoire](https://fr.wikipedia.org/wiki/Allocation_de_m%C3%A9moire)
* [fr.wikipedia.org - Pointeur (programmation)](https://fr.wikipedia.org/wiki/Pointeur_(programmation))
* [www.php.net - Passage par référence](https://www.php.net/manual/fr/language.references.pass.php)
