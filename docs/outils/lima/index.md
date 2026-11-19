---
tags:
    - Outil
    - Virtualisation
    - Lima VM
search:
    boost: 2
---

# Lima VM

> 🤖 Rédaction assistée par IA.

[Lima](https://lima-vm.io/) permet d'exécuter des machines virtuelles Linux locales de manière légère, avec une expérience orientée ligne de commande.

## Points clés

- Création d'une VM en une commande (`limactl start`) à partir de [templates](https://lima-vm.io/docs/templates/) (`limactl create --list-templates`) : Ubuntu, Debian, Fedora, Alpine...
- Configuration de la VM en YAML (ressources, montages, provisionnement), avec des valeurs par défaut communes à toutes les VM (voir [Personnalisation](#personnalisation)).
- Accès SSH transparent (`ssh lima-<nom>`) grâce à une configuration SSH générée pour chaque VM (voir [Accès SSH](#acces-ssh)).
- Partage de fichiers entre l'hôte et la VM (montage du home de l'hôte en lecture seule par défaut, `limactl copy`).

### Systèmes supportés

> Voir aussi [lima-vm.io - VM types](https://lima-vm.io/docs/config/vmtype/)

- Linux : [QEMU](../qemu/index.md) avec [KVM](../kvm/index.md)
- Windows : [WSL2 avec virtualisation imbriquée](../wsl/index.md#virtualisation-imbriquee-kvm)
- MacOS

## Installation

- [lima-vm.io - installation](https://lima-vm.io/docs/installation/)
- [lima/install.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/lima/install.sh) reprend l'approche d'installation à partir du binaire (avec une extraction un peu plus maîtrisée) :

```bash
curl -sSL https://mborne.github.io/outils/lima/install.sh | bash
```

Vérification :

```bash
lima --version
limactl --version
limactl create --list-templates
limactl info
```

## Principales commandes

Les liens pointent vers la [référence de la ligne de commande](https://lima-vm.io/docs/reference/) :

| Action                                   | Commande                                                                                                                                            |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| Afficher l'aide                          | `limactl --help`                                                                                                                                    |
| Lister les templates disponibles         | [`limactl create --list-templates`](https://lima-vm.io/docs/reference/limactl_create/)                                                              |
| Créer une VM (sans la démarrer)          | [`limactl create --name <nom> --cpus 4 --memory 8 --disk 50 [template]`](https://lima-vm.io/docs/reference/limactl_create/)                         |
| Créer et/ou démarrer une VM              | [`limactl start <nom>`](https://lima-vm.io/docs/reference/limactl_start/)                                                                           |
| Lister les VM (état, driver, ressources) | [`limactl list`](https://lima-vm.io/docs/reference/limactl_list/)                                                                                   |
| Ouvrir un shell dans la VM               | [`limactl shell <nom>`](https://lima-vm.io/docs/reference/limactl_shell/) (`lima` pour la VM `default` ou `$LIMA_INSTANCE`)                         |
| Exécuter une commande dans la VM         | [`limactl shell <nom> -- <commande>`](https://lima-vm.io/docs/reference/limactl_shell/)                                                             |
| Copier un fichier vers la VM             | [`limactl copy fichier.txt <nom>:~/`](https://lima-vm.io/docs/reference/limactl_copy/) (`-r` pour un dossier)                                       |
| Modifier la configuration d'une VM       | [`limactl edit <nom>`](https://lima-vm.io/docs/reference/limactl_edit/)                                                                             |
| Arrêter / démarrer la VM                 | [`limactl stop <nom>`](https://lima-vm.io/docs/reference/limactl_stop/) / [`limactl start <nom>`](https://lima-vm.io/docs/reference/limactl_start/) |
| Supprimer la VM                          | [`limactl delete <nom>`](https://lima-vm.io/docs/reference/limactl_delete/)                                                                         |

Sans option, une VM dispose de `min(4, nombre de CPU de l'hôte)` CPU, de `min(4GiB, moitié de la RAM de l'hôte)` de mémoire et d'un disque de 100GiB.

Lors du premier `limactl start` sans nom, Lima propose de créer la VM `default` à partir du template `default` (Ubuntu).

## Montages

Par défaut, le home de l'hôte est monté **en lecture seule** au même chemin dans la VM (`/tmp/lima` n'est plus monté depuis la v2.0). Les options de `limactl create` / `limactl start` permettent d'ajuster ce comportement :

| Option                       | Effet                                                                 |
| ---------------------------- | --------------------------------------------------------------------- |
| `--mount <dossier>[:w]`      | Ajoute un montage (`:w` pour l'accès en écriture)                     |
| `--mount-only <dossier>[:w]` | Remplace les montages par défaut (ex : `--mount-only $HOME/devbox:w`) |
| `--mount-none`               | Supprime tous les montages (isolation de la VM vis-à-vis de l'hôte)   |
| `--mount-writable`           | Rend tous les montages accessibles en écriture                        |

Le type de montage par défaut est `9p` avec `qemu` et `virtiofs` avec `vz` (voir [lima-vm.io - Filesystem mounts](https://lima-vm.io/docs/config/mount/)).

## Accès SSH

Lima génère pour chaque VM un fichier `~/.lima/<nom>/ssh.config` (clé SSH dédiée, `StrictHostKeyChecking=yes`). En ajoutant la ligne suivante dans `~/.ssh/config` :

```text
Include ~/.lima/*/ssh.config
```

... les VM sont accessibles en SSH avec `ssh lima-<nom>`, ce qui est notamment utile avec VSCode en remote SSH.

Dans la VM, l'utilisateur porte par défaut le même nom que sur l'hôte et son home est `/home/<user>.guest` (`/home/<user>.linux` avant la v2.1).

## Personnalisation

Le fichier `~/.lima/_config/default.yaml` permet de personnaliser toutes les VM (voir modèle [github.com - lima-vm/lima - templates/default.yaml](https://github.com/lima-vm/lima/blob/master/templates/default.yaml))

### Support d'un proxy d'entreprise

Il est possible de configurer les variables d'environnement et apt comme suit :

```yaml
env:
  HTTP_PROXY: "http://proxy:3128"
  HTTPS_PROXY: "http://proxy:3128"
  NO_PROXY: "localhost,127.0.0.1"
  NODE_USE_ENV_PROXY: '1'

provision:
  - mode: system
    script: |
      #!/bin/sh
      cat > /etc/apt/apt.conf.d/90proxy <<'EOF'
      Acquire::http::Proxy "http://proxy:3128";
      Acquire::https::Proxy "http://proxy:3128";
      EOF
```

## Cas d'utilisation

- [Création d'une VM de DEV pour VSCode en remote SSH](devbox-vscode.md)

## Limites

### GPU limité au driver krunkit

L'accélération GPU n'est supportée qu'avec le driver `krunkit` (expérimental, macOS sur Apple Silicon, Vulkan via Venus), voir [lima-vm.io - GPU](https://lima-vm.io/docs/config/gpu/). Impact : pas de GPU sous Linux et Windows (pas de PyTorch CUDA dans la VM).

### KVM dans la VM selon le driver

La virtualisation imbriquée s'active avec `nestedVirtualization: true` (ou `--nested-virt`) :

- Linux (`qemu`, invité x86_64) : disponible si la virtualisation imbriquée est activée sur l'hôte (paramètre `nested` de `kvm_intel` / `kvm_amd`) ;
- macOS (`vz` ou `krunkit`) : Apple M3 ou plus récent avec macOS 15 ou plus récent.

Sur un **hôte déjà virtualisé** (VDI, VM cloud, runner CI, WSL2), Lima ne démarre que si l'hyperviseur sous-jacent expose la virtualisation imbriquée.

Pour vérifier dans la VM, voir le diagnostic de la fiche [KVM - Pré-requis](../kvm/index.md#pre-requis).

## Ressources

- [lima-vm.io - Documentation](https://lima-vm.io/docs/)
- [lima-vm.io - VM types](https://lima-vm.io/docs/config/vmtype/) (drivers par OS)
- [lima-vm.io - Filesystem mounts](https://lima-vm.io/docs/config/mount/)
- [lima-vm.io - SSH](https://lima-vm.io/docs/usage/ssh/)
- [lima-vm.io - Visual Studio Code](https://lima-vm.io/docs/examples/vscode/)
- [github.com - lima-vm/lima - templates/default.yaml](https://github.com/lima-vm/lima/blob/master/templates/default.yaml) - modèle pour `~/.lima/_config/default.yaml`
