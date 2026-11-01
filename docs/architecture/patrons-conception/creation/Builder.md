# Builder (Monteur)

> 🤖 Rédaction assistée par IA.

## Problème

Les [fabriques](Factory.md) traitent principalement le **choix du type à instancier**. Le patron de conception **Builder (Monteur)** s'attaque à la **construction d'objets complexes par étapes**. Il sera utile quand :

* L'objet **ne peut être construit qu'une fois toutes les informations collectées** (il ne doit pas exister dans un état incomplet)
* La **logique de construction est complexe** et nous ne souhaitons pas la mélanger avec la modélisation de l'objet construit
* Nous serions amenés à **multiplier les constructeurs** pour couvrir les différentes combinaisons de paramètres

## Cas d'école

Nous développons une bibliothèque de triangulation. L'algorithme de Delaunay incrémental **insère les points un à un** et s'appuie sur des **structures de travail** (ex : une structure en [half-edge](https://doc.cgal.org/latest/HalfedgeDS/index.html) comme dans CGAL) qui ne font pas partie du résultat.

**Si nous plaçons cette logique dans la classe modélisant le résultat, nous manipulerons des triangulations dans un état intermédiaire et nous mélangerons la logique de construction avec la modélisation des triangles.**

## Solution

Dans sa **forme originale (GoF)**, le patron vise à **séparer la construction d'un objet complexe de sa représentation** afin qu'un **même processus de construction puisse produire des représentations différentes**. Il fait intervenir :

* Un **Director** qui connaît l'**ordre des étapes** de construction (`construct()`)
* Un **Builder** qui déclare les étapes (`buildPart()`)
* Des **ConcreteBuilders** qui réalisent ces étapes et fournissent le résultat (`getResult()`)

![UML Builder](uml/UML_DP_Builder.png)

Source : [en.wikibooks.org - Builder](https://en.wikibooks.org/wiki/Computer_Science_Design_Patterns/Builder)

Par exemple, dans l'[exemple en Java de Wikipédia](https://fr.wikipedia.org/wiki/Monteur_%28patron_de_conception%29#Java), un **Serveur** (*Director*) prépare une **Pizza** (*Product*) en suivant toujours les mêmes étapes (pâte, sauce, garniture) et le choix du monteur (*ConcreteBuilder*) détermine la pizza obtenue (`MonteurPizzaReine` ou `MonteurPizzaPiquante`).

**En pratique**, le *Director* est souvent absent : la **terminologie builder est généralisée à la création incrémentale d'objet** :

* Création d'un builder
* Appels successifs au builder pour fournir les informations permettant de construire l'objet (`add`, `set`, etc.)
* Récupération de l'instance produite

## Exemple d'implémentation

Pour notre cas d'école, nous pouvons définir un `DelaunayTriangulationBuilder` encapsulant les structures de travail :

```ts
class DelaunayTriangulationBuilder {
    // structure de travail (sommets, demi-arêtes et faces)
    private halfEdges = new HalfEdgeStructure();

    addPoint(point: Point): void {
        // insertion du point et basculement des arêtes ne respectant pas
        // le critère de Delaunay
    }

    getTriangles(): Triangle[] {
        // conversion des faces de la structure en triangles
        return this.halfEdges.getFaces().map((face) => face.toTriangle());
    }
}
```

À l'utilisation, nous aurons :

```ts
const builder = new DelaunayTriangulationBuilder();
for (const point of points) {
    builder.addPoint(point);
}
const triangles = builder.getTriangles();
```

> Voir aussi [Facade](../structure/Facade.md) qui simplifie l'utilisation de ce builder pour les cas d'usage courants.

## Variantes

### Couplage avec Fluent Interface

Le builder est souvent combiné avec le patron [Fluent Interface](FluentInterface.md) pour chaîner les appels jusqu'à une méthode `build()` :

```ts
const person = new PersonBuilder()
    .setName("John Doe")
    .setAddress("73 Av. de Paris, 94160 Saint-Mandé")
    .build();
```

> Voir [Couplage de Fluent Interface et Builder](FluentBuilder.md).

### Builders implicites

Dans de nombreuses API, le builder n'apparaît pas explicitement :

* Il peut être **obtenu via une fonction** plutôt que par la création d'une classe `XxxBuilder` (ex : `knex("users")`) ou porter un nom qui n'évoque pas la construction (ex : `URLSearchParams`)
* Le **nom de la méthode produisant le résultat varie** (`build()`, `getResult()`, `toString()`...)

Par exemple :

* Avec [URLSearchParams](https://developer.mozilla.org/fr/docs/Web/API/URLSearchParams) (API standard JavaScript), les paramètres d'URL sont ajoutés un à un et `toString()` produit la chaîne encodée :

    ```ts
    const params = new URLSearchParams();
    params.append("text", "73 Av. de Paris, Saint-Mandé");
    params.append("maximumResponses", "1");
    const query = params.toString();
    // text=73+Av.+de+Paris%2C+Saint-Mand%C3%A9&maximumResponses=1
    ```

* Avec [Knex.js](https://knexjs.org/guide/query-builder.html), la requête SQL est construite par appels chaînés et `toString()` produit le SQL (l'utilisation de `await` déclenche son exécution) :

    ```ts
    const sql = knex("users").where({ id: 1 }).select("name").toString();
    // select "name" from "users" where "id" = 1
    ```

## Mises en garde

* Un builder **ajoute une classe** : il ne se justifie pas pour la construction d'objets simples
* Le builder doit **contrôler la complétude des informations** au moment de produire le résultat (ex : lever une erreur si une information obligatoire est manquante ou si les points sont insuffisants pour construire une triangulation)
* Selon les langages, d'autres mécanismes répondent à la multiplication des constructeurs (ex : **objet d'options** en TypeScript avec `new Pizza({ pate: "fine", sauce: "tomate" })`, **arguments nommés** avec valeurs par défaut en Python)

## Liens utiles

* [refactoring.guru - Builder](https://refactoring.guru/fr/design-patterns/builder)
* [fr.wikibooks.org - Monteur](https://fr.wikibooks.org/wiki/Patrons_de_conception/Monteur)

Voir aussi :

* [TP - Envelope et EnvelopeBuilder](../tp-geometry-ts/index.md#05-envelope-et-envelopebuilder) pour une mise en pratique
* [Symfony - Building Forms](https://symfony.com/doc/current/forms.html#building-forms) pour la création de formulaires (PHP)
* [Doctrine - QueryBuilder](https://www.doctrine-project.org/projects/doctrine-orm/en/latest/reference/query-builder.html) pour la création de requêtes SQL (PHP)
