#!/bin/bash
# Automatise les étapes du TP décrites dans compilation.md
# Méthode : debootstrap → image disque → QEMU
# Entièrement non interactif (aucune question posée par les outils).

set -e
export DEBIAN_FRONTEND=noninteractive

if [ "$EUID" -eq 0 ]; then
    echo "Ne pas exécuter ce script en root."
    exit 1
fi

WORKING_DIR=~/tp-linux-kernel
KERNEL_DIR="$WORKING_DIR/linux-6.8"

# Dépendances (debootstrap pour rootfs, pas d’initramfs)
sudo -E apt-get update -qq
sudo -E apt-get install -y -qq --no-install-recommends \
    build-essential libncurses-dev flex bison openssl libssl-dev \
    libelf-dev qemu-system-x86 debootstrap debian-archive-keyring \
    genisoimage isolinux syslinux-common

mkdir -p "$WORKING_DIR"
cd "$WORKING_DIR"

if [ ! -d linux-6.8 ]; then
    # download archive if not present
    wget -O linux-6.8.tar.xz --quiet --no-clobber https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.8.tar.xz
    tar -xvf linux-6.8.tar.xz
fi

cd "$KERNEL_DIR"

# Configuration (non interactif : defconfig + ext4)
make defconfig
./scripts/config --enable CONFIG_EXT4_FS
# enable KVM support
./scripts/config --enable CONFIG_KVM
make olddefconfig

# Compilation
make -j$(nproc)

# Rootfs debootstrap (une seule fois)
if [ ! -d "$WORKING_DIR/rootfs/sbin" ]; then
    echo "Création du rootfs debootstrap..."
    sudo -E debootstrap --arch=amd64 --variant=minbase trixie "$WORKING_DIR/rootfs"
fi

echo "Installation de figlet dans le rootfs..."
sudo chroot "$WORKING_DIR/rootfs" /bin/sh -c "apt-get update -qq && apt-get install -y -qq figlet && apt-get clean"

echo "Création du script d'initialisation..."
sudo tee "$WORKING_DIR/rootfs/sbin/init" > /dev/null << 'INIT'
#!/bin/sh
mount -t proc none /proc
mount -t sysfs none /sys
mount -t devtmpfs none /dev
figlet "Linux rocks!"
exec /bin/sh
INIT
sudo chmod +x "$WORKING_DIR/rootfs/sbin/init"

# Image disque (création ou mise à jour du contenu)
echo "Création de l'image disque rootfs.img..."
IMG="$WORKING_DIR/rootfs.img"
MNT="$WORKING_DIR/mnt"
truncate -s 2G "$IMG"
mkfs.ext4 -F "$IMG"
mkdir -p "$MNT"
sudo mount -o loop "$IMG" "$MNT"
sudo cp -a "$WORKING_DIR/rootfs/." "$MNT/"
sudo umount "$MNT"
rmdir "$MNT"

echo "Pour lancer QEMU avec le noyau compilé et l'image rootfs :"
echo " qemu-system-x86_64 -kernel $KERNEL_DIR/arch/x86/boot/bzImage -drive file=$IMG,format=raw -append \"root=/dev/sda console=ttyS0\" -nographic"
echo ""

echo "Pour accélérer avec KVM (si supporté) :"
echo " sudo qemu-system-x86_64 -kernel $KERNEL_DIR/arch/x86/boot/bzImage -drive file=$QCOW_IMG,format=qcow2 -append \"root=/dev/sda console=ttyS0\" -nographic --accel kvm"
echo ""

echo "Pour arrêter la machine virtuelle, utilisez Ctrl+A puis X dans la console QEMU."
