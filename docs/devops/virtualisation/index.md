# DevOps - La virtualisation

> 🤖 Rédaction assistée par IA.

## Contexte

Les machines virtuelles restent la brique de base des infrastructures IaaS et des environnements de développement. Cette fiche vient en complément du cours [DevOps avec des VM](https://mborne.github.io/cours-devops/vm.html) qui :

- Décrit la mise en oeuvre de [Infrastructure as Code](../iac/index.md) pour déployer sur des VM.
- Met en évidence les problèmes de partage de responsabilité sur les VM (résolu par [les conteneurs](https://mborne.github.io/cours-devops/conteneurs.html))
- Met en évidence le besoin de traiter des problématiques à l'échelle de zone d'hébergement (*landing zone*) ainsi que le problème de partage de responsabilité sur ces zone d'hébergement (IaaS) qui est résolu par Kubernetes.

Elle se concentre sur les solutions utilisables **en local, sur un poste de travail** (développement, expérimentations). Les solutions des centres de données sont listées dans la section [Voir aussi](#voir-aussi).

## Les hyperviseurs

Ils exécutent les machines virtuelles :

- [KVM](../../outils/kvm/README.md) : hyperviseur intégré au noyau Linux (accélération matérielle)
- [QEMU](../../outils/qemu/README.md) : émulation et virtualisation de machines (accéléré par KVM sous Linux)
- [Hyper-V](https://learn.microsoft.com/fr-fr/virtualization/hyper-v-on-windows/about/) : hyperviseur de Windows, utilisable de deux manières :
    - **Hyper-V** (éditions Pro/Entreprise/Éducation) : gestion complète des VM (Gestionnaire Hyper-V, cmdlets PowerShell comme `Set-VMProcessor`...)
    - **[Host Compute System (HCS)](https://learn.microsoft.com/fr-fr/virtualization/api/hcs/overview)** (toutes éditions, y compris Famille, avec la fonctionnalité **Plateforme de machine virtuelle**) : API bas niveau pour piloter des VM et des conteneurs,
      utilisée notamment par [WSL2](https://wsl.dev/technical-documentation/boot-process/) et [Multipass](../../outils/multipass/index.md) (driver `hcs`)
- [VirtualBox](https://www.virtualbox.org/) : hyperviseur multi-plateforme (Windows, Linux, macOS Intel)

## Les gestionnaires de VM

Ils simplifient la création et la gestion des VM en s'appuyant sur un hyperviseur :

- [libvirt](../../outils/libvirt/README.md) : gestion centralisée des VM (KVM/QEMU) avec `virsh` et `virt-manager`
- [Vagrant](../../outils/vagrant/README.md) : création de VM *as code* (VirtualBox, libvirt, Hyper-V...)
- [Multipass](../../outils/multipass/index.md) : création de VM Ubuntu configurées avec cloud-init (QEMU sous Linux et macOS, HCS ou Hyper-V sous Windows)
- [Lima VM](../../outils/lima-vm/README.md) : création de VM Linux légères (QEMU)
- [WSL (Windows Subsystem For Linux)](../../outils/wsl/README.md) : exécution de distributions Linux sous Windows dans une VM légère (fonctionnalité **Plateforme de machine virtuelle**)

## Voir aussi

Les solutions de virtualisation pour les **serveurs** et les **centres de données** :

- [OpenStack](https://www.openstack.org/) : plateforme IaaS open source qui pilote des hyperviseurs (principalement KVM), utilisée pour des clouds privés comme publics (ex : [OVHcloud Public Cloud](https://www.ovhcloud.com/fr/public-cloud/))
- [Proxmox VE](https://www.proxmox.com/en/products/proxmox-virtual-environment/overview) : plateforme de virtualisation open source basée sur KVM (et LXC pour les conteneurs) avec interface web
- [VMware vSphere (ESXi)](https://www.vmware.com/products/cloud-infrastructure/vsphere) : plateforme de virtualisation propriétaire
