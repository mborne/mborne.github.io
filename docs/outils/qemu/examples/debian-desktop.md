# QEMU - Création d'une image debian desktop

## Téléchargement de l'ISO

```bash
mkdir -p ~/debian-desktop
cd ~/debian-desktop
wget --no-clobber https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-13.3.0-amd64-netinst.iso
```

## Création d'un disque virtuel

```bash
cd ~/debian-desktop
qemu-img create -f qcow2 disk.qcow2 20G
```

## Démarrage pour installation

```bash
sudo qemu-system-x86_64 \
  -enable-kvm \
  -cpu host \
  -m 4096 \
  -cdrom debian-13.3.0-amd64-netinst.iso \
  -hda disk.qcow2 \
  -boot d
```

## Démarrage suivants

```bash
sudo qemu-system-x86_64 \
  -enable-kvm \
  -cpu host \
  -m 4096 \
  -hda disk.qcow2
```

