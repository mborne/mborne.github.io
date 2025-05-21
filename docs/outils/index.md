# Les outils

Ce dossier regroupe des notes (aide mémoire) et des scripts d'installation pour différents outils.

!!!warning "Mise en garde"
    - **Certains scripts ont vocation à être utilisé sur une machine personnelle jetable** (ex : VM VirtualBox, [WSL2](wsl/README.md),...)
    - Ces fiches et scripts d'installation sont mis à disposition sur GitHub bien qu'ils ne soient pas tous finalisés (la documentation peut être plus propre, **les scripts ne sont pas blindés**,...)
    - Certains **scripts et outils ne sont pas adaptés pour une utilisation en entreprise**.

## Programmation

- [JavaScript](js/README.md)
- [Python](python/README.md)
- [Conda](conda/README.md)
- [PHP](php/README.md)
- [Java](java/README.md)
- [C++](cxx/README.md)
- [Rust](rust/README.md)
- [Go](go/README.md)

## Virtualisation

- [wsl - Windows Subsystem For Linux](wsl/README.md)
- [kvm - Kernel-based Virtual Machine](kvm/README.md)

## Conteneurs

- [docker](docker/README.md) avec [docker/install.sh](docker/install.sh)
- [cuda-toolkit](cuda-toolkit/README.md) avec :
    - [cuda-toolkit/install-wsl.sh](cuda-toolkit/install-wsl.sh) pour son installation en contexte [WSL](wsl/README.md)
    - [cuda-toolkit/install-container-toolkit.sh](cuda-toolkit/install-container-toolkit.sh) pour son utilisation via docker

## Kubernetes

Les principaux clients :

- [kubectl](kubectl/README.md) avec [kubectl/install.sh](kubectl/install.sh)
- [helm](helm/README.md) avec [helm/install.sh](helm/install.sh)

Pour une installation en local :

- [kind/install.sh](kind/install.sh) pour [mborne/docker-devbox - kind/quickstart.sh](https://github.com/mborne/docker-devbox/tree/master/kind#readme) (**ne pas débuter Kubernetes avec cette option**)
- [k3s](k3s/README.md)
- [minikube](minikube/README.md) avec [minikube/install.sh](minikube/install.sh) (alternatives possibles : [K3S](https://k3s.io/) ou [MicroK8S](https://microk8s.io/) par exemple)

## Cloud et IaC

- [ansible](ansible/README.md)
- [hashicorp](hashicorp/README.md) avec [hashicorp/add-repository.sh](hashicorp/add-repository.sh) pour installer facilement terraform, vagrant, packer...
- [Terraform](terraform/README.md)
- [OpenTofu](opentofu/README.md)
- [gcloud/install.sh](gcloud/install.sh)

## Gestion de fichiers

- [rclone/install.sh](rclone/install.sh)
- [restic/install.sh](restic/install.sh)

## Base de données et SIG

- [dbeaver/install.sh](dbeaver/install.sh)
- [qgis](qgis/README.md) : un SIG libre avec un riche ensemble de fonctionnalités
    - [qgis/install.sh](qgis/install.sh) : Script d'installation sous Ubuntu.
    - [qgis/helloworld-gpf.qgz](qgis/helloworld-gpf.qgz) : Exemple de carte affichant des données Géoplateforme.
- [postgresql/install-client.sh](postgresql/install-client.sh) (`psql`, `pg_dump`,...)

## Génération de certificats (HTTPS)

> Voir aussi [Lego](https://github.com/go-acme/lego?tab=readme-ov-file#lego) pour automiser le challenge DNS

- [certbot](certbot/README.md)
- [mkcert](mkcert/README.md)

## Production de documentation

- [drawio](https://www.drawio.com/) pour produire des schémas (astuce : exporter en `.drawio.png` en incluant le schéma permet d'obtenir une image éditable!)
- [asciinema](asciinema/README.md) pour enregistrer le terminal.
- [diagrams](diagrams/README.md) pour générer des schémas.

## Synthèse vocale (TTS)

- [pico](pico/README.md) avec [pico/install.sh](pico/install.sh) et [pico/say.sh](pico/say.sh)
- [piper](piper/README.md) avec [piper/create-venv.sh](piper/create-venv.sh) et [piper/say.sh](piper/say.sh)
- [huggingface.co - Models - text-to-speech](https://huggingface.co/models?pipeline_tag=text-to-speech&sort=downloads)
    - [coqui/XTTS-v2](https://huggingface.co/coqui/XTTS-v2)

## LLM

> Voir aussi [github.com - mborne/llm-experimentations](https://github.com/mborne/llm-experimentations/tree/main?tab=readme-ov-file#llm-experimentations)

API en self-hosted :

- [ollama](https://github.com/ollama/ollama#readme) : API permettant d'exploiter des grands modèles de langage (LLMs).
    - [ollama-models](https://ollama.com/search): Liste des modèles LLMs disponibles sur Ollama
    - [ollama-api](https://github.com/ollama/ollama/blob/main/docs/api.md): Documentation d'API Ollama
    - [mborne/docker-devbox - ollama](https://github.com/mborne/docker-devbox/tree/master/ollama#readme)

UI de style ChatGPT :

- [openwebui](https://docs.openwebui.com/) : Interface graphique offrant des fonctionnalités d'IA basées sur les modèles de langage.
    - [mborne/docker-devbox - open-webui](https://github.com/mborne/docker-devbox/tree/master/open-webui#readme)

Bibliothèques :

- [langchain-python](https://python.langchain.com/docs/tutorials/): Framework pour le développement d'application s'appuyant sur des grands modèles de langage (LLMs).
- [langchain-js](https://js.langchain.com/docs/tutorials/): Version JavaScript de langchain.

MCP :

- [Model Context Protocol servers](https://github.com/modelcontextprotocol/servers?tab=readme-ov-file#model-context-protocol-servers) : liste de serveurs existants
- [mcp-framework.com - Quickstart](https://mcp-framework.com/docs/quickstart/) : pour développer son propre MCP
    - [github.com - mborne/llm-experimentations - mcp-server-gpf](https://github.com/mborne/llm-experimentations/tree/main/mcp-server-gpf#readme) : test d'implémentation d'un serveur MCP appelant un service Géoplateforme

## Antivirus

- [ClamAV](clamav/README.md) avec [clamav/install.sh](clamav/install.sh)

## Réseau

- [ufw](ufw/README.md)
- [wireguard](wireguard/README.md)
- [miniupnpc](miniupnpc/README.md)

## Sécurité

Scanner de vulnérabilité pour Docker et Kubernetes :

- [Trivy](trivy/README.md) avec [trivy/install.sh](trivy/install.sh)
- [Kubescape](kubescape/README.md)

TLS et entêtes de sécurité :

- [www.sslshopper.com - SSL Checker](https://www.sslshopper.com/ssl-checker.html) : **Contrôle de la configuration TLS** (particulièrement efficace pour détecter des problèmes récurrent liés à l'absence des certificats intermédiaires)
- [securityheaders.com](https://securityheaders.com) : Contrôle de configuration des [entètes de sécurité (Strict-Transport-Security (HSTS), Content-Security-Policy (CSP),...)](https://www.anopixel.fr/en-tetes-de-securite-http-security-headers.html)

Durcissement de la configuration des serveurs (SSH, PostgreSQL, Nginx,...) :

- [dev-sec.io](https://dev-sec.io/) : Recommandations avec une **approche DevSecOps inspirante** (chaque recommandation est la documentation d'un test automatisé et de solutions de remédiation incluant des playbooks ansible)

## Licence

[MIT](https://github.com/mborne/mborne.github.io/blob/main/LICENSE)
