---
tags:
    - Outil
    - Virtualisation
    - Sandboxing agent IA
    - microsandbox
search:
    boost: 2
---

# microsandbox

> 🤖 Rédaction assistée par IA.

!!! warning "En construction"

    Test en cours de microsandbox comme alternative à [Lima](../lima/index.md), [Multipass](../multipass/index.md) & co (vu dans [etalab-ia/codebox](https://github.com/etalab-ia/codebox)).

[microsandbox](https://github.com/superradcompany/microsandbox) est un outil (CLI `msb` et SDK) qui exécute des **images OCI** (Docker Hub, GHCR...) dans des **microVM** légères basées sur [libkrun](https://github.com/containers/libkrun), avec un noyau Linux propre à chaque sandbox.
Il cible l'exécution de code non fiable, notamment par des agents IA.

!!! warning "Logiciel en bêta"

    microsandbox est en bêta (« Expect breaking changes, missing features, and rough edges », voir [README](https://github.com/superradcompany/microsandbox)). Cette fiche est rédigée avec la version 0.7.16.

## Points clés

- Création d'une sandbox en une commande à partir d'une image OCI (`msb run debian`).
- Isolation par VM (noyau, système de fichiers et réseau propres) plutôt que par conteneur.
- Configuration d'une sandbox en YAML (`--conf sandbox.yaml` : image, ressources, montages, réseau, secrets).
- Politique réseau fine : **liste blanche de domaines**, interception TLS, **sortie par un proxy** HTTP/SOCKS (voir [Réseau](#reseau)).
- **Secrets substitués à la volée** dans les requêtes vers des domaines autorisés : la sandbox ne voit qu'une valeur de substitution, **le secret n'entre jamais dans la VM** (voir [Secrets](#secrets)).
- Accès SSH (`msb ssh`), utile avec VSCode en remote SSH.
- Snapshots et forks de sandbox (`msb snapshot`, `msb fork`).
- SDK TypeScript, Python, Rust, Go et Ruby pour piloter les sandboxes depuis du code.

## Systèmes supportés

Voir [docs.microsandbox.dev - CLI](https://docs.microsandbox.dev/cli/overview) :

| OS                                  | Pré-requis                                                                                                                                                   |
| ----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Linux (x64, ARM64)                  | glibc 2.28+ et [KVM](../kvm/index.md) (`/dev/kvm`), voir [Troubleshooting Linux](https://docs.microsandbox.dev/troubleshooting/linux)                        |
| macOS                               | Apple Silicon uniquement (pas de Mac Intel), voir [Troubleshooting macOS](https://docs.microsandbox.dev/troubleshooting/macos)                               |
| Windows 10/11 (x64, ARM64), preview | Fonctionnalité **Windows Hypervisor Platform** (`HypervisorPlatform`), voir [Troubleshooting Windows](https://docs.microsandbox.dev/troubleshooting/windows) |

Sous Windows, `HypervisorPlatform` est distincte de **Plateforme de machine virtuelle** (`VirtualMachinePlatform`) activée pour [WSL2](../wsl/index.md) :

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName HypervisorPlatform -All -NoRestart
```

## Installation

Voir [docs.microsandbox.dev - CLI](https://docs.microsandbox.dev/cli/overview) :

```bash
# Linux et macOS (installation dans ~/.microsandbox avec un lien dans ~/.local/bin)
curl -fsSL https://install.microsandbox.dev | sh
```

```powershell
# Windows (preview)
irm https://install.microsandbox.dev/windows | iex
```

Vérification :

```bash
msb --version
# vérification de la configuration de l'hôte (KVM, WHP...)
msb doctor
```

Mise à jour : `msb update`.

## Principales commandes

Les liens pointent vers la [référence de la ligne de commande](https://docs.microsandbox.dev/cli/sandbox-commands) :

| Action                                         | Commande                                                                                                                                                            |
| ---------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Afficher l'aide                                | `msb --help`                                                                                                                                                        |
| Exécuter une commande dans une sandbox         | [`msb run debian -- <commande>`](https://docs.microsandbox.dev/cli/sandbox-commands#msb-run) (sandbox supprimée à la sortie)                                        |
| Créer et démarrer une sandbox en tâche de fond | [`msb create --name <nom> --cpus 4 --memory 4G [--conf sandbox.yaml] [image]`](https://docs.microsandbox.dev/cli/sandbox-commands#msb-create)                       |
| Lister les sandboxes                           | [`msb list`](https://docs.microsandbox.dev/cli/sandbox-commands#msb-list)                                                                                           |
| Afficher le détail d'une sandbox               | [`msb inspect <nom>`](https://docs.microsandbox.dev/cli/sandbox-commands#msb-inspect)                                                                               |
| Ouvrir un shell dans la sandbox                | [`msb ssh <nom>`](https://docs.microsandbox.dev/cli/ssh-commands#msb-ssh)                                                                                           |
| Exécuter une commande dans la sandbox          | [`msb exec <nom> -- <commande>`](https://docs.microsandbox.dev/cli/sandbox-commands#msb-exec)                                                                       |
| Monter un dossier ou un volume                 | `-v ./src:/app` (dossier de l'hôte) ou `--mount-named <volume>:/data` (volume nommé) à la création                                                                  |
| Copier un fichier vers la sandbox              | [`msb copy fichier.txt <nom>:/chemin/absolu`](https://docs.microsandbox.dev/cli/sandbox-commands#msb-copy)                                                          |
| Arrêter / démarrer la sandbox                  | [`msb stop <nom>`](https://docs.microsandbox.dev/cli/sandbox-commands#msb-stop) / [`msb start <nom>`](https://docs.microsandbox.dev/cli/sandbox-commands#msb-start) |
| Supprimer la sandbox                           | [`msb remove <nom>`](https://docs.microsandbox.dev/cli/sandbox-commands#msb-remove) (`msb rm -f <nom>` si elle tourne)                                              |

## Configuration

### Fichier de configuration

Il est possible de passer un fichier YAML qui décrit la sandbox avec `--conf` (voir [docs.microsandbox.dev - Configuration](https://docs.microsandbox.dev/cli/configuration)) :

```yaml
image: "ubuntu:24.04"
cpus: 4
memory: "4G"
workdir: "/workspace"
mounts:
  - named: workspace
    target: "/workspace"
    create: ensure-exists
network:
  allow: ["github.com", "api.github.com"]
  tls:
    enabled: true
```

```bash
msb create --name devbox --conf sandbox.yaml
msb ssh devbox
```

### Réseau

Voir [docs.microsandbox.dev - Networking](https://docs.microsandbox.dev/networking/overview) :

- Par défaut, l'accès à Internet est autorisé, mais les adresses privées, loopback, link-local et le service de métadonnées cloud sont bloqués.
- Une liste `network.allow` non vide bloque tout le reste (y compris la résolution DNS des domaines non autorisés).
- Le **mode strict** (actif par défaut) impose l'**interception TLS** (`network.tls.enabled: true` ou `--tls-intercept`) pour autoriser du HTTPS sur un nom de domaine : msb vérifie alors l'en-tête `Host` réellement demandé.

### Secrets

Les secrets sont déclarés avec une liste de domaines de destination (voir [docs.microsandbox.dev - Secrets](https://docs.microsandbox.dev/sandboxes/secrets)). La sandbox ne voit qu'une valeur factice, remplacée par la vraie valeur par msb uniquement dans les requêtes vers ces domaines :

```yaml
secrets:
  GITHUB_TOKEN:
    allow: ["api.github.com", "github.com"]
secret_violation_action: block-and-log
```

### Proxy sortant

L'option `--proxy` fait sortir le trafic de la sandbox par un proxy.

⚠️ Le filtrage par domaine est fait par msb : le proxy reçoit actuellement `CONNECT <IP>:<port>` et ne voit pas le nom de domaine[^proxy-connect].

Voir :

- [docs.microsandbox.dev - Outbound proxies](https://docs.microsandbox.dev/networking/outbound-proxy)
- [microsandbox - utilisation d'un proxy sortant](proxy.md)

## Limites

### Pas de GPU

Aucun support GPU n'est documenté : pas de PyTorch CUDA dans une sandbox.

### KVM dans la sandbox

La virtualisation imbriquée s'active avec `--nested-virt` (désactivée par défaut).

Sur un **hôte déjà virtualisé** (VDI, VM cloud, runner CI, [WSL2](../wsl/index.md#virtualisation-imbriquee-kvm)), microsandbox ne démarre que si l'hyperviseur sous-jacent expose la virtualisation imbriquée (`/dev/kvm`).

Pour vérifier dans la sandbox, voir le diagnostic de la fiche [KVM - Pré-requis](../kvm/index.md#pre-requis).

### Images OCI et non VM complètes

Une sandbox démarre à partir d'une image de conteneur et non d'une image cloud : pas de [cloud-init](../cloud-init/index.md) comme avec [Multipass](../multipass/index.md) ou [Lima](../lima/index.md). Le provisionnement se fait plutôt dans l'image (Dockerfile).

## Ressources

- [docs.microsandbox.dev](https://docs.microsandbox.dev/) ([llms.txt](https://docs.microsandbox.dev/llms.txt))
- [github.com - superradcompany/microsandbox](https://github.com/superradcompany/microsandbox) (Apache-2.0)
- [docs.microsandbox.dev - Configuration](https://docs.microsandbox.dev/cli/configuration)
- [docs.microsandbox.dev - Networking](https://docs.microsandbox.dev/networking/overview)
- [docs.microsandbox.dev - SSH](https://docs.microsandbox.dev/cli/ssh-commands)

[^proxy-connect]: Voir [superradcompany/microsandbox#1773 - How should DNS resolution work with outbound proxies?](https://github.com/superradcompany/microsandbox/issues/1773) (issue ouverte au 20/11/2026) sur l'envoi du nom d'hôte dans le `CONNECT`.
