# Vagrant

Vagrant est un outil open source qui permet de créer des machines virtuelles de manière simple et reproductible.

!!!warning "Changement de licence"
    - HashiCorp a modifié la licence de ses produits dont Vagrant.
    - Contrairement au cas de [Terraform](../terraform/README.md) qui a été forké en [OpenTofu](../opentofu/README.md), Vagrant qui était déjà en perte de vitesse par rapport à [Docker](../docker/README.md) ne semble pas trouver un successeur.

## Points clés

* [Vagrant](https://www.vagrantup.com/) est principalement utilisé pour **créer des machines virtuelles de DEV** à partir d'un fichier `Vagrantfile` (i.e. *as code*).
* [Vagrant](https://www.vagrantup.com/) supporte plusieurs systèmes de virtualisation tels VirtualBox et VMware (voir [www.vagrantup.com - providers](https://www.vagrantup.com/docs/providers))
* [Vagrant](https://www.vagrantup.com/) s'appuie sur des images de VM au format `.box`
* Un [dépôt d'image publique permet de rechercher une image de VM](https://app.vagrantup.com/boxes/search) compatible avec son système de virtualisation (`virtualbox`, `libvirt` (KVM),...)

## Installation

* [https://www.vagrantup.com/downloads](https://www.vagrantup.com/downloads) permet le **téléchargement pour Windows et MacOS** et donne les instructions pour l'**utilisation du dépôt APT pour l'installation sur une machine Debian/Ubuntu**
* [vagrant/install.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/vagrant/install.sh) ajoute au besoin le dépôt hashicorp et installe l'exécutable vagrant :

```bash
curl -sS https://mborne.github.io/outils/vagrant/install.sh | bash
```

* [vagrant/install-vagrant-libvirt.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/vagrant/install-vagrant-libvirt.sh) assure l'installation du [plugin "vagrant-libvirt" pour KVM](https://github.com/vagrant-libvirt/vagrant-libvirt) :

```bash
curl -sS https://mborne.github.io/outils/vagrant/install-vagrant-libvirt.sh | bash
```

## Utilisation

Voir :

* [Vagrant - TP de prise en main de Vagrant](prise-en-main.md) dans le cadre du cours [DevOps avec des VM](https://mborne.github.io/cours-devops/vm.html).
* Les commandes ci-après qui illustrent la création et l'utilisation d'un fichier pour créer une VM jetable :

```bash
# Si vagrant dans WSL2
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"

# Si utilisation de KVM
export VAGRANT_DEFAULT_PROVIDER=libvirt

# Préparation d'un dossier pour la VM
mkdir vagrant/helloworld
cd vagrant/helloworld

# Création du Vagrantfile dans ce dossier
# NB : KVM non supporté par ubuntu/jammy64
vagrant init generic/ubuntu2204

# Afficher l'aide de vagrant
vagrant -h

# Démarrage de la VM
vagrant up

# Ouverture d'un terminal
vagrant ssh
```


## Ressources

* [Vagrant - TP de prise en main de Vagrant](prise-en-main.md)
* [Vagrant - getting started](https://learn.hashicorp.com/collections/vagrant/getting-started) qui guide pour **débuter en l'absence d'un proxy HTTP** (par exemple sur une machine perso connectée à une box internet standard).
* [app.vagrantup.com - Discover Vagrant Boxes](https://app.vagrantup.com/boxes/search)
* [gist.github.com - wpscholar/vagrant-cheat-sheet.md](https://gist.github.com/wpscholar/a49594e2e2b918f4d0c4#file-vagrant-cheat-sheet-md) qui liste les **principales commandes de vagrant**.

## Remarques

* [code.gouv.fr - SILL - Vagrant](https://code.gouv.fr/sill/detail?name=Vagrant) mentionne que l'outil n'est plus recommandé depuis le 25 septembre 2023 suite à un [changement de licence](https://fr.wikipedia.org/wiki/Vagrant#Licence).
* A ce titre, il serait probablement pertinent de basculer sur [multipass + cloud-init](https://ubuntu.com/blog/using-cloud-init-with-multipass) dans le cadre du cours [DevOps avec des VM](https://mborne.github.io/cours-devops/vm.html) où Vagrant est présenté pour illustrer la création de VM *as code*.
* Nous voyons toutefois par la suite [DevOps avec des conteneurs](https://mborne.github.io/cours-devops/conteneurs.html) et ces derniers sont désormais largement plus utilisé que les VM pour les environnements de DEV.



