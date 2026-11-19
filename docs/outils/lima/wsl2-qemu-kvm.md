---
tags:
    - Windows
    - Virtualisation
---

# Lima - utilisation sous Windows avec WSL2

> 🤖 Rédaction assistée par IA.

Cette fiche illustre l'installation de [Lima](index.md) dans une distribution [WSL2](../wsl/index.md) en s'appuyant sur [QEMU](../qemu/index.md) et [KVM](../kvm/index.md) (virtualisation imbriquée).

## Pré-requis

- [WSL2](../wsl/index.md#installation) avec la [virtualisation imbriquée](../wsl/index.md#virtualisation-imbriquee-kvm) (active par défaut sur Windows 11)

## Création de l'instance WSL

En console Windows :

```bash
wsl --install Ubuntu-24.04 --name devbox
```

Puis, dans l'instance, mise à jour des paquets et installation de `jq` (requis par `lima/install.sh`) :

```bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y jq
```

## Installation de QEMU/KVM

Voir aussi [KVM - Pré-requis](../kvm/index.md#pre-requis) :

```bash
# vérification du support de KVM
sudo apt-get install -y cpu-checker
kvm-ok
# INFO: /dev/kvm exists
# KVM acceleration can be used

# installation de QEMU/KVM
sudo apt-get install -y qemu-kvm

# accès à /dev/kvm pour l'utilisateur courant
sudo adduser $USER kvm
```

> ⚠️ L'ajout au groupe `kvm` n'est pris en compte qu'après redémarrage de l'instance.

```bash
# sortir de l'instance
exit
# en console Windows : redémarrer l'instance et se reconnecter
wsl --terminate devbox
wsl -d devbox
```

## Installation de Lima

Voir [Lima - Installation](index.md#installation) :

```bash
curl -sSL https://mborne.github.io/outils/lima/install.sh | bash
```

> NB : pour installer la dernière version disponible, utiliser `VERSION=latest` (voir [Lima - Installation](index.md#installation)).

## Création d'une VM

Création et démarrage de la VM `default` :

```bash
limactl start --mount-none
limactl shell default -- uname -a
```

## Suppression de la VM

```bash
limactl stop default
limactl delete default
```

## Ressources

- [lima-vm.io - installation](https://lima-vm.io/docs/installation/)
