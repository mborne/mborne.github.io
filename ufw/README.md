# UFW - Uncomplicated Firewall

## Contexte

Avec une boxe IPV6 et aucun pare-feux, il est trivial de se connecter aux ports ouverts de la machine qui est routable depuis internet. De même, si vous avez un serveur exposé sur internet, il est indispensable de bloquer les ports qui n'ont pas vocation à être accessible depuis internet.

C'est là que [ufw](https://doc.ubuntu-fr.org/ufw) rend service. Il permet de configurer plus facilement le pare-feu local d'en travaillant directement avec [iptables](https://doc.ubuntu-fr.org/iptables).

## Installation

```bash
sudo apt-get update
sudo apt-get install ufw
```

## Exemple de configuration

```bash
# désactivation du pare-feu
sudo ufw disable

# mode par défaut
sudo ufw default allow

# autorisation traffic sortant par défaut
sudo ufw default allow outgoing
# blocage traffic entrant par défaut
sudo ufw default deny incoming

# autorisation traffic entrant sur port 22 (SSH)
sudo ufw allow in 22/tcp

# activation du pare-feu
sudo ufw enable

# statut avec règles par défaut
sudo ufw status verbose

# activation des logs
sudo ufw logging on
# suivi des logs
tail -f /var/log/ufw.log
```

## Ressources

* [doc.ubuntu-fr.org - Uncomplicated Firewall](https://doc.ubuntu-fr.org/ufw)
* [debian-facile.org - UFW un pare-feu facile](http://debian-facile.org/doc:systeme:ufw)
