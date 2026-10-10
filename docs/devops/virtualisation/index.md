# DevOps - La virtualisation

## Contexte

Les machines virtuelles restent la brique de base des infrastructures IaaS et des environnements de développement. Cette fiche vient en complément du cours [DevOps avec des VM](https://mborne.github.io/cours-devops/vm.html) qui :

- Décrit la mise en oeuvre en oeuvre de [Infrastructure as Code](../iac/index.md) pour déployer sur des VM.
- Met en évidence les problèmes de partage de responsabilité sur les VM (résolu par [les conteneurs](https://mborne.github.io/cours-devops/conteneurs.html))
- Met en évidence le besoin de traiter des problématiques à l'échelle de zone d'hébergement (*landing zone*) ainsi que le problème de partage de responsabilité sur ces zone d'hébergement (IaaS) qui est résolu par Kubernetes.

## Les outils

* [WSL (Windows Subsystem For Linux)](../../outils/wsl/README.md)
* [VirtualBox](https://www.virtualbox.org/)
* [QEMU](../../outils/qemu/README.md) : émulation de machines virtuelles
* [KVM](../../outils/kvm/README.md) : accélération matérielle du noyau Linux
* [libvirt](../../outils/libvirt/README.md) : gestion centralisée des VM
* [Lima VM](../../outils/lima-vm/README.md)
