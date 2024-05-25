# wireguard

## Ubuntu

```bash
# installation
sudo apt install wireguard
# resolvconf command not found
sudo apt install openresolv

# démarrage avec /etc/wireguard/wg0.conf
sudo wg-quick up wg0
# statut
sudo wg show wg0
# arrêt
sudo wg-quick down wg0
```
