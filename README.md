# mborne.github.io

Ce dépôt est la source de [https://mborne.github.io](https://mborne.github.io).

## Travail en local

Avec [uv](https://docs.astral.sh/uv/) :

```bash
# démarrage du serveur sur http://localhost:8000 :
uv run zensical serve

# mise à jour des dépendances
uv sync --upgrade
```

## Formatage des fichiers Markdown

Voir [.markdownlint.yml](.markdownlint.yml) :

```bash
npx markdownlint-cli2 "docs/**/*.md" --fix
```

## Contrôle des liens

```bash
npx -y markdown-link-check -c markdown-link-check.config.json ./docs
```

## Ressources

* [zensical.org - Get started](https://zensical.org/docs/get-started/)
* [zensical.org - Basics](https://zensical.org/docs/setup/basics/)

## Licence

[MIT](LICENSE)

