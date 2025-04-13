# Terraform

[Terraform](https://www.terraform.io/) est un outil **Infrastructure as code (IaC)** développé par [HashiCorp](https://www.hashicorp.com/).

## Installation

* [learn.hashicorp.com - Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) : Procédure d'installation de l'exécutable.
* [terraform/install.sh](install.sh)

## Points clés

* L'infrastructure est décrite dans un dossier à l'aide de fichiers HCL (voir [registry.terraform.io - google_compute_instance - Example Usage](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#example-usage))
* Les [providers](https://registry.terraform.io/browse/providers) correspondent aux systèmes cibles (AWS, Azure, GCP,...)

## Principales commandes

| Commande                                                                     | Description                                                            |
|------------------------------------------------------------------------------|------------------------------------------------------------------------|
| [terraform init](https://www.terraform.io/docs/cli/commands/init.html)       | Préparation du répertoire de travail (téléchargement des modules & co) |
| [terraform validate](https://www.terraform.io/docs/cli/commands/init.html)   | Contrôle du fichier de configuration                                   |
| [terraform plan](https://www.terraform.io/docs/cli/commands/plan.html)       | Visualisation des changements à appliquer sur l'infrastructure         |
| [terraform apply](https://www.terraform.io/docs/cli/commands/apply.html)     | Création ou modification de l'infrastructure                           |
| [terraform destroy](https://www.terraform.io/docs/cli/commands/destroy.html) | Destruction de l'infrastructure                                        |

## Fournisseurs disponibles

La page [registry.terraform.io - providers](https://registry.terraform.io/browse/providers) mets en avant les principaux fournisseurs de cloud public :

* [AWS d'Amazon](https://registry.terraform.io/providers/hashicorp/aws/latest)
* [Azure de Microsoft](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
* [Google Cloud Platform](https://registry.terraform.io/providers/hashicorp/google/latest)

Nous trouvons aussi les clouders européens :

* [OVHcloud](https://registry.terraform.io/providers/ovh/ovh/latest/docs)
* [Scaleway](https://registry.terraform.io/providers/scaleway/scaleway/latest) pour [https://www.scaleway.com](https://www.scaleway.com).
* [Hetzner Cloud Provider](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs) pour [https://www.hetzner.com/cloud](https://www.hetzner.com/cloud)

Ainsi que des environnements d'exécution suivants :

* [kubernetes](https://registry.terraform.io/providers/hashicorp/kubernetes/latest)
* [docker](https://registry.terraform.io/providers/kreuzwerker/docker/latest)

## Alternatives

* [Vagrant](https://www.vagrantup.com/) pour les environnements de développement.
* [OpenTofu](https://opentofu.org/) qui est un fork de Terraform suite à un changement de licence.

## Ressources

* [blog.stephane-robert.info - Formation de A à Z sur Terraform](https://blog.stephane-robert.info/docs/infra-as-code/provisionnement/terraform/introduction/)
* [roadmap.sh - Terraform](https://roadmap.sh/terraform)
* [registry.terraform.io - Providers](https://registry.terraform.io/browse/providers)
* [www.vagrantup.com - Vagrant vs. Terraform](https://www.vagrantup.com/intro/vs/terraform)
