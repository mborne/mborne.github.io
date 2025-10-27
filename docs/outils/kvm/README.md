# KVM

## Pré-requis

* [kvm/prepare-wsl.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/kvm/prepare-wsl.sh) prépare l'installation dans [WSL](../wsl/README.md) (testé avec Ubuntu-24.04) :

```bash
# ATTENTION : snap sera désactivé
curl -sS https://mborne.github.io/outils/kvm/prepare-wsl.sh | bash
# NB : il faudra rebooter avec wsl --shutdown && wsl
```

## Installation

* [kvm/install.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/kvm/install.sh) assure l'installation de libvirt :

```bash
# ATTENTION : snap sera désactivé
curl -sS https://mborne.github.io/outils/kvm/install.sh | bash
```


## Utilisation

### Avec une IHM

```bash
sudo apt install virt-manager
virt-manager &
```

### En ligne de commande

Voir [blog.programster.org - KVM Cheatsheet](https://blog.programster.org/kvm-cheatsheet) pour utilisation du CLI `virsh` :

```bash
# afficher l'aide
virsh help
# lister les VM
virsh list
# lister les réseaux
virsh net-list
# lister les pools de stockage
virsh pool-list
```

## Ressources

* [blog.stephane-robert.info - Installez KVM/Libvirt sur Linux](https://blog.stephane-robert.info/docs/virtualiser/type1/kvm/)
* [phoenixnap.com - How to Install KVM on Ubuntu 20.04](https://phoenixnap.com/kb/ubuntu-install-kvm)
* [computingforgeeks.com - Install KVM Hypervisor on Ubuntu 22.04|20.04](https://computingforgeeks.com/install-kvm-hypervisor-on-ubuntu-linux/)
* [www.cyberciti.biz - Linux Find Out If CPU Support Intel VT/AMD-V Virtualization For KVM](https://www.cyberciti.biz/faq/linux-xen-vmware-kvm-intel-vt-amd-v-support/)