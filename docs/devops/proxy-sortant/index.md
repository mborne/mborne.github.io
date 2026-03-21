---
tags:
    - DevOps
    - Service technique
    - Proxy Sortant
search:
    boost: 1.5
---

# Le proxy sortant

Un **proxy sortant** sert d'**intermédiaire pour le traffic sortant** d'une infrastructure.

## Cas d'utilisation

L'utilisation d'un proxy sortant sera fréquente pour :

- **Mettre en place un filtrage des accès à internet** depuis le réseau d'une entreprise, d'une école ou d'un hébergement sécurisé.
- **Tracer les accès à internet**.
- **Maîtriser la consommation de bande passante sortante**.
- Mettre en cache les téléchargements.

## Points clés

### Deux approches possibles pour le filtrage

* **Filtrage en liste blanche** : Seuls les sites autorisés sont accessibles.
* **Filtrage en liste noire** : Seuls les sites interdits sont bloqués.

### Un proxy permet un contrôle plus fin qu'un pare-feu

Avec certains pare-feux, il est possible de réaliser un filtrage par FQDN (nom de domaine). Toutefois, le filtrage au niveau d'un pare-feux reste un filtrage par IP (ex : autoriser l'accès à https://ignf.github.io sans autoriser l'accès à https://mborne.github.io sera délicat).

### Le support des fichiers d'auto-configuration est limité

Les systèmes et navigateurs sont généralement configurés à l'aide d'un fichier `proxy.pac` qui est un script JavaScript indiquant s'il faut utiliser un proxy pour accéder à une ressource en fonction du nom de domaine ou de l'IP (voir [wikipedia.org - Fichier .PAC](https://fr.wikipedia.org/wiki/Fichier_.PAC)).

L'utilisation d'un proxy est donc généralement transparente pour surfer sur un intranet ou internet. Toutefois, de nombreux outils en ligne de commande (`curl`, `vagrant`, `terraform`, `ansible`, `docker`...) et bibliothèques de programmation réalisant des requêtes HTTP ne savent pas exploiter ce script `proxy.pac`...

## Configurer l'utilisation d'un proxy

En fonction des cas, les fiches suivantes pourront vous aider à travailler derrière un proxy :

* [Configurer l'utilisation du proxy à l'aide de variables d'environnement](proxy-env-vars.md) qui couvrira de nombreux cas (curl, ansible, vagrant, terraform...)
* [Travailler derrière un proxy avec Docker](proxy-docker.md) qui traite le téléchargement, la construction et l'utilisation d'image en présence d'un proxy.

## Supporter l'utilisation d'un proxy

Pour permettre l'exécution d'une application en environnement sécurisé, il est recommandé de s'appuyer sur les variables d'environnement suivantes :

| Nom         | Exemple                 |
| ----------- | ----------------------- |
| HTTP_PROXY  | `"http://proxy:3128/"`  |
| HTTPS_PROXY | `"http://proxy:3128/"`  |
| NO_PROXY    | `"localhost,127.0.0.1"` |

## Ressources

* [codes.gouv.fr - Socle Interministériel des Logiciels Libres - Squid](https://code.gouv.fr/sill/detail?name=Squid)
* [doc.ubuntu-fr.org - squid](https://doc.ubuntu-fr.org/squid)

