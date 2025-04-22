---
tags:
    - Kubernetes
    - Distribution
---

# K3S

[k3s - Lightweight Kubernetes](https://k3s.io/) est une version légère de Kubernetess particulièrement adaptée pour les environnements de développement, les petites infrastructures et les petites machines (raspberry).

## Mise en garde

L'installation de K3S conduira à la création de nombreux réseaux virtuels (`ip link`). Il est vivement conseiller de l'installer dans une VM.

## Installation

c.f. [k3s - quick-start](https://rancher.com/docs/k3s/latest/en/quick-start/#install-script) :

```bash
# Sur server node
curl -sfL https://get.k3s.io | sh -
# Sur worker node (avec K3S_TOKEN dans /var/lib/rancher/k3s/server/node-token sur server node )
curl -sfL https://get.k3s.io | K3S_URL=https://myserver:6443 K3S_TOKEN=mynodetoken sh -
```

Il est possible d'ajouter des options :

```bash
# Sans traefik
curl -sfL https://get.k3s.io | sh -s - --without-traefik
# Avec docker
curl -sfL https://get.k3s.io | sh -s - --docker
```

## Principaux fichiers

| Fichier                               | Description                             |
| ------------------------------------- | --------------------------------------- |
| `/usr/local/bin/k3s`                  | Exécutable k3s                          |
| `/etc/systemd/system/k3s.service`     | Service `k3s server`                    |
| `/etc/systemd/system/k3s.service.env` | Configuration du service                |
| `/etc/rancher/k3s/k3s.yaml`           | Configuration du serveur (`KUBECONFIG`) |
| `/usr/local/bin/k3s-uninstall.sh`     | Désinstallation                         |

## Commandes utiles

| Commande                    | Description                      |
| --------------------------- | -------------------------------- |
| `sudo k3s kubectl get node` | Lister les noeuds du cluster K3S |

## Accès au cluster

c.f. [k3s - Cluster Access](https://rancher.com/docs/k3s/latest/en/cluster-access/) pour configurer kubectl et helm :

```bash
# configuration kubectl
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

# Tester avec kubectl
kubectl get pods --all-namespaces
```

## Ressources

* [k3s - Lightweight Kubernetes](https://k3s.io/)
* [www.grottedubarbu.fr - K3S on WSL2](https://www.grottedubarbu.fr/k3s-on-wsl2/)
