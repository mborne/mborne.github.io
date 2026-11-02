# Les types

> 🤖 Rédaction assistée par IA.

## Définition

Un **type** définit l'**ensemble des valeurs possibles** d'une donnée et les **opérations autorisées** sur ces valeurs.

Quel que soit le langage de programmation utilisé, une valeur aura toujours un type. Il permettra par exemple d'avoir comme résultat :

* `5` pour l'addition de deux nombres `2` et `3`
* `"23"` pour la concaténation de deux chaînes de caractères `"2"` et `"3"`

## En pratique

### Les types primitifs

Les langages fournissent des **types primitifs** (ou types de base) dont le nommage varie :

| Type | TypeScript | Java | Python | C++ | PHP |
| ---- | ---------- | ---- | ------ | --- | --- |
| Entier | `number`, `bigint` | `int`, `long`... | `int` | `int`, `long`... | `int` |
| Flottant | `number` | `float`, `double` | `float` | `float`, `double` | `float` |
| Booléen | `boolean` | `boolean` | `bool` | `bool` | `bool` |
| Caractère | - | `char` | - | `char` | - |
| Chaîne de caractères | `string` | `String`[^string] | `str` | `std::string`[^string] | `string` |
| Absence de valeur | `null`, `undefined`, `void` | `null`, `void` | `None` | `nullptr`, `void` | `null`, `void` |

### Typage statique ou dynamique

En fonction du langage :

* Avec un **typage statique**, le type des variables est connu et vérifié à la compilation. Il n'a pas forcément à être écrit grâce à l'**inférence de type** (ex : `let x = 5;` en Rust, `var` en Java, `auto` en C++).
* Avec un **typage dynamique**, le type est porté par la valeur et vérifié à l'exécution (une même variable peut successivement contenir des valeurs de types différents).

Un nombre croissant de langages à typage dynamique **permettent de déclarer des types** (**typage graduel**) :

* En PHP, les [déclarations de type](https://www.php.net/manual/fr/language.types.declarations.php) sont **contrôlées à l'exécution**.
* En Python, les [annotations de type](https://docs.python.org/3/library/typing.html) (Python >= 3.5) ne sont **pas contrôlées à l'exécution** mais exploitées par des **outils d'analyse statique** (ex : [mypy](https://mypy.readthedocs.io/)) et par les éditeurs.
* [TypeScript](https://www.typescriptlang.org/) ajoute un typage statique à JavaScript : les types sont vérifiés à la compilation puis **effacés** dans le code JavaScript produit.

Voir [Les spécificités des langages - Typage statique ou typage dynamique](../../architecture/patrons-conception/specificites-langages/index.md#typage-statique-ou-typage-dynamique) pour l'impact sur la conception.

### Typage fort ou faible et conversions

Les notions de typage statique et dynamique ne doivent pas être confondues avec le **typage fort** et le **typage faible** qui caractérisent la tolérance du langage aux **conversions implicites** (ex : `"2" + 3` vaut `"23"` en JavaScript, typage dynamique et faible, alors que Python lève une `TypeError`, typage dynamique et fort).

Dans tous les cas, il sera possible de procéder à des **conversions explicites** (*cast*) :

=== "TypeScript"

    ```ts
    const n: number = Number("42"); // 42 (NaN si la conversion échoue)
    const s: string = String(42);   // "42"
    ```

=== "Java"

    ```java
    int n = Integer.parseInt("42"); // 42
    String s = String.valueOf(42);  // "42"
    int i = (int) 3.7;              // 3 (troncature)
    ```

=== "Python"

    ```python
    n = int("42")  # 42
    s = str(42)  # "42"
    i = int(3.7)  # 3 (troncature)
    ```

=== "C++"

    ```cpp
    int n = std::stoi("42");          // 42
    std::string s = std::to_string(42); // "42"
    int i = static_cast<int>(3.7);    // 3 (troncature)
    ```

=== "PHP"

    ```php
    $n = (int) "42";  // 42
    $s = (string) 42; // "42"
    $i = (int) 3.7;   // 3 (troncature)
    ```

### Les tableaux

Un **tableau** regroupe des valeurs accessibles par leur **indice** (généralement à partir de `0`, ex : `t[0]`). Nous distinguerons :

* Les **tableaux de taille fixe** (ex : `int t[3]` en C++, `new int[3]` en Java)
* Les **tableaux de taille variable** (ex : `Array` en JavaScript, `list` en Python, `array` en PHP, `std::vector` en C++, `ArrayList` en Java)

Voir [Les structures de données](../structures-de-donnees/index.md) pour les autres structures (listes, piles, files, dictionnaires...).

### Les types définis par l'utilisateur

La plupart des langages permettent de **définir de nouveaux types**.

#### Les structures

Une **structure** regroupe plusieurs valeurs nommées (ses **champs**) au sein d'un même type. Par exemple, pour une coordonnée :

=== "TypeScript"

    ```ts
    type Coordinate = {
        x: number;
        y: number;
    };

    const c: Coordinate = { x: 2.0, y: 3.0 };
    ```

=== "Python"

    ```python
    from typing import TypedDict

    Coordinate = TypedDict("Coordinate", {"x": float, "y": float})

    c: Coordinate = {"x": 2.0, "y": 3.0}
    ```

    Les champs sont vérifiés par les outils d'analyse statique (ex : [mypy](https://mypy.readthedocs.io/)), pas à l'exécution.

=== "C++"

    ```cpp
    struct Coordinate {
        double x;
        double y;
    };

    Coordinate c{2.0, 3.0};
    ```

#### Les énumérations

Une **énumération** définit un type dont les valeurs possibles sont **listées explicitement** :

=== "TypeScript"

    ```ts
    enum Color {
        Red,
        Green,
        Blue,
    }

    const color: Color = Color.Green;
    ```

=== "Java"

    ```java
    enum Color { RED, GREEN, BLUE }

    Color color = Color.GREEN;
    ```

=== "Python"

    ```python
    from enum import Enum


    class Color(Enum):
        RED = 1
        GREEN = 2
        BLUE = 3


    color = Color.GREEN
    ```

=== "C++"

    ```cpp
    enum class Color { Red, Green, Blue };

    Color color = Color::Green;
    ```

=== "PHP"

    ```php
    // PHP >= 8.1
    enum Color
    {
        case Red;
        case Green;
        case Blue;
    }

    $color = Color::Green;
    ```

Certains langages permettent d'**associer des données à chaque valeur** de l'énumération. C'est le cas de Rust :

```rust
enum Shape {
    Circle(f64),
    Rectangle(f64, f64),
}

fn area(shape: &Shape) -> f64 {
    match shape {
        Shape::Circle(r) => 3.14159 * r * r,
        Shape::Rectangle(w, h) => w * h,
    }
}
```

C'est ce mécanisme qui permet de construire les types `Result` et `Option` utilisés pour [la gestion des erreurs](../erreurs/index.md).

#### Les alias de type

Un **alias de type** permet de **nommer un type existant** pour clarifier le code (ex : `type Id = number` en TypeScript, `using Id = int;` en C++, `type Id = int` en Python >= 3.12). Il n'existe pas d'équivalent en Java et en PHP.

## Mises en garde

* Les **flottants** sont des approximations : `0.1 + 0.2` ne vaut pas exactement `0.3` (voir [0.30000000000000004.com](https://0.30000000000000004.com/)).
* Les **entiers** ont une taille limitée dans la plupart des langages. En cas de dépassement, la valeur boucle en Java (`Integer.MAX_VALUE + 1` vaut `-2147483648`), le comportement est indéfini pour les entiers signés en C++ et la valeur est convertie en `float` en PHP. Les entiers sont de taille arbitraire en Python (`2**100` est calculé exactement).

## Liens utiles

* [La programmation orientée objet](../poo/index.md) : la **classe** ira plus loin que la structure en associant aux données des **méthodes** et des mécanismes d'[encapsulation](../poo/encapsulation.md).
* [fr.wikipedia.org - Type (informatique)](https://fr.wikipedia.org/wiki/Type_(informatique))
* [fr.wikipedia.org - Typage fort](https://fr.wikipedia.org/wiki/Typage_fort)
* [developer.mozilla.org - Les types et structures de données JavaScript](https://developer.mozilla.org/fr/docs/Web/JavaScript/Data_structures)
* [docs.oracle.com - Primitive Data Types](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html)
* [docs.python.org - Built-in Types](https://docs.python.org/3/library/stdtypes.html)
* [en.cppreference.com - Fundamental types](https://en.cppreference.com/w/cpp/language/types)
* [www.php.net - Les types](https://www.php.net/manual/fr/language.types.php)

[^string]: En Java et en C++, les chaînes de caractères ne sont pas des types primitifs mais des classes (`String` en Java, `std::string` de la bibliothèque standard en C++).
