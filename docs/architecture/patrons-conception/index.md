# Les patrons de conception

!!!info "En construction"

    Voir [cours-patron-conception - Les patrons de conception](https://mborne.github.io/cours-patron-conception/annexe/design_pattern/index.html)

## Les modèles de conception cloud

[learn.microsoft.com - Modèles de conception de cloud](https://learn.microsoft.com/fr-fr/azure/architecture/patterns/)

* [learn.microsoft.com - Modèle Surveillance de point de terminaison](https://learn.microsoft.com/fr-fr/azure/architecture/patterns/health-endpoint-monitoring) qui décrit le principe d'**URL dédiée à la surveillance**.
* [learn.microsoft.com - CQRS](https://learn.microsoft.com/fr-fr/azure/architecture/patterns/cqrs) incite à **séparer les API d'écriture et de lecture** pour s'adapter à la charge plus facilement sur la seule diffusion (ex : `/wms`, `/wfs` vs `/geoserver/`)
* [learn.microsoft.com - Modèle Figuier étrangleur](https://learn.microsoft.com/fr-fr/azure/architecture/patterns/strangler-fig) qui guide pour faciliter la **migration en douceur d'un ancien vers un nouveau service**.
* [learn.microsoft.com - Modèle Nouvelle tentative](https://learn.microsoft.com/fr-fr/azure/architecture/patterns/retry) et [learn.microsoft.com - Modèle Disjoncteur](https://learn.microsoft.com/fr-fr/azure/architecture/patterns/circuit-breaker) qui donnent de l'inspiration pour **survivre aux instabilités d'un service tiers**.
