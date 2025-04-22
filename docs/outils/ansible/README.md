# Ansible

## Installation

* [ansible/install.sh](install.sh) ajoute le dépôt "ppa:ansible/ansible" et installe le package :

```bash
curl -sS https://mborne.github.io/outils/ansible/install.sh | bash
```

* [ansible/create-venv.sh](create-venv.sh) exploite `python3 -m venv ~/ansible-venv` pour isoler l'installation :

```bash
curl -sS https://mborne.github.io/outils/ansible/create-venv.sh | bash
```

## Utilisation

Voir [mborne.github.io - annexe Ansible](https://mborne.github.io/cours-devops/annexe/ansible.html) pour les généralités.

Pour l'option `~/ansible-venv` :

```bash
# activer l'utilisation de ansible
source ~/ansible-venv/bin/activate

# tester le fonctionnement
ansible --version
ansible -l localhost -m ping localhost

# arrêter d'utiliser ansible
deactivate
```
