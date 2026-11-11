---
tags:
    - Sandboxing agent IA
---

# WSL - création d'une instance de DEV pour VSCode

> 🤖 Rédaction assistée par IA.

Cette fiche illustre la création avec [WSL](index.md) d'une instance de développement `devbox` isolée de la distribution principale, puis son utilisation avec VSCode en remote WSL.

> ⚠️ Par défaut, l'instance accède aux disques Windows (`/mnt/c`) et peut lancer des exécutables Windows : voir [WSL - Limites](index.md#limites).

## Pré-requis

- [WSL2](index.md#installation)
- [VSCode](https://code.visualstudio.com/) avec l'extension [WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl)

## Création de l'instance

Création de l'instance avec un nom et un chemin spécifique :

```bash
wsl --install Ubuntu-24.04 --name devbox --location C:\WSL\devbox
wsl --list --verbose
```

> NB : le premier lancement demande la création de l'utilisateur (ex : `ubuntu`).

Création du dossier de travail :

```bash
wsl -d devbox mkdir -p /home/ubuntu/workspace
```

## Connexion avec VSCode

```bash
code --remote wsl+devbox /home/ubuntu/workspace
```

## Suppression de l'instance

```bash
wsl --terminate devbox
wsl --unregister devbox
```

## Isolation renforcée

Pour limiter l'accès de l'instance au système Windows, dans `/etc/wsl.conf` de l'instance :

```ini
[interop]
# pas d'exécution des binaires Windows (ex : cmd.exe, powershell.exe)
enabled = false
appendWindowsPath = false
```

Puis redémarrage de l'instance :

```bash
wsl --terminate devbox
```

> ⚠️ L'isolation reste limitée (disques Windows montés, VM WSL2 partagée) : voir [WSL - Limites](index.md#limites).
