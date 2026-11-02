# Les blocs d'instructions

> 🤖 Rédaction assistée par IA.

## Définition

Un **bloc d'instructions** regroupe une **suite d'[instructions](instruction.md)** qui sera traitée comme une seule instruction (instruction composée). Il forme par exemple le **corps** d'une condition, d'une [boucle](boucles.md) ou d'une [fonction](fonction.md).

## En pratique

### Syntaxe des blocs

La définition des blocs d'instructions variera en fonction du langage :

* Utilisation d'**accolades** ouvrantes (`{`) et fermantes (`}`)
* Utilisation de la seule **indentation** du code (ex : Python où il ne faudra pas mixer les tabulations et les espaces)
* Utilisation de **mots clés dédiés** (ex : `BEGIN` et `END` avec PL/pgSQL)

Par exemple, pour le corps d'une condition :

=== "Accolades (C, Java, JavaScript, PHP...)"

    ```js
    if (age >= 18) {
        console.log("majeur");
    }
    ```

=== "Indentation (Python)"

    ```python
    if age >= 18:
        print("majeur")
    ```

=== "Mots clés (PL/pgSQL)"

    ```sql
    IF age >= 18 THEN
        RAISE NOTICE 'majeur';
    END IF;
    ```

Dans tous les cas, une bonne indentation des blocs d'instructions facilitera la lecture du code (voir [Les conventions de nommage et de codage](../bonnes-pratiques/conventions.md)).

### Imbrication des blocs

Les blocs d'instructions **peuvent être imbriqués** (ex : une boucle dans une fonction)[^asm].

### Bloc et portée des variables

Dans de nombreux langages (C, C++, Java, Rust...), une variable déclarée dans un bloc n'est accessible que dans ce bloc (**portée de bloc**, voir [La portée des variables](variable.md#la-portee)).

Ce n'est pas systématique :

* En JavaScript, une variable déclarée avec `var` a une portée de **fonction** alors qu'une variable déclarée avec `let` ou `const` a une portée de **bloc**.
* En Python, une variable affectée dans le corps d'un `if` ou d'une boucle reste accessible après celui-ci : la portée est celle de la **fonction** (ou du module).

## Liens utiles

* [en.wikipedia.org - Block (programming)](https://en.wikipedia.org/wiki/Block_(programming))
* [fr.wikipedia.org - Portée (informatique)](https://fr.wikipedia.org/wiki/Port%C3%A9e_(informatique))
* [developer.mozilla.org - bloc](https://developer.mozilla.org/fr/docs/Web/JavaScript/Reference/Statements/block)
* [docs.python.org - Resolution of names](https://docs.python.org/3/reference/executionmodel.html#resolution-of-names)

[^asm]: En assembleur, il n'existe pas de syntaxe dédiée : les instructions sont regroupées à l'aide d'**étiquettes** (*labels*) et de **sauts** (*jumps*).
