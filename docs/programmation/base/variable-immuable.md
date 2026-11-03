# Les variables immuables

> 🤖 Rédaction assistée par IA.

## Définition

Une variable est dite immuable si ni la variable, ni sa **valeur** ne peuvent être modifiées après l'initialisation (ex : `tuple` en Python, chaînes de caractères en Java et en Python).

## Intérêt

* Il est **inutile de copier des variables immuables** pour se protéger contre des modifications dans d'autres parties du programme.
* Il n'y a **pas de risque lié aux accès concurrents** en cas de parallélisation des traitements.
* Le code est **plus facile à suivre** : la valeur d'une variable immuable est connue dès sa déclaration.

## En pratique

Nous trouverons des variantes en fonction des langages de programmation.

### Les types immuables

Certains types sont **immuables par nature** en fonction du langage. Par exemple, les chaînes de caractères sont immuables en Java (`String`), en JavaScript et TypeScript (`string`) ou en Python (`str`) : les méthodes telles `toUpperCase()` renvoient une nouvelle chaîne.

À l'inverse, une `std::string` est modifiable en C++ (ex : `s[0] = 'A';`).

### Rendre une variable immuable

La méthode pour rendre une variable immuable varie d'un langage à l'autre :

=== "TypeScript"

    ```ts
    const ages: number[] = [20, 21];
    ages.push(22); // autorisé : le contenu est modifié
    // ages = []; // erreur : réassignation interdite

    const frozen: readonly number[] = [20, 21];
    // frozen.push(22); // erreur : tableau en lecture seule
    ```

=== "Java"

    ```java
    final List<Integer> ages = new ArrayList<>(List.of(20, 21));
    ages.add(22); // autorisé : le contenu est modifié
    // ages = new ArrayList<>(); // erreur de compilation : réassignation interdite

    final List<Integer> frozen = List.of(20, 21);
    // frozen.add(22); // UnsupportedOperationException à l'exécution
    ```

=== "Python"

    ```python
    from typing import Final

    AGES: Final = [20, 21]
    AGES.append(22)  # autorisé : le contenu est modifié
    # AGES = []  # signalé par mypy, mais accepté à l'exécution

    FROZEN = (20, 21)  # tuple : valeur immuable
    # FROZEN[0] = 0  # TypeError
    ```

=== "C++"

    ```cpp
    std::vector<int> ages{20, 21};
    ages.push_back(22); // autorisé

    const std::vector<int> frozen{20, 21};
    // frozen.push_back(22); // erreur de compilation : objet constant
    ```

=== "PHP"

    ```php
    const AGES = [20, 21]; // constante : ni réassignable, ni modifiable

    final class Person
    {
        public function __construct(public readonly int $age) // PHP >= 8.1
        {
        }
    }

    $person = new Person(20);
    // $person->age = 21; // Error : propriété en lecture seule
    ```

### L'immuabilité par défaut

Certains langages rendent les variables **immuables par défaut** et disposent d'un **mot clé spécifique** pour les rendre modifiables. C'est le cas de Rust avec `mut` :

```rust
let age = 20;
// age = 21; // erreur : cannot assign twice to immutable variable

let mut count = 0;
count += 1; // autorisé
```

## Mise en garde

Il ne faut pas confondre une variable immuable avec une variable **non réassignable** (ex : `const` en JavaScript, `final` en Java) : cette dernière ne peut pas recevoir une nouvelle valeur, mais le **contenu** de la valeur référencée peut rester modifiable (ex : `const` sur un tableau en JavaScript). Il s'agit alors d'une immuabilité **superficielle**.

Pour garantir qu'un objet ne sera pas modifié, il faudra concevoir des **objets immuables** (voir [La programmation orientée objet](../poo/index.md)).

## Liens utiles

* [fr.wikipedia.org - Objet immuable](https://fr.wikipedia.org/wiki/Objet_immuable)
* [developer.mozilla.org - const](https://developer.mozilla.org/fr/docs/Web/JavaScript/Reference/Statements/const)
* [docs.python.org - typing.Final](https://docs.python.org/3/library/typing.html#typing.Final)
* [www.php.net - Propriétés en lecture seule](https://www.php.net/manual/fr/language.oop5.properties.php#language.oop5.properties.readonly-properties)
* [doc.rust-lang.org - Variables and Mutability](https://doc.rust-lang.org/book/ch03-01-variables-and-mutability.html)
