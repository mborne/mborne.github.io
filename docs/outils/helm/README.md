---
tags:
    - Outil
    - Déploiement
    - Kubernetes
    - Client
search:
    boost: 2
---

# Helm

[Helm](https://helm.sh/) se présente comme *the package manager for Kubernetes*.

## Principe de fonctionnement

* [Helm](https://helm.sh/) génère et applique les manifests au format YAML
* Le langage de templating est [Go templating language](https://pkg.go.dev/text/template)

## Installation

* [helm.sh - Installing Helm - From Script](https://helm.sh/docs/intro/install/#from-script)
* [helm.sh - Installing Helm - From Apt (Debian/Ubuntu)](https://helm.sh/docs/intro/install/#from-apt-debianubuntu)
* [helm/install.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/helm/install.sh) reprend la méthode "From Script" ci-dessus :

```bash
curl -sS https://mborne.github.io/outils/helm/install.sh | bash
```

## Quelques dépôts

!!!warning "Bitnami est devenu payant"
    Voir [Upcoming changes to the Bitnami catalog (effective August 28th, 2025)](https://github.com/bitnami/charts/issues/35164)

| NAME       | URL                                                                    |
| ---------- | ---------------------------------------------------------------------- |
| bitnami    | [https://charts.bitnami.com/bitnami/](https://bitnami.com/stacks/helm) |
| jenkins    | <https://charts.jenkins.io>                                              |
| opensearch | <https://opensearch-project.github.io/helm-charts/>                      |
| traefik    | <https://helm.traefik.io/traefik>                                        |

Voir aussi [artifacthub.io](https://artifacthub.io/)

## Utilisation

### Gestion des dépôts

```bash
# Ajout du dépôt jenkins
helm repo add jenkins https://charts.jenkins.io
# Mise à jour des dépôts
helm repo update
# Affichage de liste des dépôts
helm repo list
# Recherche d'un chart
helm search repo jenkins
# Recherche des versions disponibles
helm search repo jenkins/jenkins -l
```

### Déploiement avec Helm

Par exemple, pour le déploiement de Jenkins à l'aide de [Jenkins Helm Charts](https://github.com/jenkinsci/helm-charts?tab=readme-ov-file#jenkins-helm-charts) :

```bash
# Ajout du dépôt jenkins
helm repo add jenkins https://charts.jenkins.io
# Mise à jour des dépôts
helm repo update
# Création d'un namespace d'accueil
kubectl create namespace jenkins-system
# Installation ou mise à jour
helm -n jenkins-system upgrade --install jenkins jenkins/jenkins
```

### Création d'un chart

La commande `helm create whoami` génère un modèle de chart pour le déploiement d'une application (nginx) qu'il sera possible d'adapter pour sa propre application.

Pour vos premiers pas, noter que :

* Les variables d'environnement sont toujours des strings (il faudra les échapper comme suit `{{ .Values.database.port | quote }}`)
* Les variables `global` sont accessibles depuis tous les sous charts

### Utilisation dans un conteneur

Les images suivantes intègrent l'exécutable helm :

* [hub.docker.com - alpine/helm](https://hub.docker.com/r/alpine/helm)
* [hub.docker.com - alpine/k8s](https://hub.docker.com/r/alpine/k8s)

Elles sont utiles pour exécuter des déploiements helm avec GitLab-CI avec des runners docker.

## Expérimentations

Mon terrain de jeu pour Docker et [Kubernetes](../kubernetes/index.md) :

* [mborne/docker-devbox](https://github.com/mborne/docker-devbox) permet de configurer un environnement de développement avec Docker ou Kubernetes où de nombreux scripts `k8s-install.sh` s'appuient sur des déploiements Helm.

Quelques exemples de chart helm :

* [mborne/helm-charts](https://github.com/mborne/helm-charts) contient quelques **charts helm** rédigés pour **tester la publication sous forme d'image (OCI)**
* [mborne/crash-test](https://github.com/mborne/crash-test) intègre un chart Helm publié sous [forme d'une image (`oci://ghcr.io/mborne/helm-charts/crash-test`)](https://github.com/mborne/crash-test/pkgs/container/helm-charts%2Fcrash-test) à l'aide de GitHub actions (voir [.github/workflows/helm-publish.yml](https://github.com/mborne/crash-test/blob/master/.github/workflows/helm-publish.yml)).

## Resources

* [helm.sh - Installing Helm](https://helm.sh/docs/intro/install/)
* [helm.sh - Quickstart](https://helm.sh/docs/intro/quickstart/)
* [artifacthub.io - Find, install and publish Kubernetes packages](https://artifacthub.io/)
* [helm.sh - The Chart Best Practices Guide](https://helm.sh/docs/chart_best_practices/)
* [blog.stephane-robert.info - Introduction à Helm](https://blog.stephane-robert.info/docs/conteneurs/orchestrateurs/outils/helm/)
