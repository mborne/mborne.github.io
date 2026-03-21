---
tags:
    - Outil
    - Kubernetes
    - Distribution
search:
    boost: 2
---

# Kind

[Kubernetes in docker (kind)](https://kind.sigs.k8s.io/) permet d'installer un cluster de développement où les noeuds sont des conteneurs docker.

## Installation

* Le script [kind/install.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/kind/install.sh) reprend la méthode [Installing From Release Binaries](https://kind.sigs.k8s.io/docs/user/quick-start/#installing-from-release-binaries) pour Linux :

```bash
curl -sS https://mborne.github.io/outils/kind/install.sh | bash
```

## Utilisation

* [kind.sigs.k8s.io - Quick Start](https://kind.sigs.k8s.io/docs/user/quick-start/)
* [mborne/docker-devbox - kind/quickstart.sh](https://github.com/mborne/docker-devbox/tree/master/kind#readme)

## Ressources

* [kind.sigs.k8s.io - Setting Up An Ingress Controller](https://kind.sigs.k8s.io/docs/user/ingress/#setting-up-an-ingress-controller)
* [kind.sigs.k8s.io - Installing MetalLB using default manifests](https://kind.sigs.k8s.io/docs/user/loadbalancer/#installing-metallb-using-default-manifests)
