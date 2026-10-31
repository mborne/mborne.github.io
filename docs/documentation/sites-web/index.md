# Générateurs de site

Un **générateur de site statique** transforme un **dépôt de fichiers Markdown** (et un fichier de configuration) en **site web** : pages HTML, menu de navigation, recherche, thème graphique.

Le résultat est un ensemble de fichiers statiques qui peut être publié sur n'importe quel hébergement web, en particulier avec GitHub Pages ou GitLab Pages (voir [Publier un site statique](../docs-as-code/site-statique/index.md)).

## Outils

- [Jekyll](https://jekyllrb.com/) qui est utilisé par défaut pour GitHub pages.
- [MkDocs](https://www.mkdocs.org/)
    - [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
- [Docsify](https://docsify.js.org/#/)
- [github.com - Static Site Generators](https://github.com/collections/static-site-generators)
- [jamstack.org - Site Generators](https://jamstack.org/generators/)

!!!warning "Mise en garde"

    Ce site utilise [mkdocs-material](https://squidfunk.github.io/mkdocs-material/) mais [mkdocs 2.0](https://squidfunk.github.io/mkdocs-material/blog/2026/02/18/mkdocs-2.0/) amène la création de [zensical](https://squidfunk.github.io/mkdocs-material/blog/2025/11/05/zensical/) par les créateurs de mkdocs-material
    (son utilisation est à l'étude, c.f. [issue #23](https://github.com/mborne/mborne.github.io/issues/23)).

## Exemples

- [mborne.github.io](https://mborne.github.io/) ([sources](https://github.com/mborne/mborne.github.io)) : ce site, généré avec Material for MkDocs et publié par GitHub Actions.
- [docker-devbox](https://mborne.github.io/docker-devbox/) ([sources](https://github.com/mborne/docker-devbox)) : rendu par Jekyll avec un simple fichier `_config.yml` (thème `jekyll-theme-slate`), sans CI à écrire.
- [cours-patron-conception](https://mborne.github.io/cours-patron-conception/) ([sources](https://github.com/mborne/cours-patron-conception)) : généré avec [mborne/markdown-to-html](https://github.com/mborne/markdown-to-html), un générateur expérimental.
