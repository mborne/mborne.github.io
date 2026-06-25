---
tags:
    - MCP
    - GitHub
    - Workflow
---

# MCP GitHub - De l'issue à la revue de code

Cette fiche présente un workflow de bout en bout avec MCP GitHub:

1. créer une issue,
2. traiter l'issue sur une branche,
3. creer une pull request,
4. faire la revue de code.

## Prérequis

- Avoir un serveur MCP GitHub configuré et accessible par votre client (VS Code, agent CLI, etc.).
- Avoir les permissions sur le dépôt cible (lecture/écriture, création de branche et de PR).

## Principe

### 1) Génération d'issue

Objectif: décrire clairement le besoin, le contexte et les critères d'acceptation.

Exemple avec l'outil `mcp_github-mcp_issue_write`:

```json
{
  "method": "create",
  "owner": "mborne",
  "repo": "mborne.github.io",
  "title": "Ajouter une fiche MCP GitHub",
  "body": "## Objectif\nDocumenter issue -> branche -> PR -> revue.\n\n## Critères d'acceptation\n- [ ] La page existe\n- [ ] Un exemple est donné pour chaque étape"
}
```

Bonnes pratiques:

- Rédiger un titre actionnable (verbe à l'infinitif).
- Ajouter des critères d'acceptation vérifiables.
- Ajouter labels/assignees si le projet les utilise.

### 2) Traitement d'une issue sur une branche

Objectif: isoler le travail et faciliter la revue.

Convention de nommage recommandée:

- `feat/<numero-issue>-<description-courte>`

Exemple:

```bash
git checkout -b feat/29-mcp-github-workflow
```

Puis:

- implémenter les changements,
- vérifier localement,
- commit avec un message clair.

Exemple de commit:

```bash
git add docs/ia/mcp/mcp-github.md docs/ia/mcp/index.md
git commit -m "docs(mcp): ajouter fiche workflow GitHub issue->PR"
```

### 3) Création d'une Pull Request

Objectif: proposer les changements de la branche vers la branche principale.

Bonnes pratiques:

- Référencer l'issue dans la description (`Closes #<id>`).
- Ajouter une checklist de vérification (liens, rendu, cohérence).
- Demander explicitement des reviewers.

### 4) Revue de code

Objectif: valider la qualité fonctionnelle et éditoriale avant merge.

Actions possibles via MCP GitHub:

- commenter une PR,
- demander des changements (`REQUEST_CHANGES`),
- approuver (`APPROVE`).


## Checklist rapide

- [ ] L'issue décrit bien le besoin et les critères d'acceptation.
- [ ] La branche est dédiée à une seule issue.
- [ ] La PR référence l'issue et explique les changements.
- [ ] La revue de code est tracée (commentaires, approbation, ou changements demandés).

## Prompts d'exemple

Voici les prompts utilisés pour produire cette fiche, de l'issue à la PR.

Références GitHub correspondantes:

- Issue #29: https://github.com/mborne/mborne.github.io/issues/29
- Branche de travail: https://github.com/mborne/mborne.github.io/tree/feat/29-mcp-github-workflow
- Pull Request #30: https://github.com/mborne/mborne.github.io/pull/30
- Comparaison branche -> main: https://github.com/mborne/mborne.github.io/compare/main...feat/29-mcp-github-workflow

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
