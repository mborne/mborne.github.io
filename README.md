# mborne/toolbox

Ce dépôt regroupe des notes et des scripts d'installation pour différents outils.

## Motivation

Ce dépôt vient en complément de [mborne/docker-devbox](https://github.com/mborne/docker-devbox) pour **construire un environnement de développement jetable** par exemple avec [WSL](wsl/README.md) :

```bash
wsl --install Ubuntu-22.04
#... une fois dans la machine
git clone https://github.com/mborne/toolbox

#-----------------------------------------------
# Installation de NodeJS
#-----------------------------------------------
bash toolbox/nodejs/install.sh

#-----------------------------------------------
# Installation de docker avec des capacités GPU
# (ex : OpenWEB UI)
#-----------------------------------------------

# installer docker
bash toolbox/docker/install.sh
# installer cuda-toolkit (sans le driver déjà installé sur Windows)
bash toolbox/cuda-toolkit/install-wsl.sh
# ajouter le support GPU à docker
bash toolbox/cuda-toolkit/install-container-toolkit.sh
```

## Mise en garde

* Ce dépôt est mis à disposition en public sur GitHub bien qu'il ne soit pas finalisé (les scripts ne sont pas blindés, la documentation n'est pas propre,...) par commodité (ex : pouvoir l'utiliser sur une VM cloud sans avoir à m'authentifier)
* **Les scripts ont vocation à être utilisé sur une machine personnelle jetable** (VM VirtualBox, WSL2,...)
* Certains **scripts et outils ne sont pas adaptés pour une utilisation en entreprise**

## Vue d'ensemble

### Programmation

* [nodejs/install.sh](nodejs/install.sh)
* [php/install.sh](php/install.sh)
* [go/install.sh](go/install.sh)
* [conda](conda/README.md) avec [conda:install-miniconda.sh](conda:install-miniconda.sh)


### Virtualisation

* [wsl - Windows Subsystem For Linux](wsl/README.md)
* [kvm - Kernel-based Virtual Machine](kvm/README.md)

### Conteneurs

* [docker](docker/README.md) avec [docker/install.sh](docker/install.sh)
* [cuda-toolkit](cuda-toolkit/README.md) avec :
  * [cuda-toolkit/install-wsl.sh](cuda-toolkit/install-wsl.sh) pour son installation en contexte [WSL](wsl/README.md)
  * [cuda-toolkit/install-container-toolkit.sh](cuda-toolkit/install-container-toolkit.sh) pour son utilisation via docker

### Kubernetes

Les principaux clients :

* [kubectl](kubectl/README.md) avec [kubectl/install.sh](kubectl/install.sh)
* [helm](helm/README.md) avec [helm/install.sh](helm/install.sh)

Pour une installation en local :

* [kind/install.sh](kind/install.sh) pour [mborne/docker-devbox - kind/quickstart.sh](https://github.com/mborne/docker-devbox/tree/master/kind#readme) (**ne pas débuter Kubernetes avec cette option**)
* [minikube](minikube/README.md) avec [minikube/install.sh](minikube/install.sh) (alternatives possibles : [K3S](https://k3s.io/) ou [MicroK8S](https://microk8s.io/) par exemple)

### Cloud et IaC

* [ansible/install.sh](ansible/install.sh)
* [hashicorp](hashicorp/README.md) avec [hashicorp/add-repository.sh](hashicorp/add-repository.sh) pour installer facilement terraform, vagrant, packer...
* [terraform](terraform/README.md) avec [terraform/install.sh](terraform/install.sh) qui s'appuie sur [hashicorp/add-repository.sh](hashicorp/add-repository.sh)
* [gcloud/install.sh](gcloud/install.sh)

### Gestion de fichiers

* [rclone/install.sh](rclone/install.sh)
* [restic/install.sh](restic/install.sh)

### Base de données et SIG

* [dbeaver/install.sh](dbeaver/install.sh)
* [qgis/install.sh](qgis/install.sh) pour [QGIS](https://www.qgis.org/en/site/index.html#)
* [postgresql/install-client.sh](postgresql/install-client.sh) (`psql`, `pg_dump`,...)

### Génération de certificats (HTTPS)

> Voir aussi [Lego](https://github.com/go-acme/lego?tab=readme-ov-file#lego) pour automiser le challenge DNS

* [certbot/install.sh](certbot/install.sh)
* [mkcert](mkcert/README.md) avec **mise en garde** et [mkcert/install.sh](mkcert/install.sh)

### Production de documentation

* [drawio](https://www.drawio.com/) pour produire des schémas (astuce : exporter en `.drawio.png` en incluant le schéma permet d'obtenir une image éditable!)
* [asciinema](asciinema/README.md) pour enregistrer le terminal.
* [diagrams](diagrams/README.md) pour générer des schémas.

### Synthèse vocale

* [pico](pico/README.md) avec [pico/install.sh](pico/install.sh) et [pico/say.sh](pico/say.sh)
* [piper](piper/README.md) avec [piper/create-venv.sh](piper/create-venv.sh) et [piper/say.sh](piper/say.sh)

### Sécurité

* [trivy/install.sh](trivy/install.sh)
* [ClamAV](clamav/README.md) avec [clamav/install.sh](clamav/install.sh)

### Réseau

* [ufw](ufw/README.md)
* [wireguard](wireguard/README.md)

## Licence

[MIT](LICENSE)
