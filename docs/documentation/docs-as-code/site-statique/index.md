---
tags:
    - Documentation
    - Docs as code
    - MkDocs
---

# Publier un site statique

> 🤖 Rédaction assistée par IA.

## Principe

Deuxième étape de [docs as code](../index.md) : **générer un site statique** à partir des fichiers Markdown et le **publier avec la fonctionnalité "pages"** de l'usine logicielle (GitHub Pages, GitLab Pages). Le site apporte un menu de navigation, une recherche et une mise en forme homogène.

L'exemple ci-dessous s'appuie sur [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) (voir [Sites web](../../sites-web/index.md) pour les alternatives).

## Structure minimale

```text
.
├── mkdocs.yml
└── docs/
    └── index.md
```

Avec un fichier `mkdocs.yml` minimal :

```yaml
site_name: Ma documentation
theme:
  name: material
  language: fr
```

## Prévisualiser en local

```bash
pip install mkdocs-material
mkdocs serve
# ouvrir http://localhost:8000
```

## Publier avec GitHub Pages

Le workflow [.github/workflows/ci.yml](https://github.com/mborne/mborne.github.io/blob/main/.github/workflows/ci.yml) de ce site publie la documentation à chaque modification de la branche `main` avec `mkdocs gh-deploy` (voir [Material for MkDocs - Publishing your site - GitHub Pages](https://squidfunk.github.io/mkdocs-material/publishing-your-site/#github-pages)).

## Publier avec GitLab Pages

Avec GitLab, un job `pages` produisant un dossier `public` dans le fichier `.gitlab-ci.yml` suffit (voir [Material for MkDocs - Publishing your site - GitLab Pages](https://squidfunk.github.io/mkdocs-material/publishing-your-site/#gitlab-pages)) :

```yaml
pages:
  image: python:3
  script:
    - pip install mkdocs-material
    - mkdocs build --site-dir public
  artifacts:
    paths:
      - public
  rules:
    - if: $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH
```

## Exemple

Ce site est un exemple complet : [mborne/mborne.github.io](https://github.com/mborne/mborne.github.io) (voir [mkdocs.yml](https://github.com/mborne/mborne.github.io/blob/main/mkdocs.yml) pour la navigation, les plugins et les extensions Markdown).

Pour aller plus loin : [Contrôler la documentation en CI](../controles/index.md).
