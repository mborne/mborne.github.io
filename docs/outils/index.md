# Les outils

Ce dossier regroupe des **notes (aide mémoire)** et des **scripts d'installation** pour différents outils permettant de **construire rapidement un environnement de développement**.

## Programmation

- [JavaScript](js/README.md)
- [Python](python/README.md)
- [PHP](php/README.md)
- [Java](java/README.md)
- [C++](cxx/README.md)
- [Rust](rust/README.md)
- [Go](go/README.md)

## Virtualisation

- [WSL (Windows Subsystem For Linux)](wsl/README.md)
- [KVM (Kernel-based Virtual Machine)](kvm/README.md)

## Conteneurs

- [Docker](docker/README.md)
- [NVIDIA® CUDA® Toolkit](cuda-toolkit/README.md) avec ***NVIDIA Container Toolkit*** pour `docker run --gpus all ...`.

## Kubernetes

- [Kubernetes](kubernetes/index.md)
- [kubectl](kubectl/README.md)
- [helm](helm/README.md)

Pour installer Kubernetes en local, voir :

- [K3S](k3s/README.md)
- [Kind](kind/README.md) et [mborne/docker-devbox - kind/quickstart.sh](https://github.com/mborne/docker-devbox/tree/master/kind#readme)

Pour une installation sérieuse, voir :

- [blog.stephane-robert.info - Kubernetes - Déploiement de clusters Kubernetes](https://blog.stephane-robert.info/docs/conteneurs/orchestrateurs/kubernetes/installation/) qui présente les différentes options.

## Infrastructure as code

- [Ansible](ansible/README.md)
- [Terraform](terraform/README.md)
- [OpenTofu](opentofu/README.md) (fork de [Terraform](terraform/README.md))
- [Vagrant](vagrant/README.md)
- [cloud-init](https://cloud-init.io/) (voir exemple dans [kvm/create-ubuntu-server.sh](https://github.com/mborne/mborne.github.io/blob/687ad8dc2791e9466b441b9d33b1cd714d4d7df5/docs/outils/kvm/create-ubuntu-server.sh#L91-L166))

## Gestion de fichiers

- [rclone](rclone/README.md)
- [restic](restic/README.md)

## Base de données et SIG

- [DBeaver](dbeaver/README.md) : Un client universel pour les bases de données.
- [qgis](qgis/README.md) : Un SIG libre avec un riche ensemble de fonctionnalités avec le script d'installation et un exemple de carte affichant des données Géoplateforme (WMTS et WFS)
- [postgresql/install-client.sh](postgresql/install-client.sh) (`psql`, `pg_dump`,...)

## Génération de certificats (HTTPS)

> Voir aussi [Lego](https://github.com/go-acme/lego?tab=readme-ov-file#lego) pour automiser le challenge DNS

- [certbot](certbot/README.md)
- [mkcert](mkcert/README.md)

## Documentation

Pour **produire des tableaux en markdown** :

- [tablesgenerator.com - markdown_tables](https://www.tablesgenerator.com/markdown_tables)

Pour **dessiner des schémas** :

* [draw.io](https://www.draw.io/) (desktop) et [www.diagrams.net](https://www.diagrams.net/) (en ligne)

>💡Astuce : Inclure une copie du diagramme en exportant en PNG (`.drawio.png`) permet d'avoir des images éditables!

- [DIA](https://fr.wikipedia.org/wiki/Dia_(logiciel)) et [StarUML](https://staruml.io/) (payant) sont particulièrement efficaces pour les diagrammes UML.
- [GanttProject](https://www.ganttproject.biz/) se focalise sur les [diagrammes de Gantt](https://fr.wikipedia.org/wiki/Diagramme_de_Gantt)

Pour **générer des schémas** (*schema as code*):

- [Mermaid](https://mermaid.js.org/ecosystem/tutorials.html) offre une syntaxe pour **différents types de schéma (Mindmap, diagramme de classe UML, diagramme de Gantt,...)**.
- [Diagrams](diagrams/README.md) s'appuie sur [Graphviz](https://graphviz.org/) avec des classes pour les **schémas d'architecture techniques**.
- [www.websequencediagrams.com](https://www.websequencediagrams.com/) se spécialise sur les **diagrammes de séquences**.

Pour **les spécifications d'API REST** :

- [editor.swagger.io](https://editor.swagger.io/)

Pour **enregistrer le terminal** :

- [asciinema](asciinema/README.md)


## Synthèse vocale (TTS)

- [pico](pico/README.md)
- [piper](piper/README.md)
- [huggingface.co - Models - text-to-speech](https://huggingface.co/models?pipeline_tag=text-to-speech&sort=downloads)
    - [coqui/XTTS-v2](https://huggingface.co/coqui/XTTS-v2)

## LLM

> Voir fiches ["Les LLM"](../fiches/llm/index.md) et [MCP (Model Context Protocol)](../fiches/mcp/index.md).

- [Ollama](ollama/index.md) (CLI et API REST/JSON)
- [Hugging Face - Text Generation](huggingface/index.md#text-generation) (Python)
- [Open WebUI](https://docs.openwebui.com/) (application web)
    - [mborne/docker-devbox - open-webui](https://github.com/mborne/docker-devbox/tree/master/open-webui)

Bibliothèques :

- [JavaScript - langchain-js](js/README.md#llm)
- [Python - langchain-js](python/README.md#llm)

## Antivirus

- [ClamAV](clamav/README.md)

## Réseau

- [dig](dig/index.md) pour **tester la résolution de nom**.
- [dnasmasq](dnsmasq/index.md) pour installer un **serveur DNS**.
- [ufw](ufw/README.md) pour configurer le **pare-feu local** (alternatives : utiliser directement iptables / nftables)
- [miniupnpc](miniupnpc/README.md)

## Sécurité

**Scanner de vulnérabilités** pour Docker et Kubernetes :

- [Trivy](trivy/README.md)
- [Kubescape](kubescape/README.md)

Contrôle de la **configuration TLS** et des **entêtes de sécurité** :

- [www.sslshopper.com - SSL Checker](https://www.sslshopper.com/ssl-checker.html) : **Contrôle de la configuration TLS** (particulièrement efficace pour détecter des problèmes récurrent liés à l'absence des certificats intermédiaires)
- [securityheaders.com](https://securityheaders.com) : Contrôle de configuration des [entètes de sécurité (Strict-Transport-Security (HSTS), Content-Security-Policy (CSP),...)](https://www.anopixel.fr/en-tetes-de-securite-http-security-headers.html)

Durcissement de la configuration des serveurs (SSH, PostgreSQL, Nginx,...) :

- [dev-sec.io](https://dev-sec.io/) : Recommandations avec une **approche DevSecOps inspirante** (chaque recommandation est la documentation d'un test automatisé et de solutions de remédiation incluant des playbooks ansible)

## Licence

[MIT](https://github.com/mborne/mborne.github.io/blob/main/LICENSE)
