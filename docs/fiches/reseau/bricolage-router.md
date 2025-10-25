# Réseau - configuration d'une machine en router et passerelle pour internet

## Principe

- Une machine "router" avec 2 réseau :
  - enp0s3 = réseau NAT VirtualBox pour l'accès à internet
  - enp0s8 = réseau privé hôte VirtualBox ( IP : `192.168.159.1` )
- Une machine "vm-1" avec 1 seul réseau :
  - enp0s3 = réseau privé hôte VirtualBox ( IP : `192.168.159.10` (statique) / `192.168.159.50` (DHCP))

## Côté router

### Configuration de l'IP statique

Dans `/etc/network/interfaces` :

```
auto enp0s8
iface enp0s8 inet static
  address 192.168.159.1
  netmask 255.255.255.0
```

```bash
# redémarrage réseau
sudo systemctl networking restart

# contrôle IP
ip address
```

### Activation du routage

```bash
# Activer le routage IPv4 de manière persistante
echo "net.ipv4.ip_forward=1" | sudo tee -a /etc/sysctl.d/99-custom.conf > /dev/null

# Appliquer les paramètres
sudo sysctl --system
```

### Configuration du pare-feu et du NAT

```bash
# 1. Tout bloquer par défaut
sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD DROP

# 2. Autoriser les connexions établies et relatives
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# 3. Autoriser le trafic local (loopback)
sudo iptables -A INPUT -i lo -j ACCEPT

# 4. Autoriser NAT LAN → Internet
sudo iptables -A FORWARD -i enp0s8 -o enp0s3 -j ACCEPT
sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE

# Pour vérifier 
sudo iptables -L FORWARD -v -n

# Pour sauvegarder la configuration iptables
sudo apt install iptables-persistent -y
sudo netfilter-persistent save
sudo systemctl status netfilter-persistent
```

### Configuration d'un serveur DHCP (optionnel)

Dans `/etc/default/isc-dhcp-server` :

```ini
# Defaults for isc-dhcp-server (sourced by /etc/init.d/isc-dhcp-server)

# Path to dhcpd's config file (default: /etc/dhcp/dhcpd.conf).
DHCPDv4_CONF=/etc/dhcp/dhcpd.conf
#DHCPDv6_CONF=/etc/dhcp/dhcpd6.conf

# Path to dhcpd's PID file (default: /var/run/dhcpd.pid).
#DHCPDv4_PID=/var/run/dhcpd.pid
#DHCPDv6_PID=/var/run/dhcpd6.pid

# Additional options to start dhcpd with.
#	Don't use options -cf or -pf here; use DHCPD_CONF/ DHCPD_PID instead
#OPTIONS=""

# On what interfaces should the DHCP server (dhcpd) serve DHCP requests?
#	Separate multiple interfaces with spaces, e.g. "eth0 eth1".
INTERFACESv4="enp0s8"
INTERFACESv6=""
```

Dans `/etc/dhcp/dhcpd.conf` :

```
option domain-name "vbox.local";
option domain-name-servers 1.1.1.1, 8.8.8.8;
default-lease-time 600;
max-lease-time 7200;
ddns-update-style none;
subnet 192.168.159.0 netmask 255.255.255.0 {
  range 192.168.159.50 192.168.159.250;
  option routers 192.168.159.1;
}
```


## Côté vm-1

> Avec enp0s3 = 192.168.159.1/24 = réseau privé hôte

Dans `/etc/network/interfaces`, on configure comme suit pour IP statique :

``` 
auto enp0s3
iface enp0s3 inet static
  address 192.168.159.10
  netmask 255.255.255.0
  gateway 192.168.159.1
```

...et comme suit en DHCP :

``` 
auto enp0s3
iface enp0s3 inet dhcp
```
 



