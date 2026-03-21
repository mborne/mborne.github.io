# DNS - La résolution de nom de domaine

La fonctionnalité principale d'un serveur DNS est la conversion d'un nom (ex : `www.quadtreeworld.net`) en adresse IP (ex : `51.15.190.141`). Il offre d'autres fonctionnalités (c.f. [Principaux types d'entrées](#principaux-types-dentrees))

## Quelques fournisseurs

| Fournisseur | DNS1           | DNS2           |
| ----------- | -------------- | -------------- |
| Cloudflare  | 1.1.1.1        | 1.0.0.1        |
| google      | 8.8.8.8        | 8.8.4.4        |
| OpenDNS     | 208.67.222.222 | 208.67.220.220 |
| free        | 212.27.40.240  | 212.27.40.241  |

Voir aussi [www.commentcamarche.net - Serveurs DNS des principaux FAI](https://www.commentcamarche.net/faq/1496-serveurs-dns-des-principaux-fai)

## Principaux types d'entrées

> 🤖 Rédaction assistée par IA.

| Type      | Exemple                                                                 | Utilisation principale                                                                                                                                                                           |
| --------- | ----------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **A**     | `lb.quadtreeworld.net → 51.158.147.46`                                  | Associe un nom de domaine à une **adresse IPv4**                                                                                                                                                 |
| **AAAA**  | `google.fr → 2a00:1450:4007:809::2003`                                  | Associe un nom de domaine à une **adresse IPv6**                                                                                                                                                 |
| **CNAME** | `www.quadtreeworld.net → lb.quadtreeworld.net`                          | Fait d’un nom un **alias** d’un autre (pas d’adresse directe)                                                                                                                                    |
| **TXT**   | `_acme-challenge.quadtreeworld.net. → "1Udw..."`                        | Contient des **informations textuelles**, souvent pour la **vérification de domaine** ([Challenge DNS ACME](https://letsencrypt.org/fr/docs/challenge-types/#challenge-dns-01), SPF, DKIM, etc.) |
| **MX**    | `google.com → smtp.google.com`                                          | Spécifie le **serveur de messagerie** pour le domaine                                                                                                                                            |
| **NS**    | `quadtreeworld.net → dakota.ns.cloudflare.co, maleah.ns.cloudflare.com` | Indique les **serveurs DNS autoritaires** pour le domaine                                                                                                                                        |
| **SOA**   | Définit le **serveur maître**, l’email d’admin, le TTL par défaut…      | Indique les **paramètres du domaine**                                                                                                                                                            |

Il en existe d'autres (c.f. [fr.wikipedia.org - Liste des enregistrements DNS](https://fr.wikipedia.org/wiki/Liste_des_enregistrements_DNS))

## Tester la résolution de nom

* [dig](../../../outils/dig/index.md)
* host
* nslookup

## Configurer la résolution de nom

Plusieurs options sont possibles pour un poste de travail :

* Configurer les serveurs DNS via le protocole DHCP (comportement par défaut faisant généralement suivre les DNS du FAI)
* Configurer manuellement les serveurs DNS au niveau de la connexion
* Forcer la résolution de certains noms via `/etc/hosts` :

```conf
# custom ip
192.168.0.101   machine1
192.168.0.102   machine2
```

* Installer et utiliser un server DNS (ex : [dnsmasq](../../outils/dnsmasq/index.md)) pour contourner les limitations de `/etc/hosts` (ex : `*.vbox.local` -> VM VirtualBox avec serveur WEB).

## Cas des conteneurs

* Docker embarque son propre serveur DNS exposé sur l'IP `127.0.0.11`
* Kubernetes intègre lui aussi un serveur DNS (ex : [CoreDNS](https://coredns.io/))

## Sécurité

Historiquement :

- Niveau intégrité, il n'y a historiquement pas de mécanisme de sécurité au niveau DNS. HTTPS est utilisé pour s'assurer que le serveur auquel on accède n'est pas celui d'un pirate et pour chiffrer les données échangées.
- Niveau confidentialité, il faut savoir que même en présence de HTTPS, le serveur DNS et tous les systèmes en mesure d'écouter les requêtes DNS connaîtront les noms d'hôtes auxquels vous accédez.

Des progrès sont toutefois en cours en la matière (voir [www.malekal.com - DNSSEC, DNS Over TLS ou HTTPS (DoT et DoH) et DNSCrypt : les différences](https://www.malekal.com/chiffrement-dns-dns-over-https/))


## Références

* [debian-handbook.info - Le cahier de l'administrateur Debian - 8.3. Attribution et résolution de noms](https://debian-handbook.info/browse/fr-FR/stable/sect.hostname-name-service.html)

* [doc.ubuntu-fr.org - Comment configurer un serveur léger dns et dhcp alias Dnsmasq ?](https://doc.ubuntu-fr.org/configuration_serveur_dns_dhcp)

* [www.infomaniak.com - À quoi sert DNSSEC?](https://www.infomaniak.com/fr/support/faq/2208/comprendre-a-quoi-sert-dnssec)
