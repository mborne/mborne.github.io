# mborne.github.io

Ce dépôt est la source de [https://mborne.github.io](https://mborne.github.io).

## Travail en local

```bash
# Pour environnement conda avec vscode : 
# - CTRL+SHIFT+P
# - "Python: create environnement"
# puis :
pip install mkdocs-material

# http://127.0.0.1:8000
mkdocs serve
```

## Formatage des fichiers Markdown

Voir [.markdownlint.yml](.markdownlint.yml) :

```bash
npx markdownlint-cli2 "docs/**/*.md" --fix
```

## Licence

[MIT](LICENSE)

