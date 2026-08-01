---
tags:
    - Outil
    - Sécurité
    - Scanner de secret
search:
    boost: 2
---

# Gitleaks

> 🤖 Rédaction assistée par IA.

[Gitleaks](https://github.com/gitleaks/gitleaks#readme) est un outil open source pour détecter des secrets (tokens, clés API, mots de passe, etc.) dans les dépôts Git.

## Installation

* [gitleaks/gitleaks - releases](https://github.com/gitleaks/gitleaks/releases)
* [gitleaks/install.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/gitleaks/install.sh) procède au téléchargement de l'archive Linux et à l'installation du binaire dans `/usr/local/bin` :

```bash
curl -sS https://mborne.github.io/outils/gitleaks/install.sh | bash
```

## Usage

```bash
# scan du dépôt courant
gitleaks detect --source .

# scan de l'historique git
gitleaks git --verbose
```

## Ressources

* [github.com - gitleaks/gitleaks](https://github.com/gitleaks/gitleaks#readme)
* [github.com - gitleaks/gitleaks - Documentation](https://github.com/gitleaks/gitleaks/tree/master/docs)
