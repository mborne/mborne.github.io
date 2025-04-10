# Docker

> **Ne pas utiliser à l'IGN**

## Installation

[docker/install.sh](install.sh) assure l'installation de base :

```bash
# Installation
sudo bash docker/install.sh

# Test
sudo docker run --rm hello-world

# pour exécuter docker sans sudo
# (après ouverture d'une nouvelle session)
sudo adduser $USER docker
```

## Configuration du démon

> **ATTENTION** : L'accès à <https://docker-mirror.quadtreeworld.net> est filtré par IP . Remplacez par votre propre instance [registry:2](https://hub.docker.com/_/registry/tags) pour éviter d'atteindre la [limite du pull sur DockerHub](https://docs.docker.com/docker-hub/download-rate-limit/) avec une mise en cache.

Quelques options dans  `/etc/docker/daemon.json` :

```json
{
    "data-root": "/var/lib/docker",
    "storage-driver": "overlay2",

    "userns-remap": "default",

    "registry-mirrors": ["https://docker-mirror.quadtreeworld.net"],

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

Pour appliquer :

```bash
sudo systemctl daemon-reload
sudo systemctl restart docker
```

## Ajout du support GpU

Voir [cuda-toolkit - Utilisation avec docker](../README.md#utilisation-avec-docker) pour activer l'utilisation du GPU :

```bash
sudo docker run --gpus all nvcr.io/nvidia/k8s/cuda-sample:nbody nbody -gpu -benchmark
```

## Ressources

* [github.com - docker/docker-bench-security](https://github.com/docker/docker-bench-security#docker-bench-for-security) pour sécuriser l'installation.
* [github.com - mborne/ansible-docker-ce](https://github.com/mborne/ansible-docker-ce) pour une **installation avec ansible** offrant plus d'options que [install.sh](install.sh)
* [docs.nvidia.com - Installing the NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#installing-the-nvidia-container-toolkit)
* [medium.com - Building Multi-Architecture Docker Images With Buildx](https://medium.com/@artur.klauser/building-multi-architecture-docker-images-with-buildx-27d80f7e2408) (construire des images pour X86 pour et ARM pour Raspberry PI)
