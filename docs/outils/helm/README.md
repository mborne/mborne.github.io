# Helm

[Helm](https://helm.sh/) se présente comme *the package manager for Kubernetes*.

## Principe de fonctionnement

* [Helm](https://helm.sh/) génère et applique les manifests au format YAML
* Le langage de templating est [Go templating language](https://pkg.go.dev/text/template)

## Installation

* [helm.sh - Installing Helm - From Script](https://helm.sh/docs/intro/install/#from-script)
* [helm.sh - Installing Helm - From Apt (Debian/Ubuntu)](https://helm.sh/docs/intro/install/#from-apt-debianubuntu)
* [helm/install.sh](install.sh) reprend la méthode ci-dessus :

```bash
curl -sS https://mborne.github.io/outils/helm/install.sh | bash
```

## Quelques dépôts

| NAME       | URL                                                                    |
| ---------- | ---------------------------------------------------------------------- |
| bitnami    | [https://charts.bitnami.com/bitnami/](https://bitnami.com/stacks/helm) |
| hashicorp  | <https://helm.releases.hashicorp.com>                                    |
| jenkins    | <https://charts.jenkins.io>                                              |
| opensearch | <https://opensearch-project.github.io/helm-charts/>                      |
| traefik    | <https://helm.traefik.io/traefik>                                        |

> Voir aussi [artifacthub.io](https://artifacthub.io/)

## Utilisation

### Gestion des dépôts

```bash
# Add bitnami's repository
helm repo add bitnami https://charts.bitnami.com/bitnami
# Update repositories
helm repo update
# List repositories
helm repo list
# Find charts in a given repository
helm search repo bitnami
# Find charts versions
helm search repo bitnami/nginx-ingress-controller -l
```

### Déployer avec Helm

#### nginx-ingress-controller

```bash
# Show default values
helm show values bitnami/nginx-ingress-controller

# Preview generated YAML's
helm -n ingress-nginx template nginx bitnami/nginx-ingress-controller \
    --set metrics.enabled=true

# Install or upgrade a release in a given namespace
helm -n ingress-nginx upgrade --install \
    nginx bitnami/nginx-ingress-controller \
    -v my-values.yaml
    --set metrics.enabled=true

# List releases
helm -n ingress-nginx list

# Uninstall
helm -n ingress-nginx delete nginx
```

#### Jenkins

```bash
# Ajout du dépôt jenkins
helm repo add jenkins https://charts.jenkins.io
# Mise à jour des dépôts
helm repo update
# Création d'un namespace d'accueil
kubectl create namespace jenkins-system
# Installation ou mise à jour
helm --namespace=jenkins-system upgrade --install jenkins jenkins/jenkins
```

#### PostgreSQL

```bash
# Ajout du dépot bitnami
helm repo add bitnami https://charts.bitnami.com/bitnami
# Mise à jour des dépôts
helm repo update
# Création d'un namespace d'accueil pg
kubectl create namespace pg
# Installation ou mise à jour
POSTGRESQL_PASSWORD=ChangeIt
helm --namespace=pg upgrade --install postgresql bitnami/postgresql  --set global.postgresql.auth.postgresPassword=$POSTGRESQL_PASSWORD
# Contrôler l'état
kubectl -n pg get sts,svc,pods
# Suivre les instructions pour se connecter :
kubectl port-forward --namespace pg svc/postgresql 15432:5432 &
psql --host 127.0.0.1 -U postgres -d postgres -p 15432 -W
```

Voir :

* [PostgreSQL packaged by Bitnami](https://github.com/bitnami/charts/tree/main/bitnami/postgresql#readme)
* [bitnami/postgresql/values.yaml](https://github.com/bitnami/charts/blob/main/bitnami/postgresql/values.yaml)

### Création d'un chart

La commande `helm create whoami` génère un modèle de chart pour le déploiement d'une application (nginx) qu'il sera possible d'adapter pour sa propre application.

Pour vos premiers pas, noter que :

* Les variables d'environnement sont toujours des strings (il faudra les échapper comme suit `{{ .Values.database.port | quote }}`)
* Les variables `global` sont accessibles depuis tous les sous charts

## Resources

* [helm.sh - Installing Helm](https://helm.sh/docs/intro/install/)
* [helm.sh - Quickstart](https://helm.sh/docs/intro/quickstart/)
* [artifacthub.io - Find, install and publish Kubernetes packages](https://artifacthub.io/)
* [helm.sh - The Chart Best Practices Guide](https://helm.sh/docs/chart_best_practices/)
* [hub.docker.com - alpine/helm](https://hub.docker.com/r/alpine/helm)
* [github.com - mborne/docker-devbox](https://github.com/mborne/docker-devbox#readme) où de nombreux scripts `k8s-install.sh` s'appuient sur des déploiements Helm.
* [github.com - mborne/helm-charts](https://github.com/mborne/helm-charts#helm-charts) : quelques charts helm développer pour comprendre les mécanismes de publication sous forme d'image docker avec GitHub Container Registry (ex : `oci://ghcr.io/mborne/helm-charts/postgres-dev`)
* [blog.stephane-robert.info - Introduction à Helm](https://blog.stephane-robert.info/docs/conteneurs/orchestrateurs/outils/helm/)
