---
tags:
    - Windows
    - Kubernetes
---

# WSL - utilisation de Kubernetes (K3S)

> 🤖 Rédaction assistée par IA.

Cette fiche illustre l'installation de [K3S](../k3s/index.md) dans une instance [WSL](index.md) dédiée.

> ⚠️ K3S crée de nombreuses interfaces réseau qui seront visibles depuis toutes les instances WSL (voir [WSL - Isolation partielle entre instances WSL](index.md#isolation-partielle-entre-instances-wsl)) : privilégier une instance dédiée et éviter de l'utiliser en parallèle de Docker.

## Pré-requis

- [WSL2](index.md#installation)
- `systemd` activé dans l'instance (voir [WSL - Configuration](index.md#configuration))

## Création de l'instance

```bash
wsl --install Ubuntu-24.04 --name k3s --location C:\WSL\k3s
```

## Installation de K3S

Avec la méthode officielle (voir [K3S - Installation](../k3s/index.md#installation)) :

```bash
wsl -d k3s -- sh -c 'curl -sfL https://get.k3s.io | sh -'
wsl -d k3s -- sudo kubectl get nodes
```

## Suppression de l'instance

```bash
wsl --terminate k3s
wsl --unregister k3s
```

## Ressources

- [www.grottedubarbu.fr - K3S on WSL2](https://www.grottedubarbu.fr/k3s-on-wsl2/)
