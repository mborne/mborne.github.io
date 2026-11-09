---
tags:
    - Outil
    - Client
    - Gestion de code
search:
    boost: 2
---

# GitHub CLI

> 🤖 Rédaction assistée par IA.

[GitHub CLI](https://cli.github.com/) (`gh`) est l'outil en ligne de commande officiel de GitHub. Il permet de manipuler les **dépôts**, les **issues**, les **pull requests**, les **releases** et les **workflows GitHub Actions** depuis le terminal, ainsi que d'appeler directement l'**API GitHub**.

## Installation

Le paquet `gh` est disponible dans les dépôts Ubuntu, mais sa version est souvent en retard sur les releases (ex : 2.46.0 sur Ubuntu 26.04) :

```bash
sudo apt-get update
sudo apt-get install -y gh
```

Pour disposer de la dernière version, il est préférable d'utiliser le dépôt APT officiel (voir [cli/cli - Installing gh on Linux](https://github.com/cli/cli/blob/trunk/docs/install_linux.md)). [gh/install.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/gh/install.sh) procède à l'ajout de ce dépôt et à l'installation :

```bash
curl -sS https://mborne.github.io/outils/gh/install.sh | bash
```

## Authentification

Deux modes d'authentification sont possibles : **OAuth** (via le navigateur) ou **token** (personal access token). Dans les deux cas, pour vérifier le compte actif et le type de token utilisé :

```bash
gh auth status
```

### OAuth

Par défaut, `gh auth login` propose une authentification OAuth via le navigateur (saisie d'un code à usage unique sur `https://github.com/login/device`) :

```bash
gh auth login --web
```

Le token OAuth obtenu (préfixe `gho_`) est enregistré par `gh` (trousseau système ou `~/.config/gh/hosts.yml`).

!!!warning "Droits étendus avec OAuth"

    Le token OAuth est accordé avec les scopes `repo`, `read:org` et `gist` (+ les éventuels scopes demandés via `--scopes`). Il donne ainsi **accès en lecture et en écriture à l'ensemble des dépôts (publics et privés) accessibles au compte**, y compris ceux des organisations, sans possibilité de restreindre à quelques dépôts.

    En cas de fuite (ex : poste compromis, fichier `hosts.yml` copié, agent IA disposant d'un accès au terminal), l'impact est important. Pour limiter les droits, privilégier un token à granularité fine (voir ci-dessous).

### Token

Un [fine-grained personal access token](https://docs.github.com/fr/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) (préfixe `github_pat_`) peut être **limité à certains dépôts et aux seules permissions nécessaires** (ex : *Contents* en lecture, *Issues* et *Pull requests* en écriture) avec une **date d'expiration**.

Pour enregistrer un token lu sur l'entrée standard :

```bash
gh auth login --with-token < mon-token.txt
```

Pour une utilisation non interactive (CI, scripts), le token peut aussi être fourni via la variable d'environnement `GH_TOKEN` (prioritaire sur les identifiants enregistrés) :

```bash
export GH_TOKEN=github_pat_...
gh issue list -R mborne/mborne.github.io
```

!!!tip "GitHub Actions"

    Dans un workflow GitHub Actions, utiliser le token éphémère fourni par GitHub (`GH_TOKEN: ${{ github.token }}`) dont les droits se règlent avec le bloc `permissions`.

## Configuration de git

Par défaut, `git` et `gh` gèrent leurs identifiants séparément. Pour que les opérations `git` en HTTPS (`git clone`, `git push`, `git pull`) utilisent **le même token que `gh`**, il suffit de déclarer `gh` comme *credential helper* :

```bash
gh auth setup-git
```

Cette commande ajoute la configuration suivante dans `~/.gitconfig` :

```ini
[credential "https://github.com"]
    helper =
    helper = !/usr/bin/gh auth git-credential
[credential "https://gist.github.com"]
    helper =
    helper = !/usr/bin/gh auth git-credential
```

Ainsi :

* Il n'y a qu'un seul token à gérer (renouvellement, révocation) pour `gh` et `git`.
* Un `gh auth login` ou un `gh auth switch` s'applique aussi à `git`.
* Le protocole utilisé par `gh repo clone` se configure avec `gh config set git_protocol https` (ou `ssh`).

Pour afficher le token utilisé (ex : pour le transmettre à un autre outil) :

```bash
gh auth token
```

## Utilisation

Pour afficher l'aide :

```bash
gh --help
gh issue --help
```

### Dépôts

```bash
# cloner un dépôt
gh repo clone mborne/mborne.github.io
# afficher la description d'un dépôt
gh repo view mborne/mborne.github.io
# ouvrir le dépôt courant dans le navigateur
gh repo view --web
# créer un dépôt à partir du dossier courant
gh repo create mon-projet --private --source=. --push
```

### Issues

```bash
# lister les issues ouvertes
gh issue list
# rechercher dans toutes les issues
gh issue list --state all --search "gh"
# créer une issue
gh issue create --title "Mon titre" --label enhancement --body-file issue.md
# afficher une issue
gh issue view 72
```

### Pull requests

```bash
# créer une PR à partir de la branche courante
gh pr create --fill
# lister les PR ouvertes
gh pr list
# récupérer localement la branche d'une PR pour revue
gh pr checkout 70
# consulter l'état des checks d'une PR
gh pr checks 70
# fusionner une PR et supprimer la branche
gh pr merge 70 --merge --delete-branch
```

### GitHub Actions

```bash
# lister les dernières exécutions
gh run list
# suivre une exécution en cours
gh run watch
# afficher les logs des jobs en échec
gh run view --log-failed
# déclencher un workflow (on: workflow_dispatch)
gh workflow run ci.yml
```

### Releases

```bash
# créer une release avec génération automatique des notes
gh release create v1.0.0 --generate-notes
# télécharger les fichiers d'une release
gh release download v1.0.0 -R sigstore/cosign --pattern '*amd64.deb'
```

### API

`gh api` permet d'appeler l'API REST (ou GraphQL) de GitHub en réutilisant l'authentification, avec un filtrage du résultat via `--jq` :

```bash
# dernière version d'un outil
gh api repos/sigstore/cosign/releases/latest --jq .tag_name
# liste des fichiers d'un dépôt
gh api "repos/mborne/mborne.github.io/git/trees/HEAD?recursive=1" --jq '.tree[].path'
```

## Ressources

* [cli.github.com - GitHub CLI](https://cli.github.com/)
* [cli.github.com - Manuel](https://cli.github.com/manual/)
* [cli.github.com - gh auth setup-git](https://cli.github.com/manual/gh_auth_setup-git)
* [github.com - cli/cli - Installing gh on Linux](https://github.com/cli/cli/blob/trunk/docs/install_linux.md)
