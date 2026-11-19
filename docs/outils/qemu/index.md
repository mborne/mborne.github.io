---
tags:
    - Outil
    - Virtualisation
search:
    boost: 5
---

# QEMU

> 🤖 Rédaction assistée par IA.

[QEMU](https://www.qemu.org/) est un émulateur et un hyperviseur de type 2 qui exécute des machines virtuelles complètes (CPU, mémoire, disques, réseau, affichage).

## Points clés

- **Émulation ou virtualisation accélérée** : sans accélérateur, QEMU émule le CPU en logiciel (TCG, *Tiny Code Generator*), ce qui permet d'exécuter une autre architecture (ARM, RISC-V...) mais reste lent. Avec [KVM](../kvm/index.md) (`-accel kvm` ou `-enable-kvm`), le code de l'invité s'exécute directement sur le CPU de l'hôte (même architecture).
- **Repli TCG** : `-accel kvm -accel tcg` utilise KVM s'il est disponible et bascule sinon sur l'émulation (`-cpu host` n'est alors pas utilisable, préférer `-cpu max`).
- **Binaires** : un binaire `qemu-system-<arch>` par architecture émulée (ex : `qemu-system-x86_64`, `qemu-system-aarch64`) et `qemu-img` pour la gestion des disques virtuels.
- **Émulation des périphériques** : carte réseau, disque, carte graphique... avec des périphériques paravirtualisés `virtio` performants pour les invités Linux.
- **Bas niveau** : QEMU ne gère pas de catalogue de VM. Il est généralement piloté par un outil de plus haut niveau ([libvirt](../libvirt/index.md), [Lima](../lima/index.md), [Multipass](../multipass/index.md)...).

## Installation

- [www.qemu.org - Download QEMU](https://www.qemu.org/download/)

Sous Debian/Ubuntu, les principaux paquets sont :

| Paquet            | Contenu                                                                                         |
| ----------------- | ----------------------------------------------------------------------------------------------- |
| `qemu-system-x86` | `qemu-system-x86_64` (et `qemu-system-i386`)                                                    |
| `qemu-system`     | Méta-paquet installant les binaires de toutes les architectures (`qemu-system-arm`, `-mips`...) |
| `qemu-utils`      | `qemu-img`, `qemu-nbd`...                                                                       |
| `qemu-kvm`        | Paquet virtuel installant `qemu-system-x86` sur Ubuntu 24.04                                    |

Pour exécuter des VM x86_64 sur un hôte x86_64 :

```bash
sudo apt-get update
sudo apt-get install -y qemu-system-x86 qemu-utils
```

Pour bénéficier de l'accélération KVM, l'utilisateur doit en plus avoir accès à `/dev/kvm` (groupe `kvm`). [kvm/install.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/kvm/install.sh) vérifie le support de KVM, installe `qemu-kvm` et ajoute l'utilisateur au groupe `kvm` (voir [KVM - Installation](../kvm/index.md#installation)).

## Utilisation

### Gestion des disques

> Voir [www.qemu.org - Disk Images](https://www.qemu.org/docs/master/system/images.html) et [www.qemu.org - qemu-img](https://www.qemu.org/docs/master/tools/qemu-img.html)

Principaux formats :

- `qcow2` : format natif de QEMU, alloué à la demande, avec snapshots, compression et images de base (*backing file*) ;
- `raw` : image brute, simple et performante, mais sans ces fonctionnalités (allouée de manière creuse selon le système de fichiers).

```bash
# créer un disque de 20G
qemu-img create -f qcow2 disk.qcow2 20G

# afficher les informations d'un disque (format, taille virtuelle, taille réelle, image de base)
qemu-img info disk.qcow2

# agrandir un disque (le système de fichiers de l'invité est à étendre ensuite, cloud-init le fait au démarrage)
qemu-img resize disk.qcow2 50G

# convertir un disque raw en qcow2 (et inversement)
qemu-img convert -f raw -O qcow2 disk.raw disk.qcow2
```

### Images de base (backing file)

Une image `qcow2` peut s'appuyer sur une image de base en lecture seule : seules les différences sont écrites dans le nouveau disque. Cela permet de créer plusieurs VM à partir d'une même [image cloud](https://cloud-images.ubuntu.com/) sans la copier :

```bash
# image de base (ne plus la modifier ensuite)
wget -nc -O noble.img https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img

# disque d'une VM s'appuyant sur l'image de base, avec une taille de 20G
qemu-img create -f qcow2 -F qcow2 -b noble.img vm-1.qcow2 20G

# afficher la chaîne des images
qemu-img info --backing-chain vm-1.qcow2
```

### Lancement d'une VM

> Voir [www.qemu.org - Invocation](https://www.qemu.org/docs/master/system/invocation.html)

Lancement direct d'une VM à partir d'un disque existant, avec la console série dans le terminal :

```bash
qemu-system-x86_64 \
  -machine q35 \
  -accel kvm \
  -cpu host \
  -smp 2 \
  -m 2048 \
  -drive if=virtio,format=qcow2,file=disk.qcow2 \
  -nic user,model=virtio,hostfwd=tcp::2222-:22 \
  -nographic
```

???info "Explication des options"

    | Option                                     | Rôle                                                                                     |
    | ------------------------------------------ | ---------------------------------------------------------------------------------------- |
    | `-machine q35`                             | Type de machine (chipset moderne, PCIe)                                                  |
    | `-accel kvm` / `-enable-kvm`               | Accélération KVM (`-accel kvm -accel tcg` pour un repli sur l'émulation)                 |
    | `-cpu host`                                | Expose le CPU de l'hôte à l'invité (KVM uniquement, `-cpu max` avec TCG)                 |
    | `-smp 2` / `-m 2048`                       | Nombre de vCPU / mémoire en Mo                                                           |
    | `-drive if=virtio,format=qcow2,file=...`   | Disque virtio (répéter l'option pour ajouter un disque, ex : seed cloud-init)            |
    | `-cdrom image.iso` / `-boot d`             | ISO d'installation / démarrage sur le CD-ROM                                             |
    | `-nic user,model=virtio`                   | Réseau utilisateur (NAT sans privilège, invité en `10.0.2.15`)                           |
    | `-nic user,...,hostfwd=tcp::2222-:22`      | Redirection de port (ex : `ssh -p 2222 ubuntu@localhost`)                                |
    | `-nic bridge,br=br0,model=virtio`          | Raccordement à un bridge de l'hôte (à autoriser dans `/etc/qemu/bridge.conf`)            |
    | `-nographic`                               | Pas de fenêtre, console série dans le terminal (`Ctrl-a x` pour quitter QEMU)            |
    | `-snapshot`                                | Les écritures sur les disques sont perdues à l'arrêt                                     |

> NB : le réseau `user` ne répond pas au `ping` (ICMP) et l'invité n'est pas joignable depuis l'hôte sans `hostfwd`. Pour une VM joignable sur le réseau, utiliser un bridge (voir [exemple ubuntu-server](examples/ubuntu-server.md#demarrer-avec-un-bridge)).

### Arrêt d'une VM

L'arrêt propre se fait depuis l'invité, QEMU se termine alors automatiquement :

```bash
sudo poweroff
```

Depuis le moniteur QEMU (`Ctrl-a c` avec `-nographic`, voir [Console série](#console-serie)) :

- `system_powerdown` : demande d'arrêt propre (équivalent de l'appui sur le bouton d'alimentation, via ACPI) ;
- `quit` (ou `Ctrl-a x`) : arrêt brutal, équivalent d'une coupure de courant (risque de corruption du disque).

### Console série

Avec `-nographic`, QEMU n'ouvre pas de fenêtre : la console série de l'invité et le moniteur QEMU sont multiplexés dans le terminal. Les raccourcis commencent par `Ctrl-a`, puis une touche (voir [www.qemu.org - Keys in the character backend multiplexer](https://www.qemu.org/docs/master/system/mux-chardev.html)) :

| Raccourci  | Action                                                          |
| ---------- | --------------------------------------------------------------- |
| `Ctrl-a x` | Quitter QEMU (arrêt brutal de la VM, préférer `sudo poweroff`)  |
| `Ctrl-a c` | Basculer entre la console et le moniteur QEMU (`(qemu)`)        |
| `Ctrl-a h` | Afficher l'aide                                                 |
| `Ctrl-a a` | Envoyer `Ctrl-a` à l'invité (ex : début de ligne dans le shell) |

## Cas d'utilisation

- [Création d'une VM Ubuntu Desktop](examples/ubuntu-desktop.md)
- [Création d'une VM Debian Desktop](examples/debian-desktop.md)
- [Création d'une VM Ubuntu Server avec cloud-init](examples/ubuntu-server.md) (démarche pas à pas)
- [qemu/create-ubuntu-server.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/qemu/create-ubuntu-server.sh) prépare une VM Ubuntu Server à partir d'une image cloud (disque basé sur l'image, configuration [cloud-init](../cloud-init/index.md)) et génère son script de démarrage :

```bash
curl -sS https://mborne.github.io/outils/qemu/create-ubuntu-server.sh | UBUNTU_PASSWORD=ChangeIt VM_NAME=ubuntu-server bash
bash ~/qemu/ubuntu-server/start.sh
```

## Ressources

- [www.qemu.org](https://www.qemu.org/)
- [www.qemu.org - Documentation](https://www.qemu.org/docs/master/)
- [documentation.ubuntu.com - Launch QCOW images using QEMU](https://documentation.ubuntu.com/public-images/public-images-how-to/launch-qcow-with-qemu/)
- [cloudinit.readthedocs.io - New user tutorial with QEMU](https://cloudinit.readthedocs.io/en/latest/tutorial/qemu.html)
