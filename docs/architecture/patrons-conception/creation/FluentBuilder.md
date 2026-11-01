# Couplage de Fluent Interface et Builder

> 🤖 Rédaction assistée par IA.

!!! info "Hors GoF"

    Cette fiche ne présente pas un patron à part entière : elle illustre l'utilisation conjointe du patron [Builder](Builder.md) (GoF) et de [Fluent Interface](FluentInterface.md) (hors GoF).

Les patrons [Builder](Builder.md) et [Fluent Interface](FluentInterface.md) répondent à des problèmes différents mais ils sont souvent utilisés conjointement :

* **Builder** prend en charge la **logique de construction**
* **Fluent Interface** rend les **appels au builder plus lisibles**

## Cas d'école

Nous avons des personnes modélisées par un nom (`name`) et une adresse (`address`). Nous souhaitons géocoder ces adresses à la construction pour renseigner les coordonnées correspondant à l'adresse (`longitude`, `latitude`).

**Un constructeur ne pouvant pas être asynchrone, le géocodage ne peut pas être réalisé dans le constructeur de `Person`.**

## Solution

Le principe consiste à :

* **Isoler les traitements nécessaires à la construction** dans des classes dédiées (ici, le géocodage)
* **Séparer la modélisation des données** de leur construction
* **Confier la construction à un builder** dont les méthodes renvoient l'objet courant pour permettre le chaînage des appels, la méthode `build()` réalisant les traitements (éventuellement asynchrones) et produisant le résultat

## Exemple d'implémentation

Pour notre cas d'école, nous procédons comme suit :

1. Encapsuler l'appel au [service de géocodage de la Géoplateforme](https://cartes.gouv.fr/aide/fr/guides-utilisateur/utiliser-les-services-de-la-geoplateforme/geocodage/) dans une classe `Geocoder` :

    ```ts
    /**
     * Service de géocodage convertissant une adresse en longitude, latitude
     */
    class Geocoder {
        async geocode(address: string): Promise<[number, number]> {
            const url = "https://data.geopf.fr/geocodage/search?" + new URLSearchParams({
                q: address,
                limit: "1",
            });

            const res = await fetch(url);
            if (!res.ok) {
                throw new Error(`échec du géocodage (HTTP ${res.status})`);
            }
            const body = await res.json();
            if (body.features.length === 0) {
                throw new Error(`adresse non trouvée : ${address}`);
            }
            return body.features[0].geometry.coordinates;
        }
    }
    ```

2. Définir une **interface `Person` modélisant les données** :

    ```ts
    interface Person {
        name: string;
        address: string;
        longitude: number;
        latitude: number;
    }
    ```

3. Définir une **classe `PersonBuilder` respectant l'approche Fluent Interface** pour encapsuler l'appel au géocodage :

    ```ts
    /**
     * Construction d'une personne avec géocodage de l'adresse.
     */
    class PersonBuilder {
        private name = "";
        private address = "";

        setName(name: string): this {
            this.name = name;
            return this;
        }

        setAddress(address: string): this {
            this.address = address;
            return this;
        }

        async build(): Promise<Person> {
            if (!this.address) {
                throw new Error("adresse non renseignée");
            }

            const geocoder = new Geocoder();
            const [longitude, latitude] = await geocoder.geocode(this.address);

            return {
                name: this.name,
                address: this.address,
                longitude,
                latitude,
            };
        }
    }
    ```

À l'utilisation, nous constatons que **Fluent Interface** rend le code plus lisible tandis que **Builder** permet de **découpler la logique de construction et la modélisation des données** :

```ts
const person = await new PersonBuilder()
    .setName("John Doe")
    .setAddress("73 Av. de Paris, 94160 Saint-Mandé")
    .build();
// {"name":"John Doe","address":"73 Av. de Paris, 94160 Saint-Mandé","longitude":2.424573,"latitude":48.845726}
console.log(JSON.stringify(person));
```

## Liens utiles

* [Builder (Monteur)](Builder.md)
* [Fluent Interface (Interface fluide)](FluentInterface.md)
* [cartes.gouv.fr - Géocodage](https://cartes.gouv.fr/aide/fr/guides-utilisateur/utiliser-les-services-de-la-geoplateforme/geocodage/)
