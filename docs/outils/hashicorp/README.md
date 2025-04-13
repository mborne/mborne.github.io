# hashicorp

Ce dossier contient un script pour l'ajout du dépôt [HashiCorp](https://www.hashicorp.com/)

## Utilisation

Le script [hashicorp/add-repository.sh](add-repository.sh) configure `/etc/apt/sources.list.d/hashicorp.list`. Il est ensuite possible d'installer les outils

```bash
sudo apt-get update
sudo apt-get install -y vagrant
sudo apt-get install -y terraform
sudo apt-get install -y packer
#...
```
