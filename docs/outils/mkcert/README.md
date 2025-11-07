# mkcert

Offre une solution rapide pour générer des certificats reconnus par le système et le(s) navigateur(s) installés.

!!!warning "Mise en garde"
    - **Ne pas utiliser en entreprise** (par exemple à l'IGN).
    - **Comprendre le risque d'attaque man in the middle sur HTTPS en cas de vol du rootCA généré par mkcert**

## Principe de fonctionnement

* Génère un certificat racine autorité
* Ajoute ce certificat aux différents stores (système, navigateurs,...)
* Génère des certificats de développement à l'aide de ce certificat racine

## Installation

* [mkcert/install.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/mkcert/install.sh) assure le téléchargement du binaire du [la dernière release](https://github.com/FiloSottile/mkcert/releases/latest) en `/usr/local/bin/mkcert` :

```bash
curl -sS https://mborne.github.io/outils/mkcert/install.sh | bash
```

## Utilisation

Notes à sortir de [mborne/docker-devbox - traefik/mkcert.md](https://github.com/mborne/docker-devbox/blob/8304f8a6a1ea195b5f099e2ecbd89c0fba70f54c/traefik/mkcert.md)

## Ressources

* [github.com - FiloSottile/mkcert](https://github.com/FiloSottile/mkcert)
* [issue #377 - possibility to limit down the rootCA on a specific domain](https://github.com/FiloSottile/mkcert/issues/377) à surveiller (refactoring nécessaire pour signer à l'aide d'un "intermediateCA.{cert|key}" en supprimant "rootCA.key"?)
