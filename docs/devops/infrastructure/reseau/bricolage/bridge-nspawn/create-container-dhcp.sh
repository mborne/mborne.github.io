#!/bin/bash
set -e

# ---------- CONFIGURATION ----------
BRIDGE=br-lab
CONTAINER_NAME=${CONTAINER_NAME:-br-lab-node-1}
ROOTFS=/var/lib/machines/$CONTAINER_NAME
UBUNTU_VERSION=noble

# ---------- création du rootfs du conteneur ----------
if sudo [ ! -d "$ROOTFS" ]; then
    # --variant=minbase
    sudo debootstrap --arch=amd64 --include=systemd,dbus $UBUNTU_VERSION $ROOTFS
fi

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

cat << EOF | sudo tee -a $CONTAINER_NET_DIR/20-host0.network
[Match]
Name=host0

[Network]
DHCP=yes
EOF

# activer systemd-networkd dans le conteneur
sudo chroot $ROOTFS systemctl enable systemd-networkd

# ---------- démarrage du conteneur ----------
sudo machinectl start $CONTAINER_NAME

echo "✅ Conteneur $CONTAINER_NAME démarré."
echo "Ouvrir un shell : sudo machinectl shell $CONTAINER_NAME"
