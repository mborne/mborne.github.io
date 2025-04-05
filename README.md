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

> Migration de notes et exemples Python / C++ en cours...

* [JavaScript](js/README.md)
  * [js/install-nodejs.sh](js/install-nodejs.sh)
* [PHP](php/README.md)
  * [php/install.sh](php/install.sh)
  * [php/install-composer.sh](php/install-composer.sh)
  * [php/install-symfony.sh](php/install-symfony.sh)
* [go/install.sh](go/install.sh)
* [conda](conda/README.md) avec [conda:install-miniconda.sh](conda:install-miniconda.sh)
* [Java](java/README.md)
* [Rust](rust/README.md)

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
* [k3s](k3s/README.md)
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
* [qgis](qgis/README.md) : un SIG libre avec un riche ensemble de fonctionnalités
  * [qgis/install.sh](qgis/install.sh) : Script d'installation sous Ubuntu.
  * [qgis/helloworld-gpf](qgis/helloworld-gpf) : Exemple de carte affichant des données Géoplateforme.
* [postgresql/install-client.sh](postgresql/install-client.sh) (`psql`, `pg_dump`,...)

### Génération de certificats (HTTPS)

> Voir aussi [Lego](https://github.com/go-acme/lego?tab=readme-ov-file#lego) pour automiser le challenge DNS

* [certbot/install.sh](certbot/install.sh)
* [mkcert](mkcert/README.md) avec **mise en garde** et [mkcert/install.sh](mkcert/install.sh)



### Production de documentation

* [drawio](https://www.drawio.com/) pour produire des schémas (astuce : exporter en `.drawio.png` en incluant le schéma permet d'obtenir une image éditable!)
* [asciinema](asciinema/README.md) pour enregistrer le terminal.
* [diagrams](diagrams/README.md) pour générer des schémas.

### Synthèse vocale (TTS)

* [pico](pico/README.md) avec [pico/install.sh](pico/install.sh) et [pico/say.sh](pico/say.sh)
* [piper](piper/README.md) avec [piper/create-venv.sh](piper/create-venv.sh) et [piper/say.sh](piper/say.sh)
* [huggingface.co - Models - text-to-speech](https://huggingface.co/models?pipeline_tag=text-to-speech&sort=downloads)
  * [coqui/XTTS-v2](https://huggingface.co/coqui/XTTS-v2)

### Antivirus

* [ClamAV](clamav/README.md) avec [clamav/install.sh](clamav/install.sh)

### Réseau

* [ufw](ufw/README.md)
* [wireguard](wireguard/README.md)
* [miniupnpc](miniupnpc/README.md)

### Sécurité

Scanner de vulnérabilité pour Docker et Kubernetes :

* [Trivy](trivy/README.md) avec [trivy/install.sh](trivy/install.sh)
* [Kubescape](kubescape/README.md)

TLS et entêtes de sécurité :

* [www.sslshopper.com - SSL Checker](https://www.sslshopper.com/ssl-checker.html) : **Contrôle de la configuration TLS** (particulièrement efficace pour détecter des problèmes récurrent liés à l'absence des certificats intermédiaires)
* [securityheaders.com](https://securityheaders.com) : Contrôle de configuration des [entètes de sécurité (Strict-Transport-Security (HSTS), Content-Security-Policy (CSP),...)](https://www.anopixel.fr/en-tetes-de-securite-http-security-headers.html)

Durcissement de la configuration des serveurs (SSH, PostgreSQL, Nginx,...) :

* [dev-sec.io](https://dev-sec.io/) : Recommandations avec une **approche DevSecOps inspirante** (chaque recommandation est la documentation d'un test automatisé et de solutions de remédiation incluant des playbooks ansible)

## Licence

[MIT](LICENSE)
