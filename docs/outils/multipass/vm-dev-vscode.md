---
tags:
    - Sandboxing agent IA
---

# Multipass - création d'une VM de DEV pour VSCode en remote SSH

> 🤖 Rédaction assistée par IA.

Cette fiche illustre la création avec [Multipass](index.md) d'une VM de développement `devbox`, puis son utilisation avec VSCode en remote SSH.

## Pré-requis

- [Multipass](index.md#systemes-supportes)
- [VSCode](https://code.visualstudio.com/) avec l'extension [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh)
- Une clé SSH (`cat ~/.ssh/id_rsa.pub`, à défaut `ssh-keygen`)

## Création de la VM

Fichier `cloud-init.yaml` minimal autorisant la connexion SSH avec votre clé publique :

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

Avec l'adresse IP affichée par `multipass list` (ex : `10.97.0.250`) :

```bash
code --remote ssh-remote+ubuntu@10.97.0.250 /home/ubuntu/workspace
```

## Suppression de la VM

```bash
multipass stop devbox
multipass delete devbox
multipass purge
```
