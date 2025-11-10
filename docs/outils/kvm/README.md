# KVM (Kernel Virtual Machine)

## Points clés

* KVM est un module du noyau Linux qui s'appuie sur les fonctionnalités de virtualisation matérielle du CPU (Intel VT-x ou AMD-V) pour le transformer **hyperviseur de type 1** [^1].
* KVM fournit seulement les mécanismes bas-niveau pour exécuter des OS invités grâce aux extensions CPU (VT-x, AMD-V).
* KVM expose une interface (`/dev/kvm`) exploitée par des programmes s'exécutant en espace utilisateur [^2]



[^1]: L'utilisation de Linux permet de garder les avantages d'un hyperviseur de type 2 (support du matériel) sans les inconvénients (performance)
[^2]: L'accès se fait par des appels système `ioctl()`, chacun correspondant à une opération KVM (ex : `KVM_CREATE_VM`) documentée dans [www.kernel.org - The Definitive KVM (Kernel-based Virtual Machine) API Documentation](https://www.kernel.org/doc/html/latest/virt/kvm/api.html) du noyau Linux.


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

## Création d'une VM

!!!warning ATTENTION
    - genisoimage et mkpasswd sont installés s'ils sont absent
    - Le dossier `/var/lib/libvirt/disks` est créé et utilisé pour le stockage des disques.


Le script [kvm/create-ubuntu-server.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/kvm/create-ubuntu-server.sh) illustre :

- Le téléchargement d'une image [ubuntu cloud](https://cloud-images.ubuntu.com/)
- La copie sous forme d'un disque redimensionné avec qemu-img
- La génération d'un disque cloud-init au format ISO avec **genisoimage**
- Le démarrage de la VM à l'aide de **virt-install**

```bash
# Créer une VM node-1
curl -sS https://mborne.github.io/outils/kvm/create-ubuntu-server.sh | UBUNTU_PASSWORD=ChangeIt VM_NAME=node-1 bash

# Vérifier qu'elle est démarrée
virsh list

# Inspecter les fichiers
virsh vol-list disks --details

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

* [blog.stephane-robert.info - Installez KVM/Libvirt sur Linux](https://blog.stephane-robert.info/docs/virtualiser/type1/kvm/)
* [phoenixnap.com - How to Install KVM on Ubuntu 20.04](https://phoenixnap.com/kb/ubuntu-install-kvm)
* [computingforgeeks.com - Install KVM Hypervisor on Ubuntu 22.04|20.04](https://computingforgeeks.com/install-kvm-hypervisor-on-ubuntu-linux/)
* [www.cyberciti.biz - Linux Find Out If CPU Support Intel VT/AMD-V Virtualization For KVM](https://www.cyberciti.biz/faq/linux-xen-vmware-kvm-intel-vt-amd-v-support/)
