# Linux - Compilation du noyau et démarrage avec QEMU

> 🤖 Rédaction assistée par IA.

## 🎯 Objectifs

* Comprendre la chaîne de compilation du noyau Linux
* Configurer un noyau personnalisé
* Compiler un noyau Linux minimal
* Démarrer ce noyau dans une machine virtuelle QEMU
* Observer les messages de démarrage (boot log)

## Principe du TP

Pour monter un système Linux minimaliste, il faut :

* Le noyau (gestion des processus, de la mémoire, des périphériques, des systèmes de fichiers,...)
* Un rootfs avec un `/sbin/init`
* Une image disque contenant ce rootfs pour le démarrage avec QEMU

L’idée est ici de construire ces éléments et de booter avec QEMU pour observer le rôle du noyau et du rootfs.

---

## 🛠️ Préparation de l’environnement

Un script [compilation.sh](compilation.sh) automatisant toutes les étapes (noyau, rootfs, image disque) est fourni ; les sections suivantes détaillent chaque étape à la main.

### 1. Installation des dépendances

Sous Debian / Ubuntu (même liste que le script) :

```bash
sudo apt update
sudo apt install -y build-essential libncurses-dev flex bison openssl libssl-dev \
    libelf-dev qemu-system-x86 debootstrap
```

### 2. Création d’un répertoire de travail

```bash
mkdir -p ~/tp-linux-kernel
cd ~/tp-linux-kernel
```

---

## 📥 Récupération des sources du noyau

Depuis `~/tp-linux-kernel` (même version que le script) :

```bash
cd ~/tp-linux-kernel
wget -O linux-6.8.tar.xz https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.8.tar.xz
tar -xf linux-6.8.tar.xz
cd linux-6.8
```

---

## ⚙️ Configuration du noyau

### 1. Configuration minimale

```bash
make defconfig
```

### 2. Personnalisation (équivalent script : `scripts/config`)

```bash
make menuconfig
```

Points importants à vérifier (le script fait la même chose en non interactif avec `./scripts/config`) :

* **File systems** → **The Extended 4 (ext4) filesystem** : doit être activé (`=y`) pour monter l’image disque rootfs en ext4.
* **Virtualization** → **Kernel-based Virtual Machine (KVM)** : optionnel, pour accélérer QEMU avec KVM sur Linux.

Sauvegarder puis quitter.

---

## 🔨 Compilation du noyau

Lancer la commande suivante (**ce sera long**) :

```bash
make -j$(nproc)
```

À la fin, le noyau compilé se trouve dans :

```
arch/x86/boot/bzImage
```

---

## 🧱 Construction du rootfs avec debootstrap

Depuis `~/tp-linux-kernel` (même méthode que le script) :

```bash
cd ~/tp-linux-kernel
sudo debootstrap --arch=amd64 --foreign trixie --include=figlet ~/tp-linux-kernel/rootfs
```

Il faut ensuite créer `rootfs/sbin/init` avec le contenu suivant (avec `sudo` car le rootfs appartient à root) :

```bash
sudo tee ~/tp-linux-kernel/rootfs/sbin/init > /dev/null << 'INIT'
#!/bin/sh
mount -t proc none /proc
mount -t sysfs none /sys
mount -t devtmpfs none /dev
exec /bin/sh
INIT
sudo chmod +x ~/tp-linux-kernel/rootfs/sbin/init
```

---

## 📦 Création de l'image disque

On crée une **image disque** ext4 (comme le script), pas d'initramfs : le noyau montera ce disque comme racine avec `root=/dev/sda`. Le support ext4 doit être compilé dans le noyau (voir section Configuration).

Depuis `~/tp-linux-kernel` :

```bash
cd ~/tp-linux-kernel
IMG=~/tp-linux-kernel/rootfs.img
MNT=~/tp-linux-kernel/mnt
truncate -s 2G "$IMG"
mkfs.ext4 -F "$IMG"
mkdir -p "$MNT"
sudo mount -o loop "$IMG" "$MNT"
sudo cp -a ~/tp-linux-kernel/rootfs/. "$MNT/"
sudo umount "$MNT"
rmdir "$MNT"
```

---

## 🚀 Démarrage avec QEMU

Une fois `rootfs.img` créée, on peut booter comme suit avec QEMU :

```bash
cd ~/tp-linux-kernel

qemu-system-x86_64 \
  -kernel linux-6.8/arch/x86/boot/bzImage \
  -drive file=rootfs.img,format=raw \
  -append "root=/dev/sda console=ttyS0" \
  -nographic
```

Remarques :

- `-drive file=rootfs.img,format=raw` : le premier disque vu par le noyau est `/dev/sda`.
- `root=/dev/sda` : le noyau monte ce disque comme racine (ext4).
- `console=ttyS0` : affichage sur la console série (nécessaire avec `-nographic`).
- Pas d'initramfs : le noyau a le pilote ext4 compilé en dur et monte directement `/dev/sda`.

Si tout est correct, vous obtenez un shell minimal après le boot.

---

## 🔍 Exploration

Essayez :

```bash
uname -a
ps
mount
ls /
```

---

## 🧪 Exercices complémentaires

### 1. Ajout du support réseau

* Reconfigurer le noyau pour activer :

  * `Networking support`
  * `Virtio network driver`

Puis relancer QEMU avec :

```bash
-netdev user,id=net0 -device virtio-net-pci,netdev=net0
```

---

## 🎁 Bonus

Ajoutez un message ASCII-art personnalisé au boot 😄
