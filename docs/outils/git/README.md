---
tags:
    - Outil
    - Gestion de code
search:
    boost: 5
---

# git

## Installation

```bash
sudo apt-get update
sudo apt-get install -y git
```

## Gestion des dépôts

* [mborne/git-manager](https://github.com/mborne/git-manager) permet de sauvegarder et de scanner des dépôts GIT depuis des instances GitHub, GitLab ou Gitea.
* [mborne/satis-gitlab](https://github.com/mborne/satis-gitlab) génère un fichier de configuration [SATIS](https://github.com/composer/satis?tab=readme-ov-file#satis) en listant les dépôts GIT contenant un fichier `composer.json`
* [mborne/remote-git](https://github.com/mborne/remote-git) est un client léger écrit en PHP pour lister les dépôts depuis des instances GitHub, GitLab ou Gitea (c'est le coeur de git-manager et satis-gitlab)

## Ressources

* [about.gitlab.com - Git Cheat Sheet](https://about.gitlab.com/images/press/git-cheat-sheet.pdf)
* [www.conventionalcommits.org - Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/#summary)

> chore, docs, feat, fix, refactor, share, style et test
