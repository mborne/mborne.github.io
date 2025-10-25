# dig

La commande dig permet d'**interroger des serveurs DNS** et s'avère utile pour déboguer les problèmes de résolution de nom.

## Installation

```bash
sudo apt-get update
sudo apt-get install -y bind9-dnsutils
```

## Utilisation

### Interrogation des adresses IPV4

```bash
dig @1.1.1.1 www.quadtreeworld.net | grep -v ';' | grep -v '^$'
#www.quadtreeworld.net.  300     IN      CNAME   lb.quadtreeworld.net.
#lb.quadtreeworld.net.   300     IN      A       51.158.147.46
```

### Interrogation des adresses IPV6

```bash
dig @1.1.1.1 google.com AAAA
```

### Interrogation des entrées TXT

```bash
dig @1.1.1.1 _acme-challenge.quadtreeworld.net TXT
# _acme-challenge.quadtreeworld.net. 60 IN TXT    "INtrA8meUucf1Pv65z0d4H0B13fsx_nEdDf68X1CwqY"
```

### Interrogation des entrées MX

```bash
dig @1.1.1.1 quadtreeworld.net MX
#quadtreeworld.net.      300     IN      MX      86 route2.mx.cloudflare.net.
#quadtreeworld.net.      300     IN      MX      21 route1.mx.cloudflare.net.
#quadtreeworld.net.      300     IN      MX      98 route3.mx.cloudflare.net.
```
