---
tags:
    - Docker
    - Configuration
    - Sécurité
search:
    boost: 1.5
---

# Docker - la configuration du démon

Cette fiche décrit le principe de configuration du démon docker en fournissant un exemple de configuration couvrant plusieurs points explicités par la suite.

## Points clés

- Le démon est configuré à l'aide d'un fichier JSON : `/etc/docker/daemon.json`
- En cas de changement sur ce fichier, il faut redémarrer docker comme suit :

```bash
sudo systemctl daemon-reload
sudo systemctl restart docker
```

## Exemple de configuration

Quelques options dans  `/etc/docker/daemon.json` :

```json
{
    "data-root": "/var/lib/docker",
    "storage-driver": "overlay2",

    "userns-remap": "default",

    "registry-mirrors": ["https://mirror.gcr.io"],

    "dns": ["1.1.1.1", "1.0.0.1"],
    "bip": "192.168.100.1/24",
    "fixed-cidr": "192.168.100.1/29",
    "default-address-pools": [
        {"base":"172.80.0.0/16","size":24},
        {"base":"172.90.0.0/16","size":24}
    ],

    "icc": false,
    "live-restore": true,
    "userland-proxy": false,
    "no-new-privileges": true,

    "debug": false,

    "log-driver": "journald"
}
```

## Explications

### Configuration du stockage

Les options suivantes reprennent les valeurs par défaut pour :

- "data-root" : Le dossier de stockage des données de docker (faire `sudo find /var/lib/docker` pour mieux comprendre).
- [storage-driver](https://docs.docker.com/reference/cli/dockerd/#daemon-storage-driver) : Le pilote implémentant le système de fichier par couche.

### Configuration du réseau

Les options suivantes permettent de configurer le réseau, par exemple pour **utiliser des DNS spécifiques** ou **éviter des conflits d'adresse IP** :

```json
{
    "dns": ["1.1.1.1", "1.0.0.1"],
    "bip": "192.168.100.1/24",
    "fixed-cidr": "192.168.100.1/29",
    "default-address-pools": [
        {"base":"172.80.0.0/16","size":24},
        {"base":"172.90.0.0/16","size":24}
    ],
}
```

- ["dns"](https://docs.docker.com/reference/cli/dockerd/#daemon-dns-options) configure les serveurs DNS utilisé par le démon docker (attention : les conteneurs utilisent un serveur DNS à docker)
- "bip" permet de configurer la plage IP utilisée par le bridge par défaut (`ip address show docker0`)
- "fixed-cidr" permet de réserver des IP pour une affectation statique d'IP à certains conteneurs
- "default-address-pools" permet de spécifier les plages IP utilisées pour les réseaux docker.



### Utilisation d'utilisateur dédié à docker

L'option suivante est utilisée pour faire correspondre les utilisateurs des conteneurs (root et et les autres) à un utilisateur ne disposant pas de privilège au niveau du système :

```json
{
    "userns-remap": "default"
}
```

Avec "default", un utilisateur et un groupe "dockerremap" sera géré par docker (vous le retrouverez dans `/etc/subuid` et `/etc/subgid`). Il est toutefois possible d'utiliser un utilisateur de son choix (voir [docs.docker.com - Isolate containers with a user namespace](https://docs.docker.com/engine/security/userns-remap/))

!!!info "Remarques"
    - Avec cette option, un sous-dossier de `/var/lib/docker` sera utilisé pour le stockage des données (vous aurez l'impression de tout perdre si vous l'activez)
    - Cette option peut être désactiver localement (`--user-ns=host`) pour les seuls conteneurs ayant besoin de permissions (ex : accès à l'API Docker via `/var/run/docker.sock`).


### Utilisation d'un miroir pour l'accès à DockerHub

!!!warning "IMPORTANT"
    - Pour éviter d'atteindre la [limite du pull sur DockerHub](https://docs.docker.com/docker-hub/download-rate-limit/), il faut configurer l'utilisation d'un mirroir levant cette limite.

L'extrait ci-après permet d'utiliser <https://mirror.gcr.io> qui est le proxy d'accès à DockerHub de Google (*gcr.io = Google Container Registry*) :

```json
{
    "registry-mirrors": ["https://mirror.gcr.io"]
}
```

En alternative, vous pouvez :

- Déployer votre propre instance [registry:2](https://hub.docker.com/_/registry/tags) en proxy/cache sur DockerHub (voir [docs.docker.com - Run a Registry as a pull-through cache](https://docs.docker.com/docker-hub/image-library/mirror/#run-a-registry-as-a-pull-through-cache))
- Configurer un dépôt de type proxy au niveau d'un gestionnaire d'artefact (Nexus, Harbor,...)


### Configuration des logs

Par défaut, les logs des conteneurs sont stockés sous forme de fichiers. L'option suivante permet de sur journald :

```json
{
    "log-driver": "journald"
}
```


!!!info "Remarques"
    - Une telle approche peut **faciliter l'intégration des journaux des conteneurs dans un puits de logs** et d'**éviter la mise en oeuvre d'un mécanisme de rotation des logs spécifiques aux conteneurs**.
    - Voir [docs.docker.com - Configure logging drivers](https://docs.docker.com/config/containers/logging/configure/) pour les autres options disponibles.


## Ressources

Documentation officielle :

- [docs.docker.com - Docker daemon configuration overview](https://docs.docker.com/engine/daemon/)
- [docs.docker.com - Daemon CLI (dockerd)](https://docs.docker.com/reference/cli/dockerd/) détaille l'ensemble des options :
    - [docs.docker.com - Configure logging drivers](https://docs.docker.com/config/containers/logging/configure/)
    - [docs.docker.com - Mirror the Docker Hub library](https://docs.docker.com/docker-hub/image-library/mirror/)
      - [docs.docker.com - Run a Registry as a pull-through cache](https://docs.docker.com/docker-hub/image-library/mirror/#run-a-registry-as-a-pull-through-cache)


Recommandation de sécurité :

- [github.com - docker/docker-bench-security](https://github.com/docker/docker-bench-security#docker-bench-for-security) pour sécuriser l'installation.

