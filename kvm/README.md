# KVM

## Installation sous ubuntu

```bash
# 1) Installer les principaux packages
sudo apt update
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
# 2) Autoriser l'utilisateur courant à utiliser KVM
sudo adduser $USER libvirt

# 3) Vérifier l'installation
virsh list --all
sudo systemctl status libvirtd
```

## Cas de ubuntu sous WSL2

Voir [WSL - Configuration pour installation de KVM](../wsl/README.md#configuration-pour-installation-de-kvm)

## Utilisation en ligne de commande

Voir [blog.programster.org - KVM Cheatsheet](https://blog.programster.org/kvm-cheatsheet) pour utilisation du CLI `virsh` :

```bash
# afficher l'aide
virsh --help
# lister les VM
virsh list
# lister les réseaux
virsh net-list
# lister les pools de stockage
virsh pool-list
```

## Utilisation de KVM avec vagrant

```bash
# Install vagrant plugin dependencies
sudo apt-get install build-essential libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev
# Install vagrant plugin
vagrant plugin install vagrant-libvirt
# Start VMs
vagrant up --provider=libvirt
# Destroy VMs
vagrant destroy -f --provider=libvirt
```

## Installation d'une IHM

```bash
sudo apt install virt-manager
```

## Références

* [phoenixnap.com - How to Install KVM on Ubuntu 20.04](https://phoenixnap.com/kb/ubuntu-install-kvm)
* [computingforgeeks.com - Install KVM Hypervisor on Ubuntu 22.04|20.04](https://computingforgeeks.com/install-kvm-hypervisor-on-ubuntu-linux/)

