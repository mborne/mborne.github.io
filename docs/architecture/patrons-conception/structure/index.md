# Les patrons de structure

> 🤖 Rédaction assistée par IA.

Les patrons de structure traitent de l'**assemblage des classes et des objets** pour former des structures plus larges, tout en gardant ces structures **souples et réutilisables**.

## Les patrons du GoF

* [Facade (Façade)](Facade.md) : **fournir une interface simple** pour les cas d'usage courants d'un système complexe
* [Decorator (Décorateur)](Decorator.md) : **modifier dynamiquement le comportement** d'un objet existant
* [Composite (Objet composite)](Composite.md) : **traiter de la même manière les feuilles et les nœuds** d'une structure arborescente
* [Adapter (Adaptateur)](Adapter.md) : **rendre compatibles deux interfaces** offrant des fonctionnalités équivalentes
* [Bridge (Pont)](Bridge.md) : **découpler une abstraction de son implémentation** pour qu'elles varient indépendamment

## Pour aller plus loin

Les patrons suivants ne sont pas traités dans le cours :

* [Proxy](https://refactoring.guru/fr/design-patterns/proxy) : **contrôler l'accès à un objet** via un intermédiaire offrant la même interface (ex : chargement à la demande, cache, contrôle des droits)
* [Flyweight (Poids-mouche)](https://refactoring.guru/fr/design-patterns/flyweight) : **partager les parties communes** d'un grand nombre d'objets pour limiter la consommation mémoire
