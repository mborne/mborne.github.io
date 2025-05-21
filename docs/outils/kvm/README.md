# KVM

## Installation

* [kvm/prepare-wsl.sh](prepare-wsl.sh) prépare l'installation dans [WSL](../wsl/README.md) (testé avec Ubuntu-22.04) :

```bash
# ATTENTION : snap sera désactivé
curl -sS https://mborne.github.io/outils/kvm/prepare-wsl.sh | bash
```

* [kvm/install.sh](install.sh) assure l'installation de libvirt :

```bash
# ATTENTION : snap sera désactivé
curl -sS https://mborne.github.io/outils/kvm/install.sh | bash
```

## Utilisation

### En ligne de commande

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

### Avec une IHM

Pour installer une IHM :

```bash
sudo apt install virt-manager
```

## Références

* [phoenixnap.com - How to Install KVM on Ubuntu 20.04](https://phoenixnap.com/kb/ubuntu-install-kvm)
* [computingforgeeks.com - Install KVM Hypervisor on Ubuntu 22.04|20.04](https://computingforgeeks.com/install-kvm-hypervisor-on-ubuntu-linux/)
