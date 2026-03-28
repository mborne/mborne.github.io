---
tags:
    - Outil
    - Infrastructure as code
    - Cloud
search:
    boost: 3
---

# cloud-init

> 🤖 Rédaction assistée par IA.

[cloud-init](https://cloud-init.io/) est un outil permettant l'initialisation et la configuration automatique d'instances cloud (VM) au démarrage.

## Points clés

* cloud-init **standardise l'initialisation des instances** à travers différents fournisseurs cloud (AWS, Azure, Google Cloud, vSphere, OpenStack, KVM, etc.)
* Les configurations sont **décrites en YAML** dans des directives appelées **cloud-config**.
* Permet de **gérer les utilisateurs**, **installer des packages**, **exécuter des scripts**, **configurer les fichiers** et bien d'autres tâches au démarrage.
* cloud-init est **inclus par défaut** dans les images Linux modernes (Ubuntu, Debian, RHEL, CentOS, etc.)

## Quelques exemples

L'exemple suivant illustre l'utilisation de cloud-init pour **initialiser un utilisateur** et **installer des packages** :

```yaml
#cloud-config
users:
  - name: ubuntu
    groups: sudo
    shell: /bin/bash
    sudo: ALL=(ALL) NOPASSWD:ALL

packages:
  - curl
  - git
  - python3-pip

runcmd:
  - echo "Initialization complete"
```

Voir aussi :

* [cloudinit.readthedocs.io - cloud-init Examples](https://cloudinit.readthedocs.io/en/latest/reference/examples.html)

## Utilisation

### Vérifier l'installation

```bash
cloud-init --version
```

### Contrôler le statut

```bash
cloud-init status
cloud-init status --long
```

### Afficher les logs

```bash
journalctl -u cloud-init
cat /var/log/cloud-init-output.log
```

### Validation et débogage

Pour **valider la syntaxe** cloud-config :

```bash
cloud-init devel schema -c ./user-data.yaml
```

Pour **nettoyer et relancer** cloud-init sur une instance existante :

```bash
sudo cloud-init clean --logs --seed
sudo cloud-init init --local
```

## Expérimentations

* [kvm/create-ubuntu-server.sh](https://github.com/mborne/mborne.github.io/blob/687ad8dc2791e9466b441b9d33b1cd714d4d7df5/docs/outils/kvm/create-ubuntu-server.sh#L91-L166) - user-data (password, package), network-config (DHCP), meta-data (local-hostname) et genisoimage.

## Ressources

* [cloud-init.io](https://cloud-init.io/) - Site officiel et documentation complète
* [cloud-init Documentation](https://cloudinit.readthedocs.io/) - Documentation technique détaillée
* [blog.stephane-robert.info - Cloud-init : automatiser la configuration des VMs cloud](https://blog.stephane-robert.info/docs/cloud/cloud-init/)
