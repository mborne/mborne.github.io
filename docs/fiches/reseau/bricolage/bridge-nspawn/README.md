# Réseau - création d'un bridge avec un serveur DHCP / DNS conteneurisé

## Principe

* Création d'un bridge `br-lab` servant de passerelle (`192.168.100.1/24`)
* Création d'un conteneur `br-lab-dnsmasq` (`192.168.100.2/24`) avec DNS et DHCP
* Création d'un conteneur de test (`br-lab-node-1`) client pour le serveur DHCP

## Pré-requis

```bash
sudo apt-get update
sudo apt-get install -y debootstrap
sudo apt-get install -y systemd-container
sudo apt-get install -y iptables

# Activer le routage IPv4 de manière persistante
echo "net.ipv4.ip_forward=1" | sudo tee -a /etc/sysctl.d/99-custom.conf > /dev/null
sudo sysctl --system
```

## Scripts

* [create-bridge-dnsmasq.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/fiches/reseau/bricolage/bridge-nspawn/create-bridge-dnsmasq.sh) : création du bridge et du conteneur dnsmasq

* [create-container-dhcp.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/fiches/reseau/bricolage/bridge-nspawn/create-container-dhcp.sh) : création d'un conteneur client avec configuration DHCP
