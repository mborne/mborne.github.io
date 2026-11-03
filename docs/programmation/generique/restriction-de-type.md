# La programmation générique par restriction de type

> 🤖 Rédaction assistée par IA.

## Définition

Dans des langages tels Java ou TypeScript, il est possible de mettre à disposition des fonctions et des conteneurs supportant plusieurs types sans programmation générique, en s'appuyant sur un **type commun à toutes les valeurs** (ex : `Object` en Java, `unknown` en TypeScript). Le prix à payer est une **perte d'information sur les types**.

Dans ces langages, la programmation générique permet principalement de **détecter les erreurs de type avant l'exécution** à l'aide de **paramètres de type** sur lesquels il est possible de **définir des contraintes**. Contrairement à la [génération de code](generation-de-code.md), **un même code est utilisé pour tous les types**.

## En pratique

### Intérêt au niveau des structures de données

Avec la programmation générique, il est par exemple possible de spécifier qu'un traitement ne s'applique pas sur une **liste** mais sur **une liste d'utilisateurs** :

```java
void process(Logger logger, List<User> users) {
    for (User user : users) {
        logger.info("Traitement de {}...", user.getName());
        //...
    }
}
```

Le compilateur refusera alors l'appel de `process` avec une liste contenant autre chose que des `User`.

Il était par exemple nécessaire de *downcaster* de `Object` en `User` [avant l'introduction des *Generics* en Java](https://docs.oracle.com/javase/tutorial/extra/generics/intro.html) (Java 5) :

```java
void process(Logger logger, List users) {
    for (Object item : users) {
        User user = (User) item; // ClassCastException si item n'est pas un User
        logger.info("Traitement de {}...", user.getName());
        //...
    }
}
```

En l'absence de ce mécanisme, une erreur de type ne sera détectée qu'**à l'exécution** (`ClassCastException`).

### Intérêt au niveau des algorithmes

Au niveau des algorithmes, la programmation générique permet principalement de :

* Spécifier les **contraintes sur les types** en entrée.
* Renvoyer une valeur avec un **type fonction des paramètres** en entrée.

En Java, la [méthode statique `min` de la classe `Collections`](https://docs.oracle.com/en/java/javase/21/docs/api/java.base/java/util/Collections.html#min(java.util.Collection)) est une bonne illustration :

```java
public static <T extends Object & Comparable<? super T>>
T min(Collection<? extends T> coll) {
    //... algorithme du calcul du minimum
}
```

où :

* On prend en entrée une `Collection` avec un type générique `T`
* Ce type générique `T` doit implémenter l'interface [Comparable](https://docs.oracle.com/en/java/javase/21/docs/api/java.base/java/lang/Comparable.html)[^object]
* Le résultat est de type `T`

En l'absence de ce mécanisme, il ne serait pas possible de faire mieux que l'interface suivante qui induirait un *downcast* du résultat au niveau du code appelant l'utilitaire :

```java
Object min(Collection items) {
    // calcul du minimum avec downcast sur Comparable
}
```

### Dans les différents langages

Par exemple, pour une fonction `largest` renvoyant la plus grande de deux valeurs comparables :

=== "TypeScript"

    ```ts
    function largest<T extends number | string>(a: T, b: T): T {
        return a < b ? b : a;
    }

    largest(2, 5); // 5
    largest("a", "b"); // "b"
    ```

=== "Java"

    ```java
    static <T extends Comparable<T>> T largest(T a, T b) {
        return a.compareTo(b) < 0 ? b : a;
    }

    largest(2, 5); // 5
    largest("a", "b"); // "b"
    ```

=== "Python"

    ```python
    # Python >= 3.12
    def largest[T: (int, str)](a: T, b: T) -> T:
        return b if a < b else a


    largest(2, 5)  # 5
    largest("a", "b")  # "b"
    ```

    Les paramètres de type sont vérifiés par les outils d'analyse statique (ex : [mypy](https://mypy.readthedocs.io/)), pas à l'exécution.

=== "PHP"

    ```php
    /**
     * @template T of int|string
     * @param T $a
     * @param T $b
     * @return T
     */
    function largest(int|string $a, int|string $b): int|string
    {
        return $a < $b ? $b : $a;
    }
    ```

    PHP ne dispose pas de génériques : les paramètres de type sont déclarés en **annotations** et vérifiés par des outils d'analyse statique (ex : [PHPStan](https://phpstan.org/blog/generics-in-php-using-phpdocs), [Psalm](https://psalm.dev/docs/annotating_code/templated_annotations/)).

## Mises en garde

Les paramètres de type sont **vérifiés avant l'exécution puis effacés** (*type erasure*) : ils ne sont plus disponibles à l'exécution. Ainsi :

* En Java, `List<String>` et `List<Integer>` correspondent à la **même classe** à l'exécution (`ArrayList`) et il n'est pas possible d'écrire `new T()` ou `obj instanceof List<String>` (voir [docs.oracle.com - Type Erasure](https://docs.oracle.com/javase/tutorial/java/generics/erasure.html)).
* En TypeScript, les types disparaissent du code JavaScript produit : rien ne garantit qu'une donnée reçue à l'exécution (ex : un JSON) respecte le type annoncé.

## Liens utiles

* [www.typescriptlang.org - Generics](https://www.typescriptlang.org/docs/handbook/2/generics.html)
* [docs.oracle.com - Generics](https://docs.oracle.com/javase/tutorial/java/generics/index.html)
* [docs.python.org - Type parameter lists](https://docs.python.org/3/reference/compound_stmts.html#type-params)
* [phpstan.org - Generics in PHP using PHPDocs](https://phpstan.org/blog/generics-in-php-using-phpdocs)

[^object]: La contrainte `T extends Object & Comparable<? super T>` (et non simplement `T extends Comparable<? super T>`) assure la compatibilité avec les versions antérieures de Java : après effacement des types, la méthode renvoie un `Object` comme avant l'introduction des *Generics*.
