# QEMU - Création d'une VM Ubuntu Desktop

## Téléchargement de l'ISO

> Voir [releases.ubuntu.com - Ubuntu 24.04](https://releases.ubuntu.com/24.04/) pour la dernière version de l'ISO.

```bash
mkdir -p ~/qemu/ubuntu-desktop
cd ~/qemu/ubuntu-desktop

ISO=ubuntu-24.04.5.1-desktop-amd64.iso
wget --no-clobber https://releases.ubuntu.com/24.04/${ISO}

# vérification de l'intégrité de l'ISO
wget -O SHA256SUMS https://releases.ubuntu.com/24.04/SHA256SUMS
sha256sum --check --ignore-missing SHA256SUMS
```

## Création d'un disque virtuel

```bash
cd ~/qemu/ubuntu-desktop
qemu-img create -f qcow2 os.img 30G
```

## Démarrage pour installation

```bash
qemu-system-x86_64  \
  -machine type=q35,accel=kvm \
  -cpu host \
  -m 4096 \
  -vga virtio \
  -drive if=virtio,format=qcow2,file=os.img \
  -drive file=${ISO},media=cdrom,readonly=on \
  -nic user,model=virtio
```

## Démarrages suivants

```bash
qemu-system-x86_64  \
  -machine type=q35,accel=kvm \
  -cpu host \
  -m 4096 \
  -vga virtio \
  -drive if=virtio,format=qcow2,file=os.img \
  -nic user,model=virtio
```
