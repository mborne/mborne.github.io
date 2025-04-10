# vagrant

## Installation

* [vagrant/install.sh](install.sh) installe l'exécutable vagrant en ajoutant au besoin le dépôt [hashicorp](../hashicorp/README.md)
* [vagrant/install-vagrant-libvirt.sh](install-vagrant-libvirt.sh)

## Utilisation

Les commandes ci-après illustre la création et l'utilisation d'un fichier [vagrant/helloworld/Vagrantfile](helloworld/Vagrantfile) pour créer une VM jetable.

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

* [app.vagrantup.com - Discover Vagrant Boxes](https://app.vagrantup.com/boxes/search)
