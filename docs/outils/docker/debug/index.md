# Docker - résoudre les problèmes fréquents

Quelques notes pour aider à résoudre les problèmes classiques.

## Utilisation d'un proxy sortant

Si vous devez utiliser un proxy pour accéder à internet (ex : `http://proxy:3128`), vous rencontrerez sûrement des problèmes avec :

* La commande `docker pull`
* Les commandes `RUN apt-get update && apt-get install` dans vos `Dockerfile`
* L'accès aux ressources internet depuis vos conteneurs.

Voir [Travailler derrière un proxy avec Docker](https://mborne.github.io/fiches/proxy-sortant/proxy-docker/).

## Utilisation d'un serveur DNS particulier

Si docker ne parvient pas à résoudre des noms de domaine, il est fort probable que ce soit un problème de configuration DNS :

* Adaptez en ajoutant ce qui suit dans `/etc/docker/daemon.json` :

```json
{
   "dns": ["8.8.8.8","8.8.4.4"]
}
```

* Redémarrer le démon docker (`sudo service docker restart`)

## Utilisation d'un dépôt d'image en HTTP

Si vous avez un dépôt d'images privé qui n'utilise pas https (ex : http://localhost:5000 démarré avec [registry:2](https://hub.docker.com/_/registry)), docker refusera de puller les images :

* Déclarer ce dépôt dans `/etc/docker/daemon.json` :

```json
{
   "insecure-registry":["localhost:5000"]
}
```

* Redémarrer le démon docker (`sudo service docker restart`)

