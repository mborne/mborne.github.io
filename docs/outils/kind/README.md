# Kind

[Kubernetes in docker (kind)](https://kind.sigs.k8s.io/) permet d'installer un cluster de développement où les noeuds sont des conteneurs docker.

## Installation

* Le script [kind/install.sh](install.sh) reprend la méthode [Installing From Release Binaries](https://kind.sigs.k8s.io/docs/user/quick-start/#installing-from-release-binaries) pour Linux :

```bash
curl -sS https://mborne.github.io/outils/kind/install.sh | bash
```

## Ressources

* [kind.sigs.k8s.io - Quick Start](https://kind.sigs.k8s.io/docs/user/quick-start/)
* [kind.sigs.k8s.io - Setting Up An Ingress Controller](https://kind.sigs.k8s.io/docs/user/ingress/#setting-up-an-ingress-controller)
    * [config/ingress-ready.yaml](config/ingress-ready.yaml)
    * [traefik - Usage with Kind](../traefik/README.md#usage-with-kind)
    * [nginx-ingress-controller - Usage with Kind](../nginx-ingress-controller/README.md#usage-with-kind)
* [kind.sigs.k8s.io - Installing MetalLB using default manifests](https://kind.sigs.k8s.io/docs/user/loadbalancer/#installing-metallb-using-default-manifests)
  * See [metallb-install.sh](metallb-install.sh) where a ".0/24" subnet is required for kind
* [github.com - mborne/docker-devbox - kind](https://github.com/mborne/docker-devbox/tree/master/kind#readme) (qu'il faudra que je rappatrie ici)
