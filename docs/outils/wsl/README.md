---
tags:
    - Virtualisation
    - Windows
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

# Démarrer la distribution ubuntu
wsl --distribution Ubuntu-24.04 --user ubuntu

# Arrêt
wsl --shutdown

# Suppression
wsl --terminate Ubuntu-24.04
wsl --unregister Ubuntu-24.04
```

## Configuration

!!!warning Attention!
    - Il y a deux fichiers `/etc/wsl.conf` (toujours présent) et `/etc/wsl2.conf` (à créer au besoin)
    - Il faut rebooter pour prise en compte des changements (`wsl --shutdown && wsl`)

### Virtualisation imbriquée

Par exemple, pour [KVM](../kvm/README.md), il faudra l'activer comme suit dans `/etc/wsl2.conf` :

```ini
[boot]
systemd=true

[wsl2]
nestedVirtualization=true
```

## Configuration manuelle du DNS

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
* [learn.microsoft.com - Example .wslconfig file](https://learn.microsoft.com/en-us/windows/wsl/wsl-config#example-wslconfig-file)

