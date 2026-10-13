---
tags:
    - Documentation
    - Docs as code
---

# Débuter avec l'usine logicielle

> 🤖 Rédaction assistée par IA.

## Principe

Première étape de [docs as code](../index.md) : **se contenter du rendu à la volée de l'usine logicielle** (GitHub, GitLab,...). Il n'y a **rien à installer** : les fichiers Markdown sont affichés directement dans l'interface web.

## Mise en oeuvre

- Créer un dépôt avec un fichier `README.md` : il est affiché sur la page d'accueil du dépôt.
- Ajouter des fichiers `.md` (ex : `docs/installation.md`) et les relier par des **liens relatifs** (ex : `[Installation](docs/installation.md)`).
- Stocker les images dans le dépôt (ex : `docs/img/schema.drawio.png`) et les référencer avec un chemin relatif.
- Utiliser [Mermaid](../../schemas/index.md#generer-des-schemas) pour les schémas : ils sont rendus directement par GitHub et GitLab.

## Éditer dans le navigateur

- Le bouton d'édition (✏️) de l'interface web permet de **modifier un fichier et de prévisualiser le rendu**.
- Sans droit d'écriture sur le dépôt, la modification est proposée sous forme de *pull request* / *merge request* (GitHub crée automatiquement un *fork*).
- Pour modifier plusieurs fichiers à la fois, un éditeur web complet est disponible (ex : touche `.` sur un dépôt GitHub pour ouvrir [github.dev](https://docs.github.com/fr/codespaces/the-githubdev-web-based-editor), "Web IDE" sur GitLab).

## Limites

- Pas de **menu de navigation** ni de **recherche** propre à la documentation.
- Rendu limité aux fonctionnalités Markdown supportées par l'usine logicielle.

Pour aller plus loin : [Publier un site statique](../site-statique/index.md).
