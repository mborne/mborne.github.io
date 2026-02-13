#!/bin/bash
set -e

# ---------- CONFIGURATION ----------
BRIDGE=br-lab
BRIDGE_IP=192.168.100.1/24
BRIDGE_NET=192.168.100.0/24
CONTAINER_NAME=br-lab-dnsmasq
CONTAINER_IP=192.168.100.2/24
GATEWAY=192.168.100.1
HOST_IF=eth0
ROOTFS=/var/lib/machines/$CONTAINER_NAME
UBUNTU_VERSION=noble

# ---------- création du rootfs du conteneur ----------
if sudo [ ! -d "$ROOTFS" ]; then
    # --variant=minbase
    sudo debootstrap --arch=amd64 --include=systemd,dbus $UBUNTU_VERSION $ROOTFS
fi

# ---------- création du bridge ----------
sudo ip link add name $BRIDGE type bridge || true
sudo ip addr add $BRIDGE_IP dev $BRIDGE || true
sudo ip link set dev $BRIDGE up

# ---------- NAT vers l'interface physique ----------
# TODO : contrôle uniquement (pré-requis)
sudo sysctl -w net.ipv4.ip_forward=1

# iptables NAT
sudo iptables -t nat -C POSTROUTING -s $BRIDGE_NET -o $HOST_IF -j MASQUERADE 2>/dev/null || \
sudo iptables -t nat -A POSTROUTING -s $BRIDGE_NET -o $HOST_IF -j MASQUERADE

# ---------- configuration réseau au niveau de l'hôte ----------
NSPN=$(mktemp)
cat >$NSPN <<EOF
[Network]
Bridge=$BRIDGE
VirtualEthernet=yes
EOF
sudo mkdir -p /etc/systemd/nspawn
sudo mv $NSPN /etc/systemd/nspawn/$CONTAINER_NAME.nspawn


# ---------- configuration hostname ----------
cat << EOF | sudo tee $ROOTFS/etc/hostname
$CONTAINER_NAME
EOF

# ---------- configuration IP fixe au niveau conteneur ----------
CONTAINER_NET_DIR=$ROOTFS/etc/systemd/network
sudo mkdir -p $CONTAINER_NET_DIR

cat << EOF | sudo tee $CONTAINER_NET_DIR/20-host0.network
[Match]
Name=host0

[Network]
Address=$CONTAINER_IP
Gateway=$GATEWAY
DNS=1.1.1.1
EOF

# ---------- installation et configuration dnsmasq ----------

# install dnsmasq
sudo chroot $ROOTFS /bin/bash -c "apt-get update && apt-get install -y dnsmasq-base"

cat << EOF | sudo tee $ROOTFS/etc/dnsmasq.conf
interface=host0
bind-interfaces

dhcp-range=192.168.100.50,192.168.100.150,12h
dhcp-option=3,192.168.100.1
dhcp-option=6,192.168.100.2
EOF


cat << EOF | sudo tee $ROOTFS/etc/systemd/system/dnsmasq-nspawn.service
[Unit]
Description=DNSMASQ in container
After=network.target

[Service]
ExecStart=/usr/sbin/dnsmasq --no-daemon --conf-file=/etc/dnsmasq.conf
Restart=always

[Install]
WantedBy=multi-user.target
EOF


# activer systemd-networkd et dnsmasq dans le conteneur
sudo chroot $ROOTFS systemctl daemon-reload
sudo chroot $ROOTFS systemctl enable systemd-networkd
sudo chroot $ROOTFS systemctl enable dnsmasq-nspawn


# ---------- Démarrer le conteneur ----------
sudo machinectl start $CONTAINER_NAME

echo "✅ Conteneur $CONTAINER_NAME démarré."
echo "IP du conteneur : ${CONTAINER_IP%/*}"
echo "Bridge interne : $BRIDGE → NAT vers $HOST_IF"
echo "Ping test : sudo machinectl shell $CONTAINER_NAME ping $GATEWAY"
