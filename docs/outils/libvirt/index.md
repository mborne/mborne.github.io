---
tags:
    - Outil
    - Virtualisation
search:
    boost: 5
---

# libvirt

> 🤖 Rédaction assistée par IA.

libvirt est une bibliothèque C et un démon (libvirtd / virtd) qui fournit :

- Une API uniforme pour gérer différents hyperviseurs ([QEMU](../qemu/index.md) / [KVM](../kvm/index.md), Xen, LXC, etc.),
- Des outils en ligne de commande (`virsh`, `virt-install`, `virt-manager`),
- Une gestion centralisée des VM (stockage, réseau, snapshots, etc.).

## Installation

Le script [libvirt/install.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/libvirt/install.sh) installe la base libvirt ainsi que les outils utiles pour gérer des VM localement ([QEMU](../qemu/index.md) via `qemu-kvm`, `virt-install`...) et ajoute l'utilisateur aux groupes `libvirt` et `kvm` :

```bash
curl -sS https://mborne.github.io/outils/libvirt/install.sh | bash
```

## Utilisation

```bash
# lister les machines virtuelles
virsh list --all

# afficher les réseaux libvirt
virsh net-list

# démarrer une interface graphique de gestion
virt-manager &
```

## Création d'une VM

!!! warning "ATTENTION"
    - genisoimage et mkpasswd sont installés s'ils sont absents
    - Le dossier `/var/lib/libvirt/disks` est créé et utilisé pour le stockage des disques.

Le script [libvirt/create-ubuntu-server.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/libvirt/create-ubuntu-server.sh) illustre :

- Le téléchargement d'une image [ubuntu cloud](https://cloud-images.ubuntu.com/)
- La création d'un disque basé sur cette image et redimensionné avec [qemu-img](../qemu/index.md#images-de-base-backing-file)
- La génération d'un disque [cloud-init](../cloud-init/index.md) au format ISO avec **genisoimage**
- Le démarrage de la VM à l'aide de **virt-install** (`--virt-type kvm`)

```bash
# Créer une VM node-1
curl -sS https://mborne.github.io/outils/libvirt/create-ubuntu-server.sh | UBUNTU_PASSWORD=ChangeIt VM_NAME=node-1 bash

# Vérifier qu'elle est démarrée
virsh list

# Inspecter les fichiers
ls -lh /var/lib/libvirt/disks

# Se connecter
virsh console node-1

# Pour supprimer la VM :
virsh destroy node-1
virsh undefine node-1

# Pour supprimer ses données :
rm -rf /var/lib/libvirt/disks/node-1.*
```

## Aller plus loin

- [libvirt - Configuration de la résolution de nom](dns-resolved.md)

## Ressources

- [libvirt.org](https://libvirt.org/)
- [documentation.ubuntu.com - libvirt](https://documentation.ubuntu.com/server/how-to/virtualisation/libvirt/)
- [phoenixnap.com - How to Install KVM on Ubuntu 20.04](https://phoenixnap.com/kb/ubuntu-install-kvm)
- [computingforgeeks.com - Install KVM Hypervisor on Ubuntu 22.04|20.04](https://computingforgeeks.com/install-kvm-hypervisor-on-ubuntu-linux/)
