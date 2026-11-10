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

[Multipass](https://canonical.com/multipass) est un outil de Canonical qui permet de créer rapidement des **VM Ubuntu** sous Windows, macOS et Linux. Les VM peuvent être configurées au démarrage avec [cloud-init](../cloud-init/README.md).

## Points clés

- Création d'une VM en une commande (`multipass launch`) à partir d'images officielles (Ubuntu LTS, mais aussi Debian et Fedora depuis la version 1.17).
- Configuration de la VM au démarrage avec cloud-init (`--cloud-init cloud-init.yaml`).
- Même ligne de commande sur Windows, macOS et Linux, avec un hyperviseur natif propre à chaque OS (voir [Systèmes supportés](#systemes-supportes)).
- Partage de fichiers entre l'hôte et la VM (`multipass mount`, `multipass transfer`).

## Systèmes supportés

Voir [documentation.ubuntu.com - Install Multipass](https://documentation.ubuntu.com/multipass/latest/how-to-guides/install-multipass/) pour l'installation.
Voir [How to set up the driver](https://documentation.ubuntu.com/multipass/latest/how-to-guides/customise-multipass/set-up-the-driver/) pour le choix de l'hyperviseur (`multipass set local.driver=...`) :

| OS                                             | Installation | Driver par défaut | Autres drivers                         |
| ---------------------------------------------- | ------------ | ----------------- | -------------------------------------- |
| Linux                                          | `snap`       | `qemu`            | aucun (LXD et libvirt retirés en 1.16) |
| macOS 14+ (Intel ou Apple Silicon)             | `.pkg`       | `qemu`            | `applevz` (en preview)                 |
| Windows 10/11 1809+ (Famille, Pro, Entreprise) | `.msi`       | `hcs`             | `hyperv` (déprécié en 1.17)            |

!!! warning "Windows : driver `hcs` ou `hyperv` ?"

    Depuis Multipass 1.17, le driver par défaut sous Windows est `hcs` (Host Compute System) : il ne nécessite que la fonctionnalité **Plateforme de machine virtuelle** et fonctionne avec **Windows Famille**.
    L'ancien driver `hyperv` est **déprécié** et **réservé aux éditions Pro/Entreprise/Éducation** (Hyper-V n'est pas disponible avec Windows Famille). Une installation existante conserve son driver (`multipass get local.driver`) ; voir [Migrate from Hyper-V to the HCS driver](https://documentation.ubuntu.com/multipass/latest/how-to-guides/customise-multipass/migrate-from-hyperv-to-hcs-on-windows/).
    VirtualBox n'est plus disponible depuis Multipass 1.18.

## Principales commandes

| Action                                 | Commande                                                                                   |
| -------------------------------------- | ------------------------------------------------------------------------------------------ |
| Lister les images disponibles          | `multipass images`                                                                         |
| Créer et démarrer une VM               | `multipass launch -n <nom> --cpus 4 --memory 8G --disk 50G [--cloud-init cloud-init.yaml]` |
| Lister les VM (état, adresse IP)       | `multipass list`                                                                           |
| Afficher le détail d'une VM            | `multipass info <nom>`                                                                     |
| Ouvrir un shell dans la VM             | `multipass shell <nom>`                                                                    |
| Exécuter une commande dans la VM       | `multipass exec <nom> -- <commande>`                                                       |
| Monter un dossier de l'hôte dans la VM | `multipass mount /chemin/hote <nom>:/chemin/vm`                                            |
| Copier un fichier vers la VM           | `multipass transfer fichier.txt <nom>:.`                                                   |
| Arrêter / démarrer la VM               | `multipass stop <nom>` / `multipass start <nom>`                                           |
| Supprimer la VM                        | `multipass delete <nom>` puis `multipass purge`                                            |
| Afficher / changer le driver           | `multipass get local.driver` / `multipass set local.driver=<driver>`                       |

## Virtualisation imbriquée

Pour exécuter des VM (ex : KVM) dans une VM Multipass, il faut exposer les extensions de virtualisation à la VM.

Avec le driver `hyperv` (Windows Pro/Entreprise/Éducation, PowerShell en tant qu'administrateur) :

```powershell
multipass stop <nom>
Set-VMProcessor -VMName <nom> -ExposeVirtualizationExtensions $true
multipass start <nom>
```

!!! warning "Non vérifié avec le driver `hcs`"

    `Set-VMProcessor` agit sur une VM **Hyper-V**. La documentation Multipass ne décrit pas la virtualisation imbriquée avec le driver `hcs` (par défaut depuis 1.17, seul driver possible avec Windows Famille).

## Ressources

- [Multipass - création d'une VM de DEV pour VSCode en remote SSH](vm-dev-vscode.md)
- [canonical.com/multipass](https://canonical.com/multipass)
- [documentation.ubuntu.com/multipass](https://documentation.ubuntu.com/multipass/)
- [documentation.ubuntu.com/multipass - Driver](https://documentation.ubuntu.com/multipass/latest/explanation/driver/) (drivers par OS, drivers retirés, différences de fonctionnalités)
- [ubuntu.com - Using cloud-init with Multipass](https://ubuntu.com/blog/using-cloud-init-with-multipass)
