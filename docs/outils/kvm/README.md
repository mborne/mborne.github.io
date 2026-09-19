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
* KVM expose une interface (`/dev/kvm`) exploitée par des programmes s'exécutant en espace utilisateur, souvent [QEMU](../qemu/README.md) [^1].

[^1]: L'accès se fait par des appels système `ioctl()`, chacun correspondant à une opération KVM (ex : `KVM_CREATE_VM`) documentée dans [www.kernel.org - The Definitive KVM (Kernel-based Virtual Machine) API Documentation](https://www.kernel.org/doc/html/latest/virt/kvm/api.html) du noyau Linux.

## Pré-requis

[kvm/check-support.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/kvm/check-support.sh) diagnostique le support de KVM sur la machine : contexte d'exécution, extensions du CPU, accès à `/dev/kvm`, présence de systemd, appartenance aux groupes `kvm` et `libvirt`, outils disponibles.

```bash
curl -sS https://mborne.github.io/outils/kvm/check-support.sh | bash
```

!!! info "Diagnostic uniquement"
    Ce script n'installe et ne modifie rien : chaque problème est signalé avec la commande à lancer. Les messages sont adaptés au contexte détecté (machine physique, machine virtuelle ou WSL2).

Le code de sortie vaut `0` si tout est prêt, `1` si KVM est inutilisable (pas de support matériel ou pas d'accès à `/dev/kvm`) et `2` si KVM fonctionne mais que les pré-requis libvirt manquent.

Sous [WSL](../wsl/README.md), les deux réglages concernés — la virtualisation imbriquée (`%UserProfile%\.wslconfig`, côté Windows) et `systemd` (`/etc/wsl.conf`) — sont actifs par défaut respectivement sur Windows 11 et dans les images Ubuntu. Voir [WSL - Configuration](../wsl/README.md#configuration) si le diagnostic signale le contraire.

## Installation

* [kvm/install.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/kvm/install.sh) installe le paquet `qemu-kvm` pour activer la virtualisation KVM sur la machine locale :

```bash
curl -sS https://mborne.github.io/outils/kvm/install.sh | bash
```

## Utilisation

!!! info "Pré-requis : libvirt"
    `kvm/install.sh` installe uniquement `qemu-kvm`. Les commandes ci-dessous reposent sur `virsh`, `virt-install` et `qemu-img`, fournis par [libvirt](../libvirt/README.md) : installer d'abord [libvirt/install.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/libvirt/install.sh), qui ajoute aussi l'utilisateur au groupe `libvirt`.

### Création d'une VM

!!! warning "ATTENTION"
    - genisoimage et mkpasswd sont installés s'ils sont absent
    - Le dossier `/var/lib/libvirt/disks` est créé et utilisé pour le stockage des disques.

Le script [kvm/create-ubuntu-server.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/kvm/create-ubuntu-server.sh) illustre :

* Le téléchargement d'une image [ubuntu cloud](https://cloud-images.ubuntu.com/)
* La copie sous forme d'un disque redimensionné avec qemu-img
* La génération d'un disque cloud-init au format ISO avec **genisoimage**
* Le démarrage de la VM à l'aide de **virt-install**

```bash
# Créer une VM node-1
curl -sS https://mborne.github.io/outils/kvm/create-ubuntu-server.sh | UBUNTU_PASSWORD=ChangeIt VM_NAME=node-1 bash

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

* [KVM - Configuration de la résolution de nom](dns-resolved.md)

## Ressources

* [documentation.ubuntu.com - Virtualization with KVM](https://documentation.ubuntu.com/server/how-to/virtualisation/libvirt/)
* [blog.stephane-robert.info - Installez KVM/Libvirt sur Linux](https://blog.stephane-robert.info/docs/virtualiser/type1/kvm/)
* [phoenixnap.com - How to Install KVM on Ubuntu 20.04](https://phoenixnap.com/kb/ubuntu-install-kvm)
* [computingforgeeks.com - Install KVM Hypervisor on Ubuntu 22.04|20.04](https://computingforgeeks.com/install-kvm-hypervisor-on-ubuntu-linux/)
* [www.cyberciti.biz - Linux Find Out If CPU Support Intel VT/AMD-V Virtualization For KVM](https://www.cyberciti.biz/faq/linux-xen-vmware-kvm-intel-vt-amd-v-support/)
