---
tags:
    - MCP
    - GitHub
    - Workflow
---

# MCP GitHub - De l'issue à la revue de code

> 🤖 Rédaction assistée par IA.

Cette fiche présente un workflow de bout en bout avec [GitHub MCP Server](https://github.com/github/github-mcp-server#readme). La même approche sera possible avec [GitLab MCP Server](https://docs.gitlab.com/user/gitlab_duo/model_context_protocol/mcp_server/) (`/api/v4/mcp`)

## Prérequis

- Avoir les permissions sur le dépôt cible (lecture/écriture, création de branche et de PR).
- [Configurer le serveur MCP GitHub](https://github.com/github/github-mcp-server#install-in-vs-code) dans votre client (VS Code, agent CLI, etc.)

!!! warning 
    L'approche **Using a GitHub PAT** avec un token disposant de droit restreint est recommandée (surtout pour les utilisateurs disposant de beaucoup de droit)

## Workflow proposé

1. créer une issue,
2. traiter l'issue sur une branche,
3. creer une pull request,
4. faire la revue de code.


## Prompts d'exemple

Voici les prompts utilisés pour produire cette fiche, de l'issue à la PR.

### Prompt 1 - Créer l'issue

```text
créer une issue pour ajouter fiche docs/ia/mcp/mcp-github.md 
présentant l'utilisation du MCP GitHub pour la génération d'issue, 
le traitement d'issue sur une branche, 
la création d'une PR et la revue de code
```

Résultat: issue créée <https://github.com/mborne/mborne.github.io/issues/29>

### Prompt 2 - Traiter l'issue sur une branche et ouvrir la PR

```text
traite l'issue sur une branche et fait une PR
```

Résultat:

- branche créée <https://github.com/mborne/mborne.github.io/tree/feat/29-mcp-github-workflow>
- PR ouverte <https://github.com/mborne/mborne.github.io/pull/30>

### Prompt 3 - Ajouter des prompts en exemple dans la fiche

```text
En exemple, donne les prompts correspondant à cette discussion
(l'idée étant d'expliquer comment cette fiche est créée)
```

Résultat: mise à jour de la PR existante <https://github.com/mborne/mborne.github.io/pull/30>
