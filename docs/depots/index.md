---
date: 2025-04-13
---

# Les dépôts

Cette page correspond à un travail d'inventaire de mes dépôts personnels sur GitHub visant à donner une vue d'ensemble.

## Cours ENSG (français)

* [mborne/cours-devops](https://github.com/mborne/cours-devops)
    * [mborne.github.io/cours-devops - Introduction à la méthode DevOps](https://mborne.github.io/cours-devops/#1)
* [mborne/cours-patron-conception](https://github.com/mborne/cours-patron-conception)
    * [mborne.github.io/cours-patron-conception - Les patrons de conception](https://mborne.github.io/cours-patron-conception/#1)
* [mborne/cours-archi-si-geo](https://github.com/mborne/cours-archi-sig-geo)
    * [mborne.github.io/cours-archi-si-geo - Introduction à l'architecture des SI](https://mborne.github.io/cours-archi-si-geo/#1)

## DevOps

### Les conteneurs

Terrain de jeu pour docker ou Kubernetes :

* [mborne/docker-devbox](https://github.com/mborne/docker-devbox) permet de configurer un environnement de développement avec Docker ou Kubernetes.

Quelques exemples en **français** rédigés dans le cadre de [cours-devops](https://mborne.github.io/cours-devops/#1) :

* [mborne/docker-exemples](https://github.com/mborne/docker-exemples?tab=readme-ov-file#readme) pour **découvrir docker**
* [mborne/k8s-exemples](https://github.com/mborne/k8s-exemples) pour **découvrir Kubernetes**
* [mborne/geostack-deploy - docker](https://github.com/mborne/geostack-deploy/tree/master/docker) qui illustre le déploiement d'une stack PostGIS et GeoServer avec **docker compose**

Quelques exemples d'**images docker** avec publiées sur [GitHub Container Registry (gcr.io)](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry) à l'aide de **GitHub actions** :

* [mborne/terminal](https://github.com/mborne/terminal) permet une **créer facilement un Pod de debug pour Kubernetes** avec des **outils de débogage (curl, wget, ping, ...)** pré-installés.
* [mborne/debug](https://github.com/mborne/debug) permet d'**illustrer certaines fonctionnalités de Docker et Kubernetes** (redémarrage automatiques, limites de mémoire, ...)
* [mborne/docker-postgis](https://github.com/mborne/docker-postgis) étend l'image **PostgreSQL avec les extensions PostGIS, ogr_fwd et pgrouting** (**dépréciée**, voir [postgis/postgis](https://hub.docker.com/r/postgis/postgis) et [esgn/pgtuned](https://github.com/esgn/pgtuned))
* [mborne/docker-jenkins](https://github.com/mborne/docker-jenkins) - jenkins/jenkins:lts avec CLI docker sur le nœud maître (**dépréciée**)
* [mborne/docker-geoserver](https://github.com/mborne/docker-geoserver) - Construction et publication de l'image [ghcr.io/mborne/geoserver](https://github.com/mborne/docker-geoserver/pkgs/container/geoserver) (**en français**, documentée pour [cours-devops](https://mborne.github.io/cours-devops/#1))

### Helm

* [mborne/helm-charts](https://github.com/mborne/helm-charts) quelques **charts helm** rédigé pour **tester la publication sous forme d'image docker (OCI)**

### Terraform

Quelques exemples écrits pour **débuter avec Terraform** :

* [mborne/gke-playground](https://github.com/mborne/gke-playground) - Expérimenter la construction d'une petite zone d'atterrissage avec Terraform avec Google Kubernetes Engine (GKE) (**en français**)
* [mborne/gce-playground](https://github.com/mborne/gce-playground) - Expérimenter le travail avec Terraform et Ansible avec Google Compute Engine (GCE) (**en français**)

### Ansible et Vagrant

Quelques **rôles ansible** principalement écrits pour expérimenter des déploiements sur Raspberry PI et sur une VM perso bon marché (<https://www.quadtreeworld.net/>) :

* [mborne/ansible-docker-ce](https://github.com/mborne/ansible-docker-ce) permet de **déployer docker (community edition)** en suivant les recommandations de [docker-bench-for-security](https://github.com/docker/docker-bench-security?tab=readme-ov-file#docker-bench-for-security).
* [mborne/ansible-traefik](https://github.com/mborne/ansible-traefik) permet de **déployer traefik en tant que service systemd** (pour éviter le partage de réseau dans docker et faciliter le filtrage par IP)
* [mborne/ansible-ufw](https://github.com/mborne/ansible-ufw) permet de configurer [Uncomplicated Firewall (UFW)](https://doc.ubuntu-fr.org/ufw) avec ansible.
* [mborne/ansible-nfs-server](https://github.com/mborne/ansible-nfs-server) permet de déployer un serveur NFS (pour expérimenter le stockage ReadWriteMany (RWX) dans Kubernetes)

Quelques **playbooks ansible** principalement écrits pour [cours-devops](https://mborne.github.io/cours-devops) :

* [mborne/vagrantbox](https://github.com/mborne/vagrantbox) permet de créer des VM avec Vagrant pour les gérer avec Ansible.
* [mborne/k3s-deploy](https://github.com/mborne/k3s-deploy) permet de déployer un cluster K3S multi-nœuds avec Ansible.
* [mborne/geostack-deploy - ansible](https://github.com/mborne/geostack-deploy/tree/master/ansible) illustre le déploiement de GeoServer et PostGIS avec Ansible (**en français**)

## Gestion des dépôts GIT

* [mborne/git-manager](https://github.com/mborne/git-manager) permet de sauvegarder et de scanner des dépôts GIT depuis des instances GitHub, GitLab ou Gitea.
* [mborne/satis-gitlab](https://github.com/mborne/satis-gitlab) génère un fichier de configuration [SATIS](https://github.com/composer/satis?tab=readme-ov-file#satis) en listant les dépôts GIT contenant un fichier `composer.json`
* [mborne/remote-git](https://github.com/mborne/remote-git) est un client léger écrit en PHP pour lister les dépôts depuis des instances GitHub, GitLab ou Gitea (c'est le coeur de git-manager et satis-gitlab)

## Chargement des données spatiales

* [mborne/postgis-integration](https://github.com/mborne/postgis-integration) permet de **charger des jeux de données dans PostGIS (naturalearth, adminexpress, ...)**. Les imports sont écrits en NodeJS à l'aide d'utilitaires :
    * [mborne/node-dl](https://github.com/mborne/node-dl) qui encapsule des appels à [wget](https://doc.ubuntu-fr.org/wget) pour le **téléchargement des données**.
    * [mborne/node-extract](https://github.com/mborne/node-extract) qui appelle l'exécutable adapté (tar, unzip,...) pour **décompresser les archives**.
    * [mborne/node-ogr2pg](https://github.com/mborne/node-ogr2pg) qui exécute des commandes [ogr2ogr](https://gdal.org/programs/ogr2ogr.html) pour **charger différents formats dans PostgreSQL/PostGIS**.
    * [mborne/node-postgis-helper](https://github.com/mborne/node-postgis-helper) qui est une tentative d'aller un plus plus loin avec une **gestion des métadonnées sur les sources** et une **exploration des schémas** en vue de générer des API (1).
* [mborne/apicarto-integration](https://github.com/mborne/apicarto-integration) - Même idée avec des scripts bash (2018, **archivé**)

> (1) Cette idée est abandonnée au profit d'outil tels [pg_featureserv](https://github.com/CrunchyData/pg_featureserv?tab=readme-ov-file#pg_featureserv).

## Validation des données spatiales

Quelques travaux autour de [IGNF/validator](https://github.com/IGNF/validator) :

* [mborne/validator-experiments](https://github.com/mborne/validator-experiments) - validation des données ROUTE500 et cadastrales avec [IGNF/validator](https://github.com/IGNF/validator) (2020, test de robustesse à industrialiser?)
* [mborne/debug-gml-pcrs](https://github.com/mborne/debug-gml-pcrs) - Dépôt de reproduction d'un bug de [GDAL - GMLAS driver](https://gdal.org/drivers/vector/gmlas.html) (2022, **bug corrigé, archivé**)

## Quelques expérimentations JavaScript

Principalement rédigées pour suivre les évolutions (si rares...) dans cet ecosystème :

* [mborne/math-city](https://github.com/mborne/math-city) est un mini-jeu pour apprendre les tables de multiplication (développé pour prendre en main React plutôt que faire réciter des tables).
* [mborne/ts-examples](https://github.com/mborne/ts-examples) illustre la configuration des outils autour de TypeScript (ts-node, mocha, chai, nyc).
* [mborne/markdown-to-html](https://github.com/mborne/markdown-to-html) - Mon propre convertisseur de markdown en HTML puisqu'il n'y a pas assez de [générateurs de sites statiques](https://jamstack.org/generators/) sur le marché 😉

## Anciens travaux

### Cartographie web

* [mborne/jquery-geometry-editor](https://github.com/mborne/jquery-geometry-editor) - Un prototype d'extension JQuery visant à **rendre l'édition d'une géométrie dans un formulaire web aussi simple que l'édition d'une date** (2016, **archivé**, industrialisé en [IGNF/ol-geometry-editor](https://github.com/IGNF/ol-geometry-editor))
* [mborne/geoportail-leaflet](https://github.com/mborne/geoportail-leaflet) - Un exemple illustrant l'**utilisation des services WMTS de l'IGN** de la même manière qu'un TMS d'OSM **avec Leaflet** (2014, **archivé**)

### Traitement de graphes routiers

* [mborne/graph-experiments](https://github.com/mborne/graph-experiments) - Expérimentation du traitement des graphes avec boost::graph et GDAL / OGR (2019, **archivé**)

### Historisation des données spatiales

* [mborne/pghs](https://github.com/mborne/pghs) est une tentative de généralisation du système de **gestion de l'historique des données PostgreSQL** utilisé pour la BDTOPO de l'IGN s'appuyant sur des [trigger PostgreSQL](https://docs.postgresql.fr/13/plpgsql-trigger.html) (2019, **archivé**)

### Optimisation et moindres carrés

* [mborne/numpy-experiments](https://github.com/mborne/numpy-experiments) est une expérimentation de résolution par moindres carrés avec numpy et par descente de gradient avec tensorflow (2019, **archivé**)

### Simulation des règlements d'urbanisme

Relatif au travail autour de [Simplu3D](https://simplu3d.github.io/) en satellite du [GéoPortail de l'Urbanisme](https://www.geoportail-urbanisme.gouv.fr/) :

* [mborne/plu-formel](https://github.com/mborne/plu-formel) (2019, **fork archivé**, voir [CNIG - Structuration du réglement urbanisme (niveau 2)](https://cnig.gouv.fr/structuration-des-reglements-d-urbanisme-a25890.html))
* [mborne/simplu3D-experiments](https://github.com/mborne/simplu3D-experiments) (2018, **fork archivé**)

### Géométrie algorithmique

!!!info "SFCAL a été migrée sur gitlab.com"
    Voir [https://gitlab.com/sfcgal/SFCGAL](https://gitlab.com/sfcgal/SFCGAL)

Relatif au travaux pour [SFCGAL](https://github.com/Oslandia/SFCGAL) (ajout de fonctionnalités 3D dans PostGIS) :

* [mborne/cgal-decorate-point-with-data](https://github.com/mborne/cgal-decorate-point-with-data) - Une expérimentation pour ajouter le "M" aux points XYZ dans CGAL (2016, **archivé**)
* [mborne/sfcgal-experiment](https://github.com/mborne/sfcgal-experiment) - Une expérimentation pour calculer une "distance de morphing" entre polylignes (2016, **archivé**)

> cas d'utilisation : correspondance de motifs entre géométries linéaires, mesure de déformation des parcelles cadastrales,...

### Construction C++ sur windows

* [mborne/dll2def](https://github.com/mborne/dll2def) - Convertir .dll en .def pour construire GMP et MPFR sur Windows (2014, **archivé**)

## Divers

* [mborne/packer-examples](https://github.com/mborne/packer-examples) illustre la construction d'images VirtualBox et Vagrant avec Packer (**privé**, à intégrer en annexe d'une fiche sur Packer)

* [mborne/spring-ioc-principe](https://github.com/mborne/spring-ioc-principe) - Exemple de projet Spring utilisant le style XML ancien pour expliquer le principe d'injection de dépendances (**archivé**, lié à [cours-patron-conception](https://mborne.github.io/cours-patron-conception/#1) qui n'est plus traité en Java)
