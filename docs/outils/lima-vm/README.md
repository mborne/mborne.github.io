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

## Pré-requis

- Linux : qemu-kvm
- Windows : [WSL2 avec virtualisation imbriquée](../wsl/README.md#virtualisation-imbriquée) + [qemu/kvm](../kvm/README.md)

## Installation

- [lima-vm.io - installation](https://lima-vm.io/docs/installation/)
- [lima-vm/install.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/lima-vm/install.sh) reprend l'approche d'installation à partir du binaire (avec une extraction un peu plus maîtrisée) :

```bash
curl -sSL https://mborne.github.io/outils/lima-vm/install.sh | bash
```

Vérification :

```bash
lima --version
limactl --version
limactl template ls
limactl info
```

## Commandes utiles

Pour un premier usage, les commandes suivantes couvrent l'essentiel :

| Action                                       | Commande                 |
| -------------------------------------------- | ------------------------ |
| Afficher l'aide et les commandes disponibles | `limactl --help`         |
| Créer et démarrer une VM                     | `limactl start`          |
| Ouvrir un shell dans la VM `default`         | `limactl shell default`  |
| Lister les VM                                | `limactl list`           |
| Arrêter la VM `default`                      | `limactl stop default`   |
| Supprimer la VM `default`                    | `limactl delete default` |

Lors du premier démarrage, Lima vous proposera un template, par exemple `default`.

## Personnalisation

Le fichier `~/.lima/_config/default.yaml` permet de personnaliser toutes les VM (voir modèle [github.com - lima-vm/lima - templates/default.yaml](https://github.com/lima-vm/lima/blob/master/templates/default.yaml))

### Support d'un proxy

Pour le support d'un proxy d'entreprise, il est possible de configurer les variables d'environnement et apt comme suit :

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


## Ressources

- [lima-vm.io - Documentation](https://lima-vm.io/docs/)
- [github.com - lima-vm/lima - templates/default.yaml](https://github.com/lima-vm/lima/blob/master/templates/default.yaml)) - modèle pour `~/.lima/_config/default.yaml`
