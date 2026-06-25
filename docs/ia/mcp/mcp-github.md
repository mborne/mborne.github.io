---
tags:
    - MCP
    - GitHub
    - Workflow
---

# MCP GitHub - De l'issue a la revue de code

Cette fiche presente un workflow de bout en bout avec MCP GitHub:

1. creer une issue,
2. traiter l'issue sur une branche,
3. creer une pull request,
4. faire la revue de code.

## Prerequis

- Avoir un serveur MCP GitHub configure et accessible par votre client (VS Code, agent CLI, etc.).
- Avoir les permissions sur le depot cible (lecture/ecriture, creation de branche et de PR).

## 1) Generation d'issue

Objectif: decrire clairement le besoin, le contexte et les criteres d'acceptation.

Exemple avec l'outil `mcp_github-mcp_issue_write`:

```json
{
  "method": "create",
  "owner": "mborne",
  "repo": "mborne.github.io",
  "title": "Ajouter une fiche MCP GitHub",
  "body": "## Objectif\nDocumenter issue -> branche -> PR -> revue.\n\n## Criteres d'acceptation\n- [ ] La page existe\n- [ ] Un exemple est donne pour chaque etape"
}
```

Bonnes pratiques:

- Rediger un titre actionnable (verbe a l'infinitif).
- Ajouter des criteres d'acceptation verificables.
- Ajouter labels/assignees si le projet les utilise.

## 2) Traitement d'une issue sur une branche

Objectif: isoler le travail et faciliter la revue.

Convention de nommage recommandee:

- `feat/<numero-issue>-<description-courte>`

Exemple:

```bash
git checkout -b feat/29-mcp-github-workflow
```

Puis:

- implementer les changements,
- verifier localement,
- commit avec un message clair.

Exemple de commit:

```bash
git add docs/ia/mcp/mcp-github.md docs/ia/mcp/index.md
git commit -m "docs(mcp): ajouter fiche workflow GitHub issue->PR"
```

## 3) Creation d'une Pull Request

Objectif: proposer les changements de la branche vers la branche principale.

Exemple avec `mcp_github-mcp_create_pull_request`:

```json
{
  "owner": "mborne",
  "repo": "mborne.github.io",
  "base": "main",
  "head": "feat/29-mcp-github-workflow",
  "title": "docs(mcp): ajouter une fiche MCP GitHub",
  "body": "Closes #29\n\nAjout d'une fiche de workflow: issue -> branche -> PR -> revue de code."
}
```

Bonnes pratiques:

- Referencer l'issue dans la description (`Closes #<id>`).
- Ajouter une checklist de verification (liens, rendu, coherence).
- Demander explicitement des reviewers.

## 4) Revue de code

Objectif: valider la qualite fonctionnelle et editoriale avant merge.

Actions possibles via MCP GitHub:

- commenter une PR,
- demander des changements (`REQUEST_CHANGES`),
- approuver (`APPROVE`).

Exemple avec `mcp_github-mcp_pull_request_review_write`:

```json
{
  "method": "create",
  "owner": "mborne",
  "repo": "mborne.github.io",
  "pullNumber": 123,
  "event": "COMMENT",
  "body": "Merci. Le contenu est clair. Pouvez-vous ajouter un exemple de labels dans la creation d'issue ?"
}
```

## Checklist rapide

- [ ] L'issue decrit bien le besoin et les criteres d'acceptation.
- [ ] La branche est dediee a une seule issue.
- [ ] La PR reference l'issue et explique les changements.
- [ ] La revue de code est tracee (commentaires, approbation, ou changements demandes).

## Prompts d'exemple (cette discussion)

Voici les prompts utilises pour produire cette fiche, de l'issue a la PR.

References GitHub correspondantes:

- Issue #29: https://github.com/mborne/mborne.github.io/issues/29
- Branche de travail: https://github.com/mborne/mborne.github.io/tree/feat/29-mcp-github-workflow
- Pull Request #30: https://github.com/mborne/mborne.github.io/pull/30
- Comparaison branche -> main: https://github.com/mborne/mborne.github.io/compare/main...feat/29-mcp-github-workflow

### Prompt 1 - Creer l'issue

```text
creer une issue pour ajouter fiche docs/ia/mcp/mcp-github.md presentant son utilisation pour la generation d'issue, le traitement d'issue sur une branche, la creation d'une PR et la revue de code
```

Resultat: issue creee https://github.com/mborne/mborne.github.io/issues/29

### Prompt 2 - Traiter l'issue sur une branche et ouvrir la PR

```text
traite l'issue sur une branche et fait une PR
```

Resultat:

- branche creee https://github.com/mborne/mborne.github.io/tree/feat/29-mcp-github-workflow
- PR ouverte https://github.com/mborne/mborne.github.io/pull/30

### Prompt 3 - Ajouter des prompts en exemple dans la fiche

```text
En exemple, donne les prompts correspondant a cette discussion (comment cette fiche est creee)
```

Resultat: mise a jour de la PR existante https://github.com/mborne/mborne.github.io/pull/30

## Variante: prompt unique de bout en bout

Si vous voulez tout faire en une seule demande, vous pouvez utiliser:

```text
Traite l'issue #29: cree une branche feature, ajoute la fiche docs/ia/mcp/mcp-github.md (issue -> branche -> PR -> revue), mets a jour docs/ia/mcp/index.md avec un lien vers la fiche, commit, push et ouvre une PR avec "Closes #29".
```
