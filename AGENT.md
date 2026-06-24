# AGENT.md

Ce depot contient la source du site https://mborne.github.io, genere avec MkDocs Material.

## Objectif pour un agent

- Privilegier des modifications ciblees dans `docs/`, `mkdocs.yml`, `overrides/` et les fichiers de configuration associes.
- Eviter de modifier `site/` (contenu genere).
- Garder des changements petits, lisibles et coherents avec le style Markdown existant.

## Arborescence utile

- `docs/` : sources Markdown du site.
- `mkdocs.yml` : navigation, theme, plugins, extensions Markdown.
- `overrides/` : surcharges MkDocs Material.
- `.github/workflows/ci.yml` : pipeline CI/deploiement GitHub Pages.
- `pyproject.toml` et `uv.lock` : dependances Python (via `uv`).

## Commandes essentielles

- Lancer le serveur local : `uv run mkdocs serve`
- Mettre a jour les dependances : `uv sync --upgrade`
- Synchroniser les dependances lockees : `uv sync --locked`
- Linter/fixer le Markdown : `npx markdownlint-cli2 "docs/**/*.md" --fix`
- Verifier les liens : `npx -y markdown-link-check -c markdown-link-check.config.json ./docs`

## Verification avant livraison

1. Si vous avez modifie des pages Markdown, executer au minimum le lint Markdown et la verification des liens.
2. Si vous avez modifie la structure/navigation/plugins, verifier le build local MkDocs.
3. Confirmer qu'aucun fichier genere de `site/` n'a ete modifie.

## Conventions et points d'attention

- Le contenu est majoritairement en francais. Conserver la langue de la page modifiee.
- Respecter `.markdownlint.yml` (notamment indentation 4 espaces).
- Certains liens externes sont exclus du controle dans `markdown-link-check.config.json`.
- Plusieurs dossiers d'exemples sont exclus du build via le plugin `exclude` dans `mkdocs.yml`.
- `mkdocs.yml` utilise des tags YAML specifiques (voir `.vscode/settings.json`) ; eviter les reformattages agressifs de ce fichier.

## Regle creation fiche outil/service

- Le chemin de la fiche doit etre `docs/outils/{nom}/index.md`.
- Les metadonnees YAML doivent etre renseignées (tags)
- Les tags existants peuvent etre recuperes depuis `docs/index.md`.
- La mention "> 🤖 Rédaction assistée par IA." doit être présente dans les fiches générées par IA.

## References

- Guide projet : [README.md](README.md)
- Configuration site : [mkdocs.yml](mkdocs.yml)
- Workflow CI : [.github/workflows/ci.yml](.github/workflows/ci.yml)
- Regles Markdown : [.markdownlint.yml](.markdownlint.yml)
- Controle des liens : [markdown-link-check.config.json](markdown-link-check.config.json)