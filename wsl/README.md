# Windows Subsystem for Linux (WSL)

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
wsl --install -d Ubuntu-22.04

# Démarrer la distribution ubuntu
wsl --distribution Ubuntu-22.04 --user ubuntu

# Arrêt
wsl --shutdown

# Suppression
wsl --terminate Ubuntu-22.04
wsl --unregister Ubuntu-22.04
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

```
nameserver 1.1.1.1
nameserver 1.0.0.1
```


## Ressources

* [learn.microsoft.com - Comment installer Linux sur Windows avec WSL](https://learn.microsoft.com/fr-fr/windows/wsl/install)
* [learn.microsoft.com - Commandes de base pour WSL](https://learn.microsoft.com/fr-fr/windows/wsl/basic-commands)
