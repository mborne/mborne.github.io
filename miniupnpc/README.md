# miniupnpc

## Principe

Via le protocole [UPnP IGD](https://en.wikipedia.org/wiki/Internet_Gateway_Device_Protocol), il est possible de configurer à la volée des expositions de port sur sa box internet sans rentrer dans les interfaces de configuration. Ce mécanisme est particulièrement utile pour les applications pair-à-pair en IPV4.

## Installation

```bash
sudo apt-get install miniupnpc
```

## Utilisation

```bash
# lister les redirections
upnpc -l
# exposer le port 80 de la machine courante en externe
upnpc -r 80 TCP

# rediriger le port 80 de la machine sur le port externe 20080
upnpc -a 192.168.0.30 80 20080
# supprimer la redirection
upnpc -d 20080 TCP

# récupération IP publique
upnpc -s | grep ExternalIPAddress | cut -c21-
```

## Notes

### Désactiver la fonctionnalité sur sa box

Pour des raisons de sécurité, il semble raisonnable de désactiver le protocole "UPnP IGD" correspondant sur sa box s'il n'est pas utile (il y a des moyens plus propre pour exposer temporairement une application tel [ngrok](https://ngrok.com/docs/getting-started/))

### Cas des IPv4 partagées

Avec free par exemple, les clients peuvent désormais partager la même IP avec des plages de ports différents (c.f. [Free peut attribuer la même adresse IP à plusieurs abonnés](https://www.numerama.com/tech/145703-free-peut-attribuer-la-meme-adresse-ip-a-plusieurs-abonnes.html)).

Il sera alors impossible d'exposer certains ports à moins de demander une **IPv4 full stack** ([Freebox : une option pour ne plus partager son IP avec d'autres abonnés](https://www.clubic.com/connexion-internet/fai-free-box-freebox/actualite-808988-freebox-ipv4-dediee-4rd.html))


## Resources

* [Faire une redirection de port sur son routeur avec UPnP](https://tuxicoman.jesuislibre.net/2017/03/faire-une-redirection-de-port-sur-son-routeur-avec-upnp.html)
* [github.com - miniupnp/miniupnp](https://github.com/miniupnp/miniupnp#readme)
* [fr.wikipedia.org - Protocole UPnP](https://fr.wikipedia.org/wiki/Protocole_UPnP)
  * [fr.wikipedia.org - UPnP IGD](https://en.wikipedia.org/wiki/Internet_Gateway_Device_Protocol)
  * [doc.ubuntu-fr.org - Utiliser la fonction UPnP AV de la Freebox](https://doc.ubuntu-fr.org/tutoriel/freebox_nouvelles_fonctions_upnp)
* [www.avg.com Qu’est-ce que l’UPnP et peut-on l’activer sans risque ?](https://www.avg.com/fr/signal/what-is-unpn)
