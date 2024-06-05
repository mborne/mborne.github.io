# wireguard

## Mise en garde

Notes relatives à un test de montage d'un VPN entre une VM en ligne et un raspberry sur un réseau domestique (idée abandonnée)

## Installation

```bash
# installation
sudo apt install wireguard
# resolvconf command not found
sudo apt install openresolv
```

## Utilisation

```bash
# démarrage avec /etc/wireguard/wg0.conf
sudo wg-quick up wg0
# statut
sudo wg show wg0
# arrêt
sudo wg-quick down wg0
```
