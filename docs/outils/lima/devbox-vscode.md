---
tags:
    - Sandboxing agent IA
---

# Lima - création d'une VM de DEV pour VSCode en remote SSH

> 🤖 Rédaction assistée par IA.

Cette fiche illustre la création avec [Lima](index.md) d'une VM de développement `devbox`, puis son utilisation avec VSCode en remote SSH.

> ⚠️ La VM n'a pas accès au GPU et, selon l'hôte, pas à KVM : voir [Lima - Limites](index.md#limites).

## Pré-requis

- [Lima](index.md#installation)
- [VSCode](https://code.visualstudio.com/) avec l'extension [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh)
- La ligne suivante dans `~/.ssh/config` pour un accès SSH avec `ssh lima-<nom>` (voir [Lima - Accès SSH](index.md#acces-ssh)) :

```text
Include ~/.lima/*/ssh.config
```

## Création de la VM

La VM est créée sans montage (`--mount-none`) : elle n'a aucun accès aux fichiers de l'hôte et le dossier de travail est uniquement dans la VM.

```bash
limactl create --name devbox --cpus 4 --memory 8 --disk 50 --mount-none
limactl start devbox
limactl shell devbox -- mkdir -p workspace
```

## Connexion avec VSCode

```bash
code --folder-uri vscode-remote://ssh-remote+lima-devbox/home/$USER.guest/workspace
```

> 💡 L'utilisateur de la VM porte par défaut le même nom que sur l'hôte (sinon `lima`). En cas de doute sur le chemin, `limactl shell devbox -- sh -c 'echo $HOME'`.

Pour copier des fichiers vers la VM : `limactl copy -r <dossier> devbox:~/`.

## Suppression de la VM

```bash
limactl stop devbox
limactl delete devbox
```
