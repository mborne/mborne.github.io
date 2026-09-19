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

```bash
# Lister les distributions disponibles
wsl --list --online

# Installer la distribution ubuntu
wsl --install -d Ubuntu-24.04

# Arrêt
wsl --shutdown

# Suppression
wsl --terminate Ubuntu-24.04
wsl --unregister Ubuntu-24.04
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

La virtualisation imbriquée requise par [KVM](../kvm/README.md) est **activée par défaut sur Windows 11**. Au besoin, elle se force côté Windows dans `%UserProfile%\.wslconfig` :

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

### DNS

Dans `/etc/wsl.conf` :

```ini
[network]
generateHosts = true
generateResolvConf = false
```

* Dans `/etc/resolv.conf` :

```text
nameserver 1.1.1.1
nameserver 1.0.0.1
```

## Ressources

* [learn.microsoft.com - Comment installer Linux sur Windows avec WSL](https://learn.microsoft.com/fr-fr/windows/wsl/install)
* [learn.microsoft.com - Commandes de base pour WSL](https://learn.microsoft.com/fr-fr/windows/wsl/basic-commands)
* [learn.microsoft.com - Advanced settings configuration in WSL](https://learn.microsoft.com/en-us/windows/wsl/wsl-config)
* [learn.microsoft.com - Example .wslconfig file](https://learn.microsoft.com/en-us/windows/wsl/wsl-config#example-wslconfig-file)
