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

- Une API uniforme pour gérer différents hyperviseurs ([QEMU](../qemu/README.md) / [KVM](../kvm/README.md), Xen, LXC, etc.),
- Des outils en ligne de commande (`virsh`, `virt-install`, `virt-manager`),
- Une gestion centralisée des VM (stockage, réseau, snapshots, etc.).

## Installation

Le script suivant installe la base libvirt ainsi que les outils utiles pour gérer des VM localement :

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
