# QEMU - Création d'une image ubuntu desktop

## Démarrage pour installation

```bash
qemu-system-x86_64  \
  -machine type=q35,accel=kvm \
  -cpu host \
  -m 4096 \
  -vga virtio \
  -drive if=virtio,format=qcow2,file=os.img \
  -drive file=ubuntu-24.04.3-desktop-amd64.iso,media=cdrom,readonly=on \
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
