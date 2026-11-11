---
tags:
    - Virtualisation
    - Windows
    - WSL
    - WSL2
search:
    boost: 5
---

# Windows Subsystem for Linux (WSL)

> 🤖 Rédaction assistée par IA.

## Activation

Voir [blog.stephane-robert.info - Installer WSL 2 sur Windows 11](https://blog.stephane-robert.info/docs/admin-serveurs/linux/wsl2/)

## Installation

```bash
# Installation en console administrateur
wsl --install

# Utiliser la version 2 par défaut
wsl --set-default-version 2

# Vérifier que tout est OK
wsl --status
# demandera peut-être d'activer le service "Plateforme d’ordinateur virtuel" avec :
# wsl.exe --install --no-distribution
```

## Utilisation

### Création d'une instance

```bash
# Lister les distributions disponibles
wsl --list --online

# Installer la distribution ubuntu (instance nommée "Ubuntu-24.04")
wsl --install -d Ubuntu-24.04

# Création d'une instance avec un nom et un chemin spécifique
# NB : permet de créer plusieurs instances
wsl --install Ubuntu-24.04 --name devbox --location C:\WSL\devbox

# Définir l'instance par défaut
wsl --set-default devbox

# Lister les instances installées avec leur état et leur version
wsl --list --verbose
```


### Lancement et exécution de commandes

```bash
# Ouvrir un shell dans l'instance par défaut / dans une instance donnée
wsl
wsl -d devbox

# Ouvrir un shell dans le dossier personnel / en tant que root
wsl -d devbox --cd ~
wsl -d devbox -u root

# Exécuter une commande (ex : création d'un dossier de travail)
wsl -d devbox mkdir -p /home/ubuntu/workspace
```

### Sauvegarde et restauration

```bash
# Export d'une instance dans une archive
wsl --export devbox C:\WSL\backup\devbox.tar

# Import d'une archive sous forme d'une nouvelle instance
wsl --import devbox-copy C:\WSL\devbox-copy C:\WSL\backup\devbox.tar
```

### Arrêt

```bash
# Arrêt d'une instance
wsl --terminate devbox

# Arrêt de toutes les instances (et de la VM WSL2)
wsl --shutdown
```

### Suppression

```bash
# Suppression d'une instance (ATTENTION : supprime définitivement le disque virtuel)
wsl --unregister devbox
```

## Cas d'utilisation

- [Création d'une instance de DEV pour VSCode](devbox-vscode.md)
- [Utilisation de Docker sous Windows](docker.md)
- [Utilisation de Kubernetes (K3S)](k3s.md)

## Limites

### Isolation partielle avec Windows

Une instance WSL n'est pas une VM isolée :

- Les disques Windows sont montés (`/mnt/c`) et accessibles en écriture. Les démonter (`[automount] enabled = false`) casse VSCode en remote WSL qui en a besoin.
- Les binaires Windows sont exécutables depuis l'instance (`cmd.exe`, `powershell.exe`). Cette interopérabilité se désactive dans `/etc/wsl.conf` (`[interop] enabled = false`), au prix de la commande `code .` depuis l'instance.

### Isolation partielle entre instances WSL

Les instances ne sont pas des VM distinctes, mais des conteneurs dans une unique VM WSL2[^1] :

- Même noyau Linux : une faille noyau ou un module chargé dans une instance concerne toutes les autres.
- Même réseau : les instances ont la même adresse IP, un port ouvert dans une instance est joignable depuis les autres (`localhost`).
- Mêmes ressources : les limites CPU/RAM de `.wslconfig` s'appliquent à l'ensemble des instances, pas à chacune.

> NB : WSL2 s'appuie bien sur la technologie Hyper-V (composant "Plateforme d'ordinateur virtuel"), mais avec **une seule VM pour toutes les instances** (contrairement à [Multipass](../multipass/index.md) qui crée une VM par instance).

Pour le vérifier, comparer l'identifiant de démarrage du noyau et les adresses IP entre deux instances (valeurs identiques) :

```bash
wsl -d Ubuntu-24.04 -- sh -c 'cat /proc/sys/kernel/random/boot_id; hostname -I'
wsl -d devbox -- sh -c 'cat /proc/sys/kernel/random/boot_id; hostname -I'
```

## Configuration

!!!warning "Attention!"
    - Il y a deux fichiers de configuration, à ne pas confondre (voir le tableau ci-dessous)
    - Il faut rebooter pour prise en compte des changements (`wsl --shutdown && wsl`)

| Fichier | Emplacement | Portée | Sections |
| --- | --- | --- | --- |
| `wsl.conf` | `/etc/wsl.conf`, dans la distribution | Une distribution | `[boot]`, `[automount]`, `[network]`, `[interop]`, `[user]`, `[gpu]`, `[time]` |
| `.wslconfig` | `%UserProfile%\.wslconfig`, côté Windows | La VM WSL2 (toutes distributions) | `[wsl2]`, `[general]`, `[experimental]` |

> Voir [learn.microsoft.com - Advanced settings configuration in WSL](https://learn.microsoft.com/en-us/windows/wsl/wsl-config)

### Virtualisation imbriquée (KVM)

La virtualisation imbriquée requise par [KVM](../kvm/index.md) est **activée par défaut sur Windows 11**. Au besoin, elle se force côté Windows dans `%UserProfile%\.wslconfig` :

```ini
[wsl2]
nestedVirtualization=true
```

Côté distribution, `systemd` (requis par libvirt) s'active dans `/etc/wsl.conf` :

```ini
[boot]
systemd=true
```

> NB : les images Ubuntu pour WSL livrent déjà ce réglage.


## Ressources

* [learn.microsoft.com - Comment installer Linux sur Windows avec WSL](https://learn.microsoft.com/fr-fr/windows/wsl/install)
* [learn.microsoft.com - Commandes de base pour WSL](https://learn.microsoft.com/fr-fr/windows/wsl/basic-commands)
* [learn.microsoft.com - Advanced settings configuration in WSL](https://learn.microsoft.com/en-us/windows/wsl/wsl-config)
* [learn.microsoft.com - Example .wslconfig file](https://learn.microsoft.com/en-us/windows/wsl/wsl-config#example-wslconfig-file)

[^1]: [learn.microsoft.com - What is WSL 2?](https://learn.microsoft.com/en-us/windows/wsl/about#what-is-wsl-2) : *"Linux distributions run as isolated containers inside of the WSL 2 managed VM. Linux distributions running via WSL 2 will share the same network namespace, device tree (other than `/dev/pts`), CPU/Kernel/Memory/Swap, `/init` binary, but have their own PID namespace, Mount namespace, User namespace, Cgroup namespace, and `init` process."*
