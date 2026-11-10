---
tags:
    - Outil
    - Virtualisation
    - Multipass
search:
    boost: 2
---

# Multipass

> 🤖 Rédaction assistée par IA.

[Multipass](https://canonical.com/multipass) est un outil de Canonical qui permet de créer rapidement des **VM Ubuntu** sous Windows (Hyper-V), macOS et Linux. Les VM peuvent être configurées au démarrage avec [cloud-init](../cloud-init/README.md).

Cette fiche illustre la création d'une VM de développement `devbox` accessible en SSH depuis VSCode.

## Installation

Voir [documentation.ubuntu.com - Install Multipass](https://documentation.ubuntu.com/multipass/latest/how-to-guides/install-multipass/) (installeur pour Windows et macOS, `snap` pour Linux).

## Création d'une VM de développement

Fichier `cloud-init.yaml` minimal autorisant la connexion SSH avec votre clé publique (`cat ~/.ssh/id_rsa.pub`) :

```yaml
users:
  - name: ubuntu
    sudo: ALL=(ALL) NOPASSWD:ALL
    ssh_authorized_keys:
      - <SSH_PUB_CLE>
```

Création de la VM et du dossier de travail :

```bash
multipass launch -n devbox --cpus 4 --memory 8G --disk 50G --cloud-init cloud-init.yaml
multipass list
multipass exec devbox mkdir /home/ubuntu/workspace
```

## Connexion avec VSCode

Avec l'extension [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh) et l'adresse IP affichée par `multipass list` (ex : `10.97.0.250`) :

```bash
code --remote ssh-remote+ubuntu@10.97.0.250 /home/ubuntu/workspace
```

## Virtualisation imbriquée (Windows / Hyper-V)

Pour exécuter des VM (ex : KVM) dans `devbox`, il faut exposer les extensions de virtualisation à la VM Hyper-V (PowerShell en tant qu'administrateur) :

```powershell
multipass stop devbox
Set-VMProcessor -VMName devbox -ExposeVirtualizationExtensions $true
multipass start devbox
```

## Suppression de la VM

```bash
multipass stop devbox
multipass delete devbox
multipass purge
```

## Ressources

- [canonical.com/multipass](https://canonical.com/multipass)
- [documentation.ubuntu.com/multipass](https://documentation.ubuntu.com/multipass/)
- [ubuntu.com - Using cloud-init with Multipass](https://ubuntu.com/blog/using-cloud-init-with-multipass)
