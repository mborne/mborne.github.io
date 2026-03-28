# Architecture

!!!info "En construction"
    Cette section à vocation a accueillir les [annexes du cours-archi-si-geo](https://github.com/mborne/cours-archi-si-geo/tree/master/annexes) et les [annexes du cours-patron-conception](https://mborne.github.io/cours-patron-conception/annexe/)

## 🎓 Les cours

!!!info "[Les patrons de conception](https://mborne.github.io/cours-patron-conception/#1)"

    Dans ce cours, on travaille à l'échelle d'une application. On commence par bien comprendre l'**intérêt des concepts de la POO** (constructeur, visibilité, interface,…) et on aborde les **principes de conceptions (SOLID, KISS,...)** avant de présenter les principaux **anti-patrons** et **patrons de conceptions** en mettant en pratique à travers des TP.

    Public : Géodata Paris (master TSI).

    [:octicons-arrow-right-24: Accéder au cours](https://mborne.github.io/cours-patron-conception/#1)

!!!info "[Introduction à l'architecture des SI](https://mborne.github.io/cours-archi-si-geo/)"

    Dans ce cours, on travaille à l'échelle des SI (plusieurs applications et services). On se concentre sur les **défis** et les **principes d'architecture** avant de présenter les principaux **styles d'architecture** (monolythe, client-serveur, n-tiers, micro-services...). On fait ensuite un focus sur les **SI manipulant des données géographiques** et leurs spécificités.

    Public : Géodata Paris (master GDS).

    [:octicons-arrow-right-24: Accéder au cours](https://mborne.github.io/cours-archi-si-geo/#1)

## Les API

* [Les API WEB et les autres](api/index.md)
* [editor.swagger.io](https://editor.swagger.io/)

## Les patrons de conceptions

!!!info "En construction"

    Voir [cours-patron-conception - Les patrons de conceptions](https://mborne.github.io/cours-patron-conception/annexe/design_pattern/index.html)

[learn.microsoft.com - Modèles de conception de cloud](https://learn.microsoft.com/fr-fr/azure/architecture/patterns/)

* [learn.microsoft.com - Modèle Surveillance de point de terminaison](https://learn.microsoft.com/fr-fr/azure/architecture/patterns/health-endpoint-monitoring) qui décrit le principe d'**URL dédiée à la surveillance**.
* [learn.microsoft.com - CQRS](https://learn.microsoft.com/fr-fr/azure/architecture/patterns/cqrs) incite à **séparer les API d'écriture et de lecture** pour s'adapter à la charge plus facilement sur la seule diffusion (ex : `/wms`, `/wfs` vs `/geoserver/`)
* [learn.microsoft.com - Modèle Figuier étrangleur](https://learn.microsoft.com/fr-fr/azure/architecture/patterns/strangler-fig) qui guide pour faciliter la **migration en douceur d'un ancien vers un nouveau service**.
* [learn.microsoft.com - Modèle Nouvelle tentative](https://learn.microsoft.com/fr-fr/azure/architecture/patterns/retry) et [learn.microsoft.com - Modèle Disjoncteur](https://learn.microsoft.com/fr-fr/azure/architecture/patterns/circuit-breaker) qui donne de l'inspiration pour **survivre aux instabilités d'un service tiers**.

## Pour progresser

Les *roadmap* suivantes permettent de faire le tour des concepts et propose un ordre de découverte :

* [roadmap.sh - Software Architect](https://roadmap.sh/software-architect)
* [roadmap.sh - System Design](https://roadmap.sh/system-design)
* [roadmap.sh - Software Design and Architecture](https://roadmap.sh/software-design-architecture)

## Ressources

* [vocal.media - Infographic for Software Architecture History](https://vocal.media/01/infographic-for-software-architecture-history) donne une vue historique intéressante de l'assembleur en 1951 à gRPC en 2016.
