# QEMU

> 🤖 Rédaction assistée par IA.

[QEMU](https://www.qemu.org/) est un hyperviseur de type 2 qui peut :

- émuler des architectures complètes (x86, ARM, RISC-V, etc.)
- émuler les périphériques (carte réseau, disque, carte graphique...),
- utiliser KVM pour accélérer l’exécution CPU

## Installation

- [www.qemu.org - Download QEMU](https://www.qemu.org/download/)

```bash
sudo apt-get update
sudo apt-get install -y qemu-system
```

## Gestion des disques

> Voir [www.qemu.org - Disk Images](https://www.qemu.org/docs/master/system/images.html) et [www.qemu.org - qemu-img](https://www.qemu.org/docs/master/tools/qemu-img.html)

```bash
# créer un disque de 100G
qemu-img create -f qcow2 os.img 100G

# modifier la taille d'un disque
qemu-img resize os.img 100G
```

## Ressources

- [QEMU](https://www.qemu.org/)
- [documentation.ubuntu.com -](https://documentation.ubuntu.com/public-images/public-images-how-to/launch-qcow-with-qemu/)
- [cloudinit.readthedocs.io - New user tutorial with QEMU](https://cloudinit.readthedocs.io/en/latest/tutorial/qemu.html)
