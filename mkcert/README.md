# mkcert

Offre une solution rapide pour générer des certificats reconnus par le système et le(s) navigateur(s) installés.

## Principe de fonctionnement

* Génère un certificat racine autorité
* Ajoute ce certificat aux différents stores (système, navigateurs,...)
* Génère des certificats de développement à l'aide de ce certificat racine

## Mise en garde

* **Ne pas utiliser en entreprise** (par exemple à l'IGN ou à l'ENSG).

* **Comprendre le risque d'attaque man in the middle sur HTTPS en cas de vol du rootCA généré**

> [issue #377 - possibility to limit down the rootCA on a specific domain](https://github.com/FiloSottile/mkcert/issues/377) à surveiller (refactoring nécessaire pour signer à l'aide d'un "intermediateCA.{cert|key}" en supprimant "rootCA.key"?)

## Installation

[mkcert/install.sh](install.sh)

## Utilisation

Notes à sortir de [mborne/docker-devbox - traefik/mkcert.md](https://github.com/mborne/docker-devbox/blob/8304f8a6a1ea195b5f099e2ecbd89c0fba70f54c/traefik/mkcert.md)

## Remarques

<https://github.com/FiloSottile/mkcert>
