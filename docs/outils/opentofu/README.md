# OpenTofu

[OpenTofu](https://opentofu.org/) est un fork OpenSource de [Terraform](../terraform/README.md) créé par la communauté suite à un changement de licence.

## Points clés

* OpenTofu supporte de nombreux [fournisseurs (providers)](https://registry.terraform.io/browse/providers) correspondant aux systèmes cibles (AWS, Azure, GCP, Kubernetes...)
* OpenTofu permet de gérer **as code** des [ressources](https://opentofu.org/docs/language/resources/) à l'aide d'un [langage spécifique](https://opentofu.org/docs/language/).
* OpenTofu conserve une trace des [ressources](https://opentofu.org/docs/language/resources/) créées dans un [état (*state*)](https://opentofu.org/docs/language/state/) pour lequel il convient de choisir avec soin une [solution de stockage de cet état (*backend*)](#stockage-de-létat).

## Installation

* [opentofu.org - Installing OpenTofu](https://opentofu.org/docs/intro/install/)
* [opentofu/install.sh](install.sh) assure l'[installation à l'aide du dépôt pour Ubuntu et Debian](https://opentofu.org/docs/intro/install/deb/#step-by-step-instructions) :

```bash
curl -sS https://mborne.github.io/outils/install.sh | bash
```

## Principales commandes

| Commande                                                               | Description                                                            |
| ---------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| [terraform init](https://opentofu.org/docs/cli/commands/init/)         | Préparation du répertoire de travail (téléchargement des modules & co) |
| [terraform validate](https://opentofu.org/docs/cli/commands/validate/) | Contrôle du fichier de configuration                                   |
| [terraform plan](https://opentofu.org/docs/cli/commands/plan/)         | Visualisation des changements à appliquer sur l'infrastructure         |
| [terraform apply](https://opentofu.org/docs/cli/commands/apply/)       | Création ou modification de l'infrastructure                           |
| [terraform destroy](https://opentofu.org/docs/cli/commands/destroy/)   | Destruction des ressources créées                                        |

## Quelques fournisseurs

### Les principaux clouders

* [AWS d'Amazon](https://search.opentofu.org/provider/hashicorp/aws/latest)
* [Azure de Microsoft](https://search.opentofu.org/provider/hashicorp/azurerm/latest)
* [Google Cloud Platform](https://search.opentofu.org/provider/hashicorp/google/latest)

### Quelques clouders européens

* [OVHcloud](https://search.opentofu.org/provider/ovh/ovh/latest)
* [Scaleway](https://search.opentofu.org/provider/scaleway/scaleway/latest) pour [https://www.scaleway.com](https://www.scaleway.com).
* [Hetzner Cloud Provider](https://search.opentofu.org/provider/hetznercloud/hcloud/latest) pour [https://www.hetzner.com/cloud](https://www.hetzner.com/cloud)

### Quelques systèmes et outils

* [Kubernetes](https://search.opentofu.org/provider/hashicorp/kubernetes/latest)
* [Helm](https://search.opentofu.org/provider/hashicorp/helm/latest)
* [Keycloak](https://search.opentofu.org/provider/keycloak/keycloak/latest)
* [Gitlab](https://search.opentofu.org/provider/gitlabhq/gitlab/latest)

## Stockage de l'état

Quelques *backend* pour le stockage de l'état :

* [s3](https://opentofu.org/docs/language/settings/backends/s3/) permet de stocker l'état dans un bucket S3.
* [kubernetes](https://opentofu.org/docs/language/settings/backends/kubernetes/) permet de stocker sous forme d'un secret Kubernetes.
* [gcs](https://opentofu.org/docs/language/settings/backends/gcs/) permet de stocker l'état dans un bucket [Google Cloud Storage (GCS)](https://cloud.google.com/storage?hl=fr).


## Ressources

* [opentofu.org](https://opentofu.org/) est le site officiel
* [opentofu.org - OpenTofu Language Documentation](https://opentofu.org/docs/language/) décrit la syntaxe et les concepts.
* [search.opentofu.org](https://search.opentofu.org/)
    * [search.opentofu.org - Providers](https://search.opentofu.org/providers)
    * [search.opentofu.org - Modules](https://search.opentofu.org/providers)
* [blog.stephane-robert.info - Introduction à OpenTofu](https://blog.stephane-robert.info/docs/infra-as-code/provisionnement/opentofu/)
