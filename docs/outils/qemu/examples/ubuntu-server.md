# QEMU - création d'une VM ubuntu server

> Adapté à partir de [documentation.ubuntu.com - Launch QCOW images using QEMU](https://documentation.ubuntu.com/public-images/public-images-how-to/launch-qcow-with-qemu/)

## Pré-requis

```bash
sudo apt update
sudo apt install --yes qemu-system-x86

# cloud-localds pour génération du fichier seed.raw pour cloudinit
sudo apt install --yes cloud-image-utils
# mkpasswd pour hash du mot de passe de l'utilisateur ubuntu
sudo apt install --yes whois
```

## Créer un dossier de travail

```bash

mkdir -p ~/qemu/ubuntu-server
# se placer dans celui-ci
cd ~/qemu/ubuntu-server
```

## Télécharger l'image de l'OS

> Voir [Ubuntu Cloud Images](https://cloud-images.ubuntu.com)

```bash
# téléchargement de l'image cloud
wget -O os.img https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
```

## Configuration via cloudinit

* Générer un fichier `meta-data` avec un identifiant d'instance et le nom de la VM :

```bash
# Génération des métadonnées
cat > meta-data <<EOF
#cloud-config
hostname: ubuntu-server
manage_etc_hosts: true
instance-id: $(uuidgen || echo i-abcdefg)
EOF
```

* Générer un fichier `user-data` pour spécifier un mot de passe pour l'utilisateur ubuntu :

```bash
# Calcul du hash du mot de passe de l'utilisateur ubuntu
UBUNTU_PASSWORD_HASH=$(echo ChangeIt | mkpasswd -m sha-512 -s)

# Génération du fichier user-data
cat > user-data <<EOF
#cloud-config
hostname: ubuntu-server
manage_etc_hosts: true

users:
  - name: ubuntu
    sudo: ALL=(ALL) NOPASSWD:ALL
    groups: users, admin
    home: /home/ubuntu
    shell: /bin/bash
    lock_passwd: false
    passwd: "${UBUNTU_PASSWORD_HASH}"
    chpasswd: { expire: False }

autoinstall:
    version: 1
    identity:
        hostname: ubuntu-server
        username: ubuntu
        password: "${UBUNTU_PASSWORD_HASH}"
    refresh-installer:
        update: yes

package_update: true
packages:
  - curl
  - htop
runcmd:
  - echo "✅ Cloud-init terminé !" > /home/ubuntu/ready.txt
EOF
```

* Générer le fichier `seed.img` à partir de `user-data` et `meta-data`

```bash
cloud-localds seed.img user-data meta-data
```

## Démarrer la VM

```bash
# -snapshot
qemu-system-x86_64  \
  -machine type=q35,accel=kvm \
  -cpu host \
  -m 2048 \
  -nographic \
  -drive if=virtio,format=qcow2,file=os.img \
  -drive if=virtio,format=raw,file=seed.img \
  -nic user,model=virtio

# Pour port-forwarding :
#  -netdev id=net00,type=user,hostfwd=tcp::10080-:80 \
#  -device virtio-net-pci,netdev=net00 \
```

## Démarrer avec un bridge

* Autoriser l'utilisation du bridge via `/etc/qemu/bridge.conf` :

```bash
allow br0
```

* Démarrer la VM

```bash
# Générer une addresse MAC
MAC="52:54:00:$(openssl rand -hex 3 | sed 's/\(..\)/\1:/g; s/:$//')"
echo "Generated MAC: $MAC"

sudo qemu-system-x86_64  \
  -machine type=q35,accel=kvm \
  -cpu host \
  -m 2048 \
  -nographic \
  -drive if=virtio,format=qcow2,file=os.img \
  -drive if=virtio,format=raw,file=seed.img \
  -nic user,model=virtio \
  -nic bridge,br=br0,model=virtio,mac=$MAC
```





