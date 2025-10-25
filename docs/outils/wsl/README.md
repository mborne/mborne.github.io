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

## Configuration pour installation de KVM

Dans `/etc/wsl2.conf` :

```bash
[boot]
systemd=true
#command = /bin/bash -c 'chown -v root:kvm /dev/kvm && chmod 660 /dev/kvm'
kernelCommandLine=amd_iommu=on iommu=pt kvm.ignore_msrs=1 kvm-amd.nested=1 kvm-amd.ept=1 kvm-amd.emulate_invalid_guest_state=0 kvm-amd.enable_shadow_vmcs=1 kvm-amd.enable_apicv=1

[wsl2]
nestedVirtualization=true
```

## Configuration manuelle du DNS

* Dans `/etc/wsl.conf` :

```conf
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

