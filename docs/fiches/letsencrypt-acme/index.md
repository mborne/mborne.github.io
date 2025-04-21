# Les certificats LetsEncrypt et le protocole ACME

[Let's Encrypt](https://letsencrypt.org/) fournit gratuitement des certificats serveurs signés par une autorité de certificat reconnue par les navigateurs et les systèmes. L'idée de base est de lever le frein financier pour la généralisation de l'utilisation de HTTPS.

## Principe

La création des certificats s'appuie sur le protocole [ACME](https://datatracker.ietf.org/doc/html/rfc8555) qui est mis en oeuvre via une API. Ce protocole contrôle la propriété des domaines avec des [challenges](https://letsencrypt.org/docs/challenge-types/) apportant soit :

* La preuve du contrôle du serveur (challenge HTTP)
* La preuve du contrôle du domaine (challenge DNS).

## En pratique

* [certbot](../../outils/certbot/README.md) permet de gérer la création de certificat en ligne de commande pour des serveurs nginx, apache,...
* Des outils tel [traefik](https://doc.traefik.io/traefik/https/acme/) intègrent la création automatique de certificats LetsEncrypt.
* [lego](https://go-acme.github.io/lego/) automatise le traitement des challenges DNS en faisant appel à l'[API des providers](https://go-acme.github.io/lego/dns/).
* [cert-manager](https://cert-manager.io/) utilisable en contexte Kubernetes met lui à disposition une [implémentation du protocole ACME](https://cert-manager.io/docs/configuration/acme/).

## Intérêt des challenges DNS

Les challenges DNS sont particulièrement intéressant pour les cas d'utilisation suivant :

* Création d'un certificat pour des applications non exposées sur internet (ex : site intranet)
* [Création d'un certificat wildcard](./wildcard.md)

## Mise en garde

* L'autorité de certification intermédiaire doit être diffusée au niveau du serveur web (i.e. de configurer le serveur web avec **fullchain.pem**)
    * Firefox embarque la CA racine et la CA intermédiaire, ce n'est pas le cas des store ubuntu et ça pose problème pour des clients en ligne de commande tel `curl`.
* [www.sslshopper.com](https://www.sslshopper.com/ssl-checker.html) permet de vérifier que c'est bien le cas si le domaine est exposé.
* L'utilitaire [openssl](https://www.sslshopper.com/article-most-common-openssl-commands.html) sera votre ami si ça se complique.

## Ressources

* [letsencrypt.org - How It Works](https://letsencrypt.org/how-it-works/)
* [letsencrypt.org - Chain of trust (chaîne de certification)](https://letsencrypt.org/certificates/)
