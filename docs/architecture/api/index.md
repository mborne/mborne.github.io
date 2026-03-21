# Les API WEB et les autres

## Contexte

En 2025, les API REST/JSON ont toujours le vent en poupe. Toutefois, la mode évolue au niveau des API WEB s'appuyant sur le protocole HTTP (REST/JSON vs WebSocket vs GraphQL vs gRPC). Aussi, il semble intéressant de prendre du recul, de mesurer les limites des API exploitant le réseau, et de constater que différents types d'API coexistent et se complètent.

## Quelques types d'API

### Les bibliothèques de programmation

C'est le type d'API qui offre la plus **grande richesse fonctionnelle** et la plus **grande liberté d'utilisation** qui sera **toujours à la base de l'édifice** en présence d'une application en ligne de commande, d'un service ou d'une API WEB.

Toutefois :

- Une bibliothèque est **liée à un langage de programmation** (bien qu'il soit possible de faire des "bindings" pour appeler par exemple en Python du code écrit en C++).
- Les **clients** doivent avoir des **compétences en programmation**.
- **Les clients devront gérer les mises à jour** avec plus ou moins de facilité en fonction de :
    - La qualité du packaging et l'utilisation d'un système de gestion des dépendances (`apt-get upgrade`, `pip install -r requirements.txt`, `npm install`,...)
    - La fréquence des versions majeures s'accompagnant souvent de changements cassants.
- **Mettre à disposition proprement une bibliothèque** a un **coût variable en fonction du langage utilisé** et des **systèmes cibles**.

### Les API exposées sous forme de services

Nous trouvons plusieurs systèmes mettant à disposition des API sous forme de services en réseau via des protocoles au niveau TCP ou UDP :

- Les bases de données (PostgreSQL, MongoDB, Redis,...)
- Les serveurs SMTP pour l'envoi de mail
- Les serveurs DNS pour la résolution de nom
- ...

Par rapport aux bibliothèques, nous noterons que :

- Les mises à jour des services sont centralisées
- Les clients peuvent être écrits dans plusieurs langages

Par rapport aux API WEB ci-après, nous noterons que :

- Les protocoles seront très divers en fonction des services.
- Cette hétérogénéïté se traduira par la multiplication des clients (un client par service ou type de service)

### Les API WEB exposées en HTTP

Nous trouvons plusieurs types d'API WEB exposées à l'aide du protocole HTTP avec des évolutions qui semblent se faire en parallèle des évolutions sur les formats et besoins :

- [SOAP (1999)](https://fr.wikipedia.org/wiki/SOAP) a eu le vent en poupe quand le format [XML (1998)](https://fr.wikipedia.org/wiki/Extensible_Markup_Language) et les [schémas XSD (2001)](https://fr.wikipedia.org/wiki/XML_Schema) étaient à la mode.
- [SOAP](https://fr.wikipedia.org/wiki/SOAP) a progressivement cédé du terrain au profit des API [REST (2000)](https://fr.wikipedia.org/wiki/Representational_state_transfer) exploitant au choix les formats XML ou JSON.
- Les API REST JSON/XML ont progressivement abandonné le format XML pour travailler exclusivement avec le format JSON.
- Les [WebSocket (2011)](https://en.wikipedia.org/wiki/WebSocket) ont été créées pour répondre au besoin de **communication bidirectionnelle en temps réel**.
- Nous trouvons désormais des [API GraphQL (2012)](https://graphql.org/) visant à donner **plus de souplesse dans l'exploitation des propriétés et relations que les API REST/JSON classiques** au niveau de [GitHub](https://docs.github.com/en/graphql), [GitLab](https://docs.gitlab.com/ee/api/graphql/),...
- Le format [Protocol Buffer](https://fr.wikipedia.org/wiki/Protocol_Buffers) gagne du terrain ([Vector tiles](https://docs.mapbox.com/data/tilesets/guides/vector-tiles-standards/), [format PBF d'OSM](https://wiki.openstreetmap.org/wiki/PBF_Format),...) et [gRPC](https://fr.wikipedia.org/wiki/GRPC) commence à se démocratiser.
- Un approche telle [gRPC](https://grpc.io/) qui combine [HTTP/2](https://en.wikipedia.org/wiki/HTTP/2) et [Protocol Buffer](https://developers.google.com/protocol-buffers) risque de détrôner les API REST/JSON pour les applications échangeant des volumes de données importants.

## Quelques remarques sur les API

### Une API HTTP s'accompagne souvent d'un client CLI

- L'exécutable `docker` est client de l'API docker (elle est exposée par défaut via une socket linux `/var/run/docker.sock` mais peut être exposée en HTTPS)
- L'exécutable `kubectl` est client de l'API Kubernetes

### Une API HTTP peut s'appuyer en coulisse sur une application CLI

La mise en oeuvre d'une fonctionnalité d'import de données en base via une API HTTP peut par exemple être traitée en coulisse par un appel à :

- [clamav](https://www.clamav.net/) pour contrôler l'absence de virus dans un téléversement d'une archive.
- `unzip`, `tar` ou `gunzip` pour décompresser l'archive.
- `ogr2ogr` de GDAL pour charger les données décompressées en base.

### Une application CLI peut produire des résultats formatés en JSON

Appeler une application en ligne de commande et devoir "parser" les résultats avec `awk` ou autres joyeusetés est pénible.

Toutefois, la vie devient plus douce quand l'**application en ligne de commande est capable de produire des résultats dans un format exploitable** tels CSV, JSON ou YAML.

A titre d'exemple, la [commande "ip"](https://www.linuxtricks.fr/wiki/la-commande-ip-reseau-interfaces-routage-table-arp) met à disposition une telle option. Il est donc possible de traiter la sortie avec [jq](https://stedolan.github.io/jq/) comme suit pour récupérer la liste des interfaces réseaux :

```bash
ip --json address | jq -r '.[].ifname'
```

Nous retrouvons ce même principe avec :

- L'option `--format=json|yaml` du client Kubernetes (`kubectl`)
- L'option `--format=json` du [scanner de vulnérabilité Trivy](https://trivy.dev/latest/)
- ...

### Une approche complète est possible

Pour une fonctionnalité, il est possible de mettre à disposition [une bibliothèque, une application en ligne de commande et une API WEB](./approche-complete/index.md)!

## Ressources

### Généralité

- [konghq.com - The API Mandate: How a mythical memo from Jeff Bezos changed software forever](https://konghq.com/blog/api-mandate)
- [cq94.medium.com (Christian Quest) - Les API c’est bien… en abuser ça craint !](https://cq94.medium.com/les-api-cest-bien-en-abuser-ca-craint-b5d1c92b32f2).
- [blog.octo.com - Pourquoi les Websockets ?](https://blog.octo.com/pourquoi-les-websockets/)
- [www.resolutesoftware.com - REST vs. GraphQL vs. gRPC vs. WebSocket](https://www.resolutesoftware.com/blog/rest-vs-graphql-vs-grpc-vs-websocket/)

### Catalogue d'API

- [github.com - public-apis](https://github.com/public-apis/public-apis#public-apis)
- [api.gouv.fr](https://api.gouv.fr/)

### Développement d'API REST/JSON

- [editor.swagger.io](https://editor.swagger.io/) pour **éditer des spécifications d'API au format OpenAPI**.
- [json-schema](https://json-schema.org/) pour la description des données.
- [swagger-ui](https://swagger.io/tools/swagger-ui/) pour de **générer une documentation interactive (HTML/JS)** à partir de ces spécifications.
- [github.com - yosriady/api-development-tools - HTTP API Development Tools](https://github.com/yosriady/api-development-tools#http-api-development-tools) pour plus d'outils...

### Sécuriser les API REST

- [blog.octo.com - Sécuriser une API REST : tout ce qu’il faut savoir](https://blog.octo.com/securiser-une-api-rest-tout-ce-quil-faut-savoir)
- [github.com - shieldfy/API-Security-Checklist](https://github.com/shieldfy/API-Security-Checklist#api-security-checklist)

### Pour les API CLI

- [clig.dev - Command Line Interface Guidelines](https://clig.dev/#foreword) donne d'autres **bonnes pratiques pour la construction d'application en ligne de commande** dont la mise à disposition d'une option `--json` pour spécifier le format de la sortie.
