# Les outils

Ce dossier regroupe des **notes (aide mémoire)** et des **scripts d'installation** pour différents outils permettant de **construire rapidement un environnement de développement**.

!!!warning "Mise en garde"
    - Ces fiches et scripts d'installation sont perfectibles (voir [issue 5](https://github.com/mborne/mborne.github.io/issues/5))
    - Certains scripts et outils (ex : [mkcert](mkcert/README.md)) ne sont pas adaptés pour une utilisation en entreprise a vocation à être utilisé sur une machine personnelle jetable).

## Programmation

- [JavaScript](js/README.md)
- [Python](python/README.md)
- [PHP](php/README.md)
- [Java](java/README.md)
- [C++](cxx/README.md)
- [Rust](rust/README.md)
- [Go](go/README.md)

## Virtualisation

- [wsl - Windows Subsystem For Linux](wsl/README.md)
- [kvm - Kernel-based Virtual Machine](kvm/README.md)

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

## Cloud et IaC

- [Ansible](ansible/README.md)
- [Terraform](terraform/README.md)
- [OpenTofu](opentofu/README.md) (fork de [Terraform](terraform/README.md))
- [Vagrant](vagrant/README.md)

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
