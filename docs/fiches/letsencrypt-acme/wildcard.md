# Génération d'un certificat wildcard avec LetsEncrypt et le challenge DNS

En s'appuyant sur [dns-01-challenge](https://letsencrypt.org/docs/challenge-types/#dns-01-challenge), il est possible de générer gratuitement des certificats wildcard avec LetsEncrypt.

## Pré-requis

* [certbot](../../outils/certbot/README.md)

## Procédure manuelle

* Demander la création d'un certificat `*.quadtreeworld.net` :

```bash
sudo certbot certonly --cert-name quadtreeworld.net \
    --server https://acme-v02.api.letsencrypt.org/directory \
    --preferred-challenges dns --manual \
    -d '*.quadtreeworld.net'
```

* Configurer le DNS comme demandé par certbot :

```text
Please deploy a DNS TXT record under the name
_acme-challenge.quadtreeworld.net with the following value:

INtrA8meUucf1Pv65z0d4H0B13fsx_nEdDf68X1CwqY
```

* Vérifier avec `dig -q txt _acme-challenge.quadtreeworld.net`

* Valider au niveau de certbot

Si tout se passe bien : `Congratulations!`, on obtient :

```text
/etc/letsencrypt/live/quadtreeworld.net/fullchain.pem
/etc/letsencrypt/live/quadtreeworld.net/privkey.pem
```

## Automatisation

[lego](https://go-acme.github.io/lego/) permet d'automatiser cette procédure en appelant les API de différents [gestionnaires de DNS](https://go-acme.github.io/lego/dns/index.html) pour configurer l'entrée TXT requise pour la validation.
