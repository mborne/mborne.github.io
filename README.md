# mborne.github.io

Ce dépôt est la source de [https://mborne.github.io](https://mborne.github.io).

## Travail en local

Avec [uv](https://docs.astral.sh/uv/) :

```bash
# démarrage du serveur sur http://localhost:8000 :
uv run mkdocs serve

# mise à jour des dépendances
uv sync --upgrade
```

## Formatage des fichiers Markdown

Voir [.markdownlint.yml](.markdownlint.yml) :

```bash
npx markdownlint-cli2 "docs/**/*.md" --fix
```

## Licence

[MIT](LICENSE)

