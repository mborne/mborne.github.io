# kubectl - gestion d'un cluster kubernetes

## Installation

```bash
bash kubectl/install.sh
```

## Utilisation

Voir [github.com - mborne/k8s-exemples](https://github.com/mborne/k8s-exemples?tab=readme-ov-file#k8s-exemples)

## Quelques astuces

### Activer l'autocomplétion et configurer des raccourcis en bash

Voir [kubernetes.io - kubectl Quick Reference](https://kubernetes.io/docs/reference/kubectl/quick-reference/)

### Configurer nano pour indenter facilement

Pour `kubectl edit` avec `EDITOR=nano`, définir `.nanorc` comme suit permet d'utiliser TAB et SHIFT+TAB sur plusieurs lignes :

```bash
set tabstospaces true
set tabsize 2
```

## Ressources

* [kubernetes.io - kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
* [kubernetes.io - GETTING STARTED](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands)
* [kubernetes.io - Installer et configurer kubectl](https://kubernetes.io/fr/docs/tasks/tools/install-kubectl/)

OIDC avec [kubelogin](https://github.com/int128/kubelogin?tab=readme-ov-file#kubelogin--) :

* [developer.okta.com - How to Secure Your Kubernetes Cluster with OpenID Connect and RBAC](https://developer.okta.com/blog/2021/11/08/k8s-api-server-oidc)
