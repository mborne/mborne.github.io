---
tags:
    - Docker
    - Principes
    - Installation
    - Ressources
search:
    boost: 5
---

# Docker

## Points clés

* Docker s'appuie sur les [technologies d'isolation linux (namespaces, cgroups,...) pour apporter des mécanismes de virtualisation](https://www.lemagit.fr/conseil/Conteneurs-Linux-et-Conteneurs-Docker-quelles-differences).
* Les conteneurs démarrent plus rapidement que les VM car **démarrer un conteneur = démarrer un processus isolé**. Ainsi :
    * Il n'est pas nécessaire de démarrer un OS complet pour chaque application.
    * Il n'est pas nécessaire d'allouer de la RAM ou des CPU pour chacun (les conteneurs partagent les ressources de l'hôte)
* Docker amène des concepts et des outils qui facilitent le déploiement des applications en offrant un **cadre générique pour l'empaquetage des applications** (**image docker = livrable universel**)
* Docker s'appuie sur une **API mise à disposition par le démon docker**.
* La **construction et le téléchargement** des images sont optimisés par la mise en cache au niveau des **couches de l'image**.
* Docker amène un **cadre pour l'observabilité** avec la gestion des **journaux applicatifs** et la collecte de **métriques systèmes**.
* Pour travailler avec plusieurs machines, il faut s'intéresser par exemple à Swarm ou Kubernetes.

## Les principaux concepts

* [Les images](concepts/image.md)
* [Les conteneurs](concepts/conteneur.md)
* [Les volumes](concepts/volume.md)
* [Les réseaux](concepts/network.md)

## Les principaux exécutables

| Nom                                                                 | Fonction                                                                                                                                |
| ------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| [docker](https://docs.docker.com/engine/reference/commandline/cli/) | Client en ligne de commande de l'API pour la gestion des objets docker                                                                  |
| [docker compose](docker-compose.md)                                 | Plugin permettant de définir et démarrer une stack applicative complète (services, volumes,...) en YAML (fichier `docker-compose.yaml`) |

## Installation

!!!warning "Mise en garde"
    - **Ne pas utiliser les scripts d'installation ci-dessous en entreprise**
    - **Le démon n'est pas configuré automatiquement** (voir [Docker - la configuration du démon](configuration/index.md))
    - La présence d'un pare-feu et d'un proxy demandera un peu de configuration (voir [Docker - résoudre les problèmes fréquents](debug/index.md))

Pour l'**installation de base** :

* [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
* [docker/install.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/docker/install.sh)

```bash
curl -sS https://mborne.github.io/outils/docker/install.sh | bash
```

Pour **tester l'installation** :

```bash
sudo docker run --rm hello-world
```

Pour **exécuter docker sans sudo**, il suffit d'**appartenir au groupe docker** :

```bash
sudo adduser $USER docker
# puis ouvrir d'une nouvelle session
```

Pour **ajouter le support GPU**, voir [cuda-toolkit - Utilisation avec docker](../cuda-toolkit/README.md#utilisation-avec-docker) et tester comme suit :

```bash
sudo docker run --gpus all nvcr.io/nvidia/k8s/cuda-sample:nbody nbody -gpu -benchmark
```


## Utilisation

Pour débuter avec docker :

- [mborne.github.io - DevOps avec des conteneurs](https://mborne.github.io/cours-devops/#2) pour un cours d'introduction à Docker et une découverte sur la base d'exemples d'utilisation ( [github.com - mborne/docker-exemples](https://github.com/mborne/docker-exemples#readme) )
- [Cours docker (Cédric ESNAULT)](https://cedric-esnault-ign.github.io/cours_docker/public/#/) pour le niveau 2 (suivant le précédent à l'IGN)
- [container.training - Introduction to Containers](https://container.training/intro-selfpaced.yml.html#1) pour la version longue (~900 slides).

Pour l'utiliser en production :

- [Docker - la configuration du démon](configuration/index.md)
- [Docker - Les bonnes pratiques](bonnes-pratiques/index.md)


## Alternatives

* [www.lemagit.fr - Conteneurs Linux et Conteneurs Docker : quelle(s) différence(s) ?](https://www.lemagit.fr/conseil/Conteneurs-Linux-et-Conteneurs-Docker-quelles-differences)
* [phoenixnap.com - Docker vs containerd vs CRI-O: An In-Depth Comparison](https://phoenixnap.com/kb/docker-vs-containerd-vs-cri-o) présente des **alternatives à docker pour l'exécution de conteneurs** ainsi que la relation entre docker et containerd.
* [Podman](https://podman.io/) est l'une de ces **alternatives à docker** (mise en avant par exemple dans la certification CKAD pour Kubernetes).

## Ressources

La documentation officielle :

* [docs.docker.com - CLI reference](https://docs.docker.com/reference/cli/docker/) pour la documentation officielle avec une **vue d'ensemble des commandes**.
* [docs.docker.com - CLI Cheat Sheet](https://docs.docker.com/get-started/docker_cheatsheet.pdf) pour un résumé des **principales commandes**.
* [docs.docker.com - Dockerfile reference](https://docs.docker.com/engine/reference/builder/) pour une **vue d'ensemble des commandes disponibles pour écrire un Dockerfile**.

Pour une installation avec Ansible :

* [galaxy.ansible.com - geerlingguy.docker](https://galaxy.ansible.com/ui/standalone/roles/geerlingguy/docker/documentation/)
* [github.com - mborne/ansible-docker-ce](https://github.com/mborne/ansible-docker-ce)

L'API de docker :

* [docs.docker.com - Develop with Docker Engine API](https://docs.docker.com/engine/api/)
  * [docs.docker.com - Docker Engine API (1.45)](https://docs.docker.com/engine/api/v1.45/#tag/Container) pour les **spécifications OpenAPI**.
  * [www.docker.com - How to deploy on remote Docker hosts with docker-compose](https://www.docker.com/blog/how-to-deploy-on-remote-docker-hosts-with-docker-compose/) qui aborde `DOCKER_HOST` (par défaut `/var/run/docker.sock`) et [Docker Context](https://docs.docker.com/engine/context/working-with-contexts/) pour **se connecter à l'API docker sur un hôte distant**.
