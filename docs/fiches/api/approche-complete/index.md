
# Une bibliothèque, une application en ligne de commande et une API WEB

## Principe

Le graal n'est pas d'avoir une fonctionnalité accessible via HTTP. Le graal est d'**avoir le choix sur le mode d'accès à la fonctionnalité** :

* Une **bibliothèque de programmation** qui sera toujours **la base de l'édifice** répondra aux cas d'utilisation avancées.
* Une **application en ligne de commande**, exploitable dans des **batchs** et des **en coulisse d'application web**, sera intéressante pour éviter les transferts de données par le réseau.
* Une **API WEB** sera intéressante pour éviter les installations et centraliser les mises à jour, au prix de transfert de données par le réseau et de la dépendance à un service tiers.
* Une **application web** ou une **application desktop** permettra quand à elle de mettre à disposition une **interface graphique**

## L'exemple de mapshaper

A titre d'exemple, l'outil [mapshaper](https://mapshaper.org/) qui permet de simplifier des données géographiques adopte une philosophie proche de cette cible :

* Le site [https://mapshaper.org/](https://mapshaper.org/) met à disposition la fonctionnalité via **interface graphique**.
* Le dépôt [github.com mbloch/mapshaper](https://github.com/mbloch/mapshaper) correspond à la **bibliothèque** avec des fonctionnalités exposées sous forme d'[une application en ligne de commande](https://github.com/mbloch/mapshaper?tab=readme-ov-file#command-line-tools).

En conséquence, il est possible de **traiter des jeux de données volumineux sans avoir à transférer les données via le réseau** (chose qui serait imposé si la fonctionnalité était mise à disposition uniquement sous forme d'une API REST).

## Difficulté pour la mise en oeuvre d'une approche complète

La principale difficulté pour la mise en oeuvre d'une approche complète réside dans le cas où **des référentiels volumineux sont requis pour la mise en oeuvre de la fonctionnalité** (cadastre, BAN, OSM, BDTOPO,...). Quand bien même les données sont ouvertes, les accès aux référentiels restent hétérogènes et ils impliquent des téléchargements volumineux.

Nous noterons que pour les données peu volumineuses, il est possible de gérer les référentiels *as code* (ex : [BaseAdresseNationale/codes-postaux](https://github.com/BaseAdresseNationale/codes-postaux#codes-postaux))
