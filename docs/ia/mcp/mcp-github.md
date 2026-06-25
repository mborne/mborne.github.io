---
tags:
    - MCP
    - GitHub
    - Workflow
---

# MCP GitHub - De l'issue à la revue de code

Cette fiche présente un workflow de bout en bout avec [GitHub MCP Server](https://github.com/github/github-mcp-server#readme):

1. créer une issue,
2. traiter l'issue sur une branche,
3. creer une pull request,
4. faire la revue de code.

## Prérequis

- Avoir les permissions sur le dépôt cible (lecture/écriture, création de branche et de PR).
- [Configurer le serveur MCP GitHub](https://github.com/github/github-mcp-server#install-in-vs-code) dans votre client (VS Code, agent CLI, etc.)

!!! warning 
    L'approche **Using a GitHub PAT** avec un token disposant de droit restreint est recommandée (surtout pour les utilisateurs disposant de beaucoup de droit)

## Prompts d'exemple

Voici les prompts utilisés pour produire cette fiche, de l'issue à la PR.

### Prompt 1 - Créer l'issue

```text
créer une issue pour ajouter fiche docs/ia/mcp/mcp-github.md présentant son utilisation pour la génération d'issue, le traitement d'issue sur une branche, la création d'une PR et la revue de code
```

Résultat: issue créée https://github.com/mborne/mborne.github.io/issues/29

### Prompt 2 - Traiter l'issue sur une branche et ouvrir la PR

```text
traite l'issue sur une branche et fait une PR
```

Résultat:

- branche créée https://github.com/mborne/mborne.github.io/tree/feat/29-mcp-github-workflow
- PR ouverte https://github.com/mborne/mborne.github.io/pull/30

### Prompt 3 - Ajouter des prompts en exemple dans la fiche

```text
En exemple, donne les prompts correspondant à cette discussion (comment cette fiche est créée)
```

Résultat: mise à jour de la PR existante https://github.com/mborne/mborne.github.io/pull/30

## Variante: prompt unique de bout en bout

Si vous voulez tout faire en une seule demande, vous pouvez utiliser:

```text
Traite l'issue #29: crée une branche feature, ajoute la fiche docs/ia/mcp/mcp-github.md (issue -> branche -> PR -> revue), mets à jour docs/ia/mcp/index.md avec un lien vers la fiche, commit, push et ouvre une PR avec "Closes #29".
```
