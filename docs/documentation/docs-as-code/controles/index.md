---
tags:
    - Documentation
    - Docs as code
---

# Contrôler la documentation en CI

> 🤖 Rédaction assistée par IA.

## Principe

Troisième étape de [docs as code](../index.md) : **vérifier automatiquement la documentation** à chaque *merge request* / *pull request*, comme on le fait pour le code avec des tests.

## Vérifier la syntaxe Markdown

- [markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2#readme) contrôle la syntaxe et l'homogénéité des fichiers Markdown (configuration dans un fichier `.markdownlint.yml`).

```bash
npx markdownlint-cli2 "docs/**/*.md"
```

## Contrôler les liens

- [markdown-link-check](https://github.com/tcort/markdown-link-check#readme)

```bash
npx -y markdown-link-check ./docs/outils
```

## Construire le site en mode strict

Avec MkDocs, `mkdocs build --strict` échoue en cas d'avertissement. La section `validation` du fichier `mkdocs.yml` permet de contrôler les liens internes, les ancres et le référencement des pages dans la navigation (voir [mkdocs.yml](https://github.com/mborne/mborne.github.io/blob/main/mkdocs.yml) de ce site) :

```yaml
validation:
  nav:
    omitted_files: warn
    not_found: warn
  links:
    anchors: warn
```

## Exécuter les contrôles en CI

Exemple de workflow GitHub Actions exécuté sur chaque *pull request* :

```yaml
name: docs
on: pull_request
jobs:
  check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npx markdownlint-cli2 "docs/**/*.md"
      - run: pip install mkdocs-material
      - run: mkdocs build --strict
```
