# Les conteneurs

## Contexte

Les conteneurs sont devenus le livrable de référence des applications et la brique de base des offres CaaS. Cette fiche vient en complément des cours [DevOps avec des conteneurs](https://mborne.github.io/cours-devops/conteneurs.html) et [DevOps avec Kubernetes](https://mborne.github.io/cours-devops/kubernetes.html) qui :

- Présentent l'image comme un livrable universel construit *as code* (Dockerfile) et identique en DEV et en PROD.
- Mettent en évidence les limites de Docker à l'échelle de plusieurs machines (réseau, démons indépendants, scalabilité verticale uniquement) qui sont résolues par Kubernetes.
- Présentent Kubernetes comme un standard pour la zone d'hébergement (*landing zone*) permettant un partage fin des responsabilités, par exemple entre *platform teams* (PlatDev/PlatOps) et *feature teams* (AppDev/AppOps).

## Les outils

* [Docker](../../outils/docker/index.md)
* [Docker Compose](../../outils/docker/docker-compose.md) : description d'une pile de conteneurs
* [Kubernetes](../../outils/kubernetes/index.md)
* [kubectl](../../outils/kubectl/index.md) : gestion d'un cluster Kubernetes
* [Helm](../../outils/helm/index.md) : déploiement d'applications sur Kubernetes
* [K3S](../../outils/k3s/index.md) : distribution Kubernetes légère
* [Kind](../../outils/kind/index.md) : cluster Kubernetes dans des conteneurs Docker
* [Trivy](../../outils/trivy/index.md) : analyse de vulnérabilités des images
* [Syft](../../outils/syft/index.md) : génération de SBOM (inventaire des dépendances) des images
* [Grype](../../outils/grype/index.md) : analyse de vulnérabilités des images et des SBOM
* [Cosign](../../outils/cosign/index.md) : signature et vérification des images et des attestations (SBOM)
* [Kubescape](../../outils/kubescape/index.md) : analyse de la sécurité d'un cluster Kubernetes
