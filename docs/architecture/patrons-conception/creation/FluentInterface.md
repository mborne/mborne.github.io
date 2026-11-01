# Fluent Interface (Interface fluide)

> 🤖 Rédaction assistée par IA.

!!! info "Hors GoF"

    Ce patron ne fait pas partie du GoF. Le terme a été proposé par Martin Fowler et Eric Evans en 2005 ([martinfowler.com - FluentInterface](https://martinfowler.com/bliki/FluentInterface.html)).

## Problème

Nous souhaitons **enchaîner plusieurs appels sur un même objet de façon lisible**.

## Cas d'école

Nous avons des personnes modélisées par un nom (`name`) et une adresse (`address`). Leur initialisation conduit à du code tel que le suivant :

```ts
const person = new Person();
person.setName("John Doe");
person.setAddress("73 Av. de Paris, 94160 Saint-Mandé");
```

Nous remarquons que **nous multiplions les appels à `person.`**. Le patron [Builder](Builder.md) ne répond pas à ce problème : il traite la construction par étapes, pas la lisibilité des appels.

## Solution

Le principe consiste à **renvoyer l'objet courant (`this` ou `self`) dans les méthodes modifiant l'objet** (setters, etc.) pour **permettre le chaînage des appels**.

## Exemple d'implémentation

Pour notre cas d'école, nous modifions les setters de `Person` pour qu'ils renvoient l'objet courant :

```ts
class Person {
    name = "";
    address = "";

    setName(name: string): this {
        this.name = name;
        return this; // renvoie l'objet courant
    }

    setAddress(address: string): this {
        this.address = address;
        return this;
    }
}
```

Nous obtenons ainsi un code plus lisible :

```ts
const person = new Person()
    .setName("John Doe")
    .setAddress("73 Av. de Paris, 94160 Saint-Mandé");
// {"name":"John Doe","address":"73 Av. de Paris, 94160 Saint-Mandé"}
console.log(JSON.stringify(person));
```

## Variantes

### Interface fluide immuable

Plutôt que de modifier l'objet courant, chaque appel peut **renvoyer une nouvelle instance**. C'est par exemple le cas des traitements sur les tableaux en JavaScript :

```ts
const names = persons
    .filter((person) => person.address.includes("Saint-Mandé"))
    .map((person) => person.name);
```

Nous retrouvons cette approche avec les *streams* Java ou les dates de `java.time` (ex : `LocalDate.now().plusDays(1)`).

### Exemples dans les API

Le patron est très répandu dans les bibliothèques. Par exemple :

* [jQuery](https://api.jquery.com/) pour la manipulation du DOM : `$("p").addClass("highlight").show()`
* [Chai](https://www.chaijs.com/api/bdd/) pour l'écriture d'assertions : `expect(result).to.be.equal(3)`
* [Knex.js](https://knexjs.org/guide/query-builder.html) pour la création de requêtes SQL : `knex("users").where({ id: 1 }).select("name")`

## Mises en garde

* Une longue chaîne d'appels forme une **seule instruction**, ce qui peut compliquer le débogage (points d'arrêt, lecture des erreurs)
* Il convient de ne pas confondre avec les **enchaînements d'appels traversant plusieurs objets** (ex : `a.getB().getC().doSomething()`) qui violent la [loi de Déméter](https://fr.wikipedia.org/wiki/Loi_de_D%C3%A9m%C3%A9ter)

## Liens utiles

* [martinfowler.com - FluentInterface](https://martinfowler.com/bliki/FluentInterface.html)
* [en.wikipedia.org - Fluent interface](https://en.wikipedia.org/wiki/Fluent_interface)

Voir aussi :

* [Couplage de Fluent Interface et Builder](FluentBuilder.md)
