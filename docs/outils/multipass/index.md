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

[Multipass](https://canonical.com/multipass) est un outil de Canonical qui permet de créer rapidement des **VM Ubuntu** (mais aussi Debian et Fedora depuis la version 1.17) sous Linux, macOS et Windows.

## Points clés

- Création d'une VM en une commande (`multipass launch`) à partir d'images officielles.
- Configuration de la VM au démarrage avec [cloud-init](../cloud-init/README.md) (`--cloud-init cloud-init.yaml`).
- Même ligne de commande sur Windows, macOS et Linux, avec un hyperviseur natif propre à chaque OS (voir [Systèmes supportés](#systemes-supportes)).
- Partage de fichiers entre l'hôte et la VM (`multipass mount`, `multipass transfer`).

## Installation

Voir [documentation.ubuntu.com - Install Multipass](https://documentation.ubuntu.com/multipass/latest/how-to-guides/install-multipass/) pour l'installation.

## Systèmes supportés

Voir [How to set up the driver](https://documentation.ubuntu.com/multipass/latest/how-to-guides/customise-multipass/set-up-the-driver/) pour le choix de l'hyperviseur (`multipass set local.driver=...`) :

| OS                                             | Driver par défaut | Autres drivers                                                          |
| ---------------------------------------------- | ----------------- | ----------------------------------------------------------------------- |
| Linux                                          | `qemu`            | aucun (LXD et libvirt dépréciés en 1.16, retirés en 1.17[^lxd-libvirt]) |
| macOS 14+ (Intel ou Apple Silicon)             | `qemu`            | `applevz` (en preview), `virtualbox` (Intel uniquement[^virtualbox])    |
| Windows 10/11 1809+ (Famille, Pro, Entreprise) | `hcs`[^hcs]       | `hyperv` (déprécié[^hyperv]), `virtualbox` (déprécié[^virtualbox])      |

## Principales commandes

Les liens pointent vers la référence de la ligne de commande de la [version stable (1.17)](https://documentation.ubuntu.com/multipass/stable/reference/command-line-interface/) :

| Action                                 | Commande                                                                                                                                                                                                                                                   |
| -------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Lister les images disponibles          | [`multipass find`](https://documentation.ubuntu.com/multipass/stable/reference/command-line-interface/find/)[^next]                                                                                                                                        |
| Créer et démarrer une VM               | [`multipass launch -n <nom> --cpus 4 --memory 8G --disk 50G [--cloud-init cloud-init.yaml]`](https://documentation.ubuntu.com/multipass/stable/reference/command-line-interface/launch/)                                                                   |
| Lister les VM (état, adresse IP)       | [`multipass list`](https://documentation.ubuntu.com/multipass/stable/reference/command-line-interface/list/)                                                                                                                                               |
| Afficher le détail d'une VM            | [`multipass info <nom>`](https://documentation.ubuntu.com/multipass/stable/reference/command-line-interface/info/)                                                                                                                                         |
| Ouvrir un shell dans la VM             | [`multipass shell <nom>`](https://documentation.ubuntu.com/multipass/stable/reference/command-line-interface/shell/)                                                                                                                                       |
| Exécuter une commande dans la VM       | [`multipass exec <nom> -- <commande>`](https://documentation.ubuntu.com/multipass/stable/reference/command-line-interface/exec/)                                                                                                                           |
| Monter un dossier de l'hôte dans la VM | [`multipass mount /chemin/hote <nom>:/chemin/vm`](https://documentation.ubuntu.com/multipass/stable/reference/command-line-interface/mount/)                                                                                                               |
| Copier un fichier vers la VM           | [`multipass transfer fichier.txt <nom>:.`](https://documentation.ubuntu.com/multipass/stable/reference/command-line-interface/transfer/)                                                                                                                   |
| Arrêter / démarrer la VM               | [`multipass stop <nom>`](https://documentation.ubuntu.com/multipass/stable/reference/command-line-interface/stop/) / [`multipass start <nom>`](https://documentation.ubuntu.com/multipass/stable/reference/command-line-interface/start/)                  |
| Supprimer la VM                        | [`multipass delete <nom>`](https://documentation.ubuntu.com/multipass/stable/reference/command-line-interface/delete/) puis [`multipass purge`](https://documentation.ubuntu.com/multipass/stable/reference/command-line-interface/purge/)[^next]          |
| Afficher / changer le driver           | [`multipass get local.driver`](https://documentation.ubuntu.com/multipass/stable/reference/command-line-interface/get/) / [`multipass set local.driver=<driver>`](https://documentation.ubuntu.com/multipass/stable/reference/command-line-interface/set/) |

## Cas d'utilisation

- [Création d'une VM de DEV pour VSCode en remote SSH](vm-dev-vscode.md)

## Ressources

- [canonical.com/multipass](https://canonical.com/multipass)
- [documentation.ubuntu.com/multipass](https://documentation.ubuntu.com/multipass/)
- [documentation.ubuntu.com/multipass - Driver](https://documentation.ubuntu.com/multipass/latest/explanation/driver/) (drivers par OS, drivers retirés, différences de fonctionnalités)
- [ubuntu.com - Using cloud-init with Multipass](https://ubuntu.com/blog/using-cloud-init-with-multipass)

[^hcs]: `hcs` s'appuie sur le [Host Compute System](https://learn.microsoft.com/en-us/virtualization/api/hcs/overview) (HCS), l'API native de Windows pour démarrer et piloter des VM et des conteneurs. Contrairement au driver `hyperv`, réservé aux éditions Pro/Entreprise/Éducation, il ne nécessite que la fonctionnalité **Plateforme de machine virtuelle** et fonctionne avec **Windows Famille**. C'est le driver par défaut depuis Multipass 1.17 ; une installation existante conserve son driver (`multipass get local.driver`), voir [Migrate from Hyper-V to the HCS driver on Windows](https://documentation.ubuntu.com/multipass/latest/how-to-guides/customise-multipass/migrate-from-hyperv-to-hcs-on-windows/).
[^lxd-libvirt]: [Multipass 1.16.0 - release notes](https://github.com/canonical/multipass/releases/tag/v1.16.0) (dépréciation, retrait prévu à la version suivante) et [Multipass 1.17.0 - release notes](https://github.com/canonical/multipass/releases/tag/v1.17.0) (« The following features, deprecated in Multipass 1.16, have been removed: [...] The LXD and libvirt drivers »).
[^hyperv]: [Multipass 1.17.0 - release notes](https://github.com/canonical/multipass/releases/tag/v1.17.0) (« This change allows us to deprecate the VirtualBox and Hyper-V drivers on Windows ») et [documentation.ubuntu.com - Migrate from Hyper-V to the HCS driver on Windows](https://documentation.ubuntu.com/multipass/latest/how-to-guides/customise-multipass/migrate-from-hyperv-to-hcs-on-windows/) (« As of Multipass 1.17, the hyperv driver is being deprecated in favour of a new driver, hcs »).
[^virtualbox]: [Multipass 1.17.0 - release notes](https://github.com/canonical/multipass/releases/tag/v1.17.0) (dépréciation sous Windows, « For VirtualBox instances, there is no automatic migration path foreseen » ; maintien sous macOS « QEMU and VirtualBox (Intel/x86 only) ») et [documentation.ubuntu.com - Driver](https://documentation.ubuntu.com/multipass/latest/explanation/driver/) (« As of Multipass version 1.18, VirtualBox is no longer available », macOS et Windows). La version 1.18 n'est pas encore publiée (dernière version : 1.17.1).
[^next]: La [documentation de la prochaine version](https://documentation.ubuntu.com/multipass/latest/reference/command-line-interface/) (branche `main`, non publiée) renomme `multipass find` en [`multipass images`](https://documentation.ubuntu.com/multipass/latest/reference/command-line-interface/images/) et rend `multipass delete` définitif : [`multipass purge`](https://documentation.ubuntu.com/multipass/latest/reference/command-line-interface/purge/) y est déprécié.
