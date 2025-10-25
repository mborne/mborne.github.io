
# dnsmasq

!!!warning "Mise en garde"
    L'installation d'un serveur DNS en local s'est passablement complexifiée avec l'introduction du service [systemd-resolved](systemd-resolved.md) sur les dernières versions d'Ubuntu.

## Installation

L'installation de dnsmasq est triviale :

```bash
sudo apt-get update
sudo apt-get install dnsmasq
```

## Cas de systemd-resolved

En présence de [systemd-resolved](https://www.linuxtricks.fr/wiki/systemd-la-resolution-de-nom-avec-systemd-resolved), le port 53 sera déjà sous écoute et le service ne démarrera pas. Il faudra :

* Adapter la configuration `/etc/dnsmasq.conf` pour écouter sur une IP différente :

```ini
listen-address=127.0.0.2
bind-interfaces
```

* Dé-commenter la ligne `IGNORE_RESOLVCONF=yes` dans `/etc/default/dnsmasq`

* Redémarrer "dnsmasq" (`sudo service dnsmasq restart`)

* Configurer l'utilisation de `127.0.0.2` pour résoudre avec dnsmasq en modifiant `/etc/systemd/resolved.conf` comme suit :

```conf
[Resolve]
DNS=127.0.0.2
FallbackDNS=1.1.1.1
# ATTENTION : suppose que dnsmasq forward lui même
Domains=*
```

* Rédémarrer "systemd-resolved" pour prise en compte du changement (`sudo service systemd-resolved restart`)



## Configuration d'un wildcard

La configuration de la résolution de `*.localhost` en 127.0.0.1 se résume alors à l'ajout d'un fichier `/etc/dnsmasq.d/localhost` contenant :

```conf
address=/localhost/127.0.0.1
```

## Configuration d'un forward sur un serveur DNS

L'utilisation d'un serveur DNS classique via dnsmasq correspondant quand à elle à l'ajout d'un fichier `/etc/dnsmasq.d/cloudfire` contenant :

```conf
server=1.1.1.1
server=1.0.0.1
```

A chaque changement de configuration, il faudra redémarrer dnsmasq (`sudo service dnsmasq restart`) mais les manipulations s'arrête là dès lors que l'on a configuré la connexion réseau pour utiliser dnsmasq (`127.0.0.1`)
