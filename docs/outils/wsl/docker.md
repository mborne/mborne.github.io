---
tags:
    - Windows
    - Docker
---

# WSL - utilisation de Docker sous Windows

> 🤖 Rédaction assistée par IA.

Cette fiche illustre l'installation de [Docker](../docker/index.md) Engine dans une instance [WSL](index.md), en alternative à Docker Desktop.

## Pré-requis

- [WSL2](index.md#installation)
- Une instance WSL avec `systemd` activé (voir [WSL - Configuration](index.md#configuration))

## Installation

En suivant [Docker - Installation](../docker/index.md#installation) :

```bash
wsl -d devbox
curl -sS https://mborne.github.io/outils/docker/install.sh | bash
sudo adduser $USER docker
```

## Utilisation

Les ports publiés sont accessibles depuis Windows sur `localhost` :

```bash
docker run --rm -p 8080:80 nginx
# puis ouvrir http://localhost:8080 côté Windows
```
