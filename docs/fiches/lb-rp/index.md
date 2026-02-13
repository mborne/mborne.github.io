---
tags:
    - DevOps
    - Service technique
    - Reverse Proxy
    - Load Balancer
search:
    boost: 1.5
---

# Partage de charge et reverse proxy

## Principe de fonctionnement

Un **reverse proxy** joue un rôle d'intermédiaire entre la requête d'un client et son traitement sur un serveur particulier. 

<div class="grid cards" markdown>

- En présence de plusieurs serveurs à même de traiter la requête, il jouera un rôle de **répartiteur de charge** (*LoadBalancer*) permettant la **scalabilité horizontale**. 
- ![Principe du partage de charge](img/principe-lb.png)

</div>

Par abus de langage, ce composant sera souvent nommé **LoadBalancer** (abrégé en "lb") même en présence d'un seul serveur en "backend".

## Principe de configuration

Dans le principe, il reviendra de **mettre en correspondance des URL externes et des URL internes**. Par exemple, pour 3 instances d'une "app" écoutant en HTTP sur le port 3000 :

| URL externe               | URL interne                                                           |
| ------------------------- | --------------------------------------------------------------------- |
| `https://app.exemple.net` | `http://app01:3000`<br />`http://app02:3000`<br />`http://app03:3000` |

## Impact au niveau des applications

### Les services doivent supporter le partage de charge

Dans le cas idéal, **un service web ne doit pas stocker localement des états**. Sans cela, un même serveur devra traiter les requêtes successives d'un même client et il sera nécessaire de mettre en oeuvre un mécanisme d'**affinité de session** au niveau du LoadBalancer.

### Les services ne voient pas les IP des clients

Par défaut, **les services derrière le LoadBalancer verront l'IP du LoadBalancer** au niveau de la connexion. En cas de besoin d'accéder à l'IP du client (ex : pour protéger une authentification par mot de passe contre des attaques par force brute), on s'appuiera généralement sur l'ajout d'une entête HTTP au niveau du LoadBalancer (`X-Forwarded-For` ou `X-Real-IP`)

### Les services ne voient pas les URL externes

Un service en backend d'un LoadBalancer n'a pas une vue directe sur les URL externes. Il faudra au besoin calculer ces URL à partir des entêtes HTTP ajoutées aux requêtes par le reverse proxy (`X-Forwarded-Proto`, `X-Forwarded-Host`, `X-Forwarded-For`...)

(voir par exemple [docs.geoserver.org - Use headers for Proxy URL](https://docs.geoserver.org/stable/en/user/configuration/globalsettings.html#use-headers-for-proxy-url) où les entêtes supportées par [GeoServer](https://geoserver.org/) sont documentées)

## Autres cas d'utilisation du LoadBalancer

Ce composant jouera régulièrement d'autres rôles. Il pourra être utilisé pour :

* Mettre en oeuvre TLS (HTTPS pour les services web)
* **Mettre à jour une application sans coupure** (mise à jour progressive des backends)
* Ajouter des **entêtes de sécurité aux réponses**

> ex : HSTS (`Strict-Transport-Security: max−age=31536000; includeSubDomains;`) pour empêcher le contournement d'HTTPS.

* Mettre en oeuvre des **filtrages par IP**
* Mettre en oeuvre des **authentifications** (proxy authentifiant)
* Mettre en oeuvre des **limites de solicitations des services** (ex : max 500 requêtes/min/IP)
* Mettre en oeuvre des **limites de débit de téléchargement** (ex : max 500 ko/s/IP)
* ...


## Quelques exemple d'implémentations

Il existe de nombreuses solutions mais nous citerons par exemple :

* [nginx](https://docs.nginx.com/nginx/admin-guide/load-balancer/http-load-balancer/) (plutôt utilisé à l'échelle d'une application).
* [haproxy](https://www.haproxy.com/blog/haproxy-configuration-basics-load-balance-your-servers) (plutôt utilisé à l'échelle d'une zone d'hébergement).
* [traefik](https://doc.traefik.io/traefik/) qui dispose entre autre de mécanismes de **découverte de configuration**.


## Deux types de LoadBalancer

Pour la culture, nous noterons qu'il existe deux types de LoadBalancer :

* **LoadBalancer L4** agissant au niveau **TCP/IP** (couche "4 - transport" du [modèle OSI](https://fr.wikipedia.org/wiki/Mod%C3%A8le_OSI))
* **LoadBalancer L7** agissant au niveau **HTTP/HTTPS** (couche "7 - transport" du [modèle OSI](https://fr.wikipedia.org/wiki/Mod%C3%A8le_OSI)), utile pour des services web.

Nous nous sommes concentré dans cette fiche sur le deuxième cas qui est particulièrement fréquent avec les services web.

## Ressources

* [blog.octo.com - BD - Le Load Balancer](https://blog.octo.com/bd-le-load-balancer/)
* [cyber.gouv.fr - Sécuriser un site web](https://cyber.gouv.fr/publications/securiser-un-site-web) aborde entre autres les **entêtes de sécurité** dans le document "Recommandations pour la mise en œuvre d'un site web : maîtriser les standards de sécurité côté navigateur"
* [medium.com - Difference Between Layer 4 vs. Layer 7 Load Balancing](https://medium.com/@harishramkumar/difference-between-layer-4-vs-layer-7-load-balancing-57464e29ed9f)

