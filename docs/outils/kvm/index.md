---
tags:
    - Outil
    - Virtualisation
search:
    boost: 5
---

# KVM (Kernel Virtual Machine)

## Points clés

* KVM est un module du noyau Linux qui s'appuie sur les fonctionnalités de virtualisation matérielle du CPU (Intel VT-x ou AMD-V) pour fournir un accès direct à l'accélération de la virtualisation.
* KVM fournit seulement les mécanismes bas-niveau pour exécuter des OS invités grâce aux extensions CPU (VT-x, AMD-V).
* KVM expose une interface (`/dev/kvm`) exploitée par des programmes s'exécutant en espace utilisateur, souvent [QEMU](../qemu/index.md) [^1].

[^1]: L'accès se fait par des appels système `ioctl()`, chacun correspondant à une opération KVM (ex : `KVM_CREATE_VM`) documentée dans [www.kernel.org - The Definitive KVM (Kernel-based Virtual Machine) API Documentation](https://www.kernel.org/doc/html/latest/virt/kvm/api.html) du noyau Linux.

## Pré-requis

[kvm/check-support.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/kvm/check-support.sh) diagnostique le support de KVM sur la machine : contexte d'exécution, extensions de virtualisation du CPU et accès à `/dev/kvm`.

```bash
curl -sS https://mborne.github.io/outils/kvm/check-support.sh | bash
```

!!! info "Diagnostic uniquement"
    Ce script n'installe et ne modifie rien : chaque problème est signalé avec la commande à lancer. Les messages sont adaptés au contexte détecté (machine physique, machine virtuelle ou WSL2).

Le code de sortie vaut `0` si KVM est utilisable, `1` sinon. Les pré-requis de gestion des VM (`libvirtd`, `virsh`, `virt-install`) relèvent de la fiche [libvirt](../libvirt/index.md).

Sous [WSL](../wsl/index.md), la virtualisation imbriquée requise par KVM se règle côté Windows dans `%UserProfile%\.wslconfig` et est active par défaut sur Windows 11. Voir [WSL - Configuration](../wsl/index.md#configuration) si le diagnostic signale le contraire.

## Installation

KVM est intégré au noyau Linux (modules `kvm` et `kvm_intel` / `kvm_amd`, chargés automatiquement si le CPU le supporte) : il n'y a rien à installer pour KVM lui-même. Il faut en revanche :

* un programme en espace utilisateur pour exploiter `/dev/kvm`, en pratique [QEMU](../qemu/index.md) (paquet `qemu-kvm`, qui installe `qemu-system-x86` sur Ubuntu) ;
* un accès en lecture/écriture à `/dev/kvm` pour l'utilisateur (groupe `kvm`).

[kvm/install.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/kvm/install.sh) vérifie le support de KVM (`kvm-ok`), installe `qemu-kvm` et ajoute l'utilisateur courant au groupe `kvm` :

```bash
curl -sS https://mborne.github.io/outils/kvm/install.sh | bash
```

> NB : l'ajout au groupe `kvm` n'est pris en compte qu'à la reconnexion. Relancer ensuite le diagnostic des [pré-requis](#pre-requis).

## Utilisation

KVM n'est pas utilisé directement, mais au travers d'outils qui s'appuient sur `/dev/kvm` :

* [QEMU](../qemu/index.md) : lancement direct d'une VM avec `qemu-system-x86_64 -accel kvm` ;
* [libvirt](../libvirt/index.md) : gestion des VM, des réseaux et du stockage avec `virsh` / `virt-install` / `virt-manager` (voir [libvirt - Création d'une VM](../libvirt/index.md#creation-dune-vm)) ;
* [Lima](../lima/index.md) et [Multipass](../multipass/index.md) : gestionnaires de VM s'appuyant sur QEMU.

## Ressources

* [www.kernel.org - The Definitive KVM (Kernel-based Virtual Machine) API Documentation](https://www.kernel.org/doc/html/latest/virt/kvm/api.html)
* [www.cyberciti.biz - Linux Find Out If CPU Support Intel VT/AMD-V Virtualization For KVM](https://www.cyberciti.biz/faq/linux-xen-vmware-kvm-intel-vt-amd-v-support/)
* [blog.stephane-robert.info - Installez KVM/Libvirt sur Linux](https://blog.stephane-robert.info/docs/virtualiser/type1/kvm/)
