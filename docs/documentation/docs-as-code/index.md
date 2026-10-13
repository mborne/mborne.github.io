---
tags:
    - Documentation
    - Docs as code
search:
    boost: 2
---

# Docs as code

> 🤖 Rédaction assistée par IA.

**Docs as code** consiste à **traiter la documentation comme du code** : elle est rédigée en texte brut, versionnée, relue, contrôlée et publiée automatiquement sous forme de page web.

Contrairement à un document bureautique ou à une page de wiki, **la documentation vit dans un dépôt Git** et bénéficie des mêmes outils que le code.

## Les principes et leur intérêt

D'après [Write the Docs - Docs as Code](https://www.writethedocs.org/guide/docs-as-code/) :

| Principe | Intérêt |
| -------- | ------- |
| **Format texte** ([Markdown](../markdown/index.md)) | Différences entre versions lisibles, format pérenne, édition avec n'importe quel éditeur |
| **Gestionnaire de version** (Git) | Historique, auteur de chaque modification, retour arrière, branches, capacité à rechercher et remplacer dans un dossier (contrôle et correction en masse),... |
| **Revue** (*merge request* / *pull request*) | Relecture avant publication, l'**approbation tient lieu de validation tracée** (qui, quand, quelle version), suivi des demandes avec des issues |
| **Contrôles automatiques** | Liens cassés, ancres, orthographe, build `--strict` |
| **Publication automatisée** | CI vers GitLab Pages ou GitHub Pages, sans étape manuelle |
| **Documentation au plus près du code** | `README.md` et `docs/` versionnés avec l'application, la documentation suit ses versions |

## Débuter sans écrire de code

La mise en oeuvre peut être progressive :

1. [Débuter avec l'usine logicielle](usine-logicielle/index.md) : `README.md` et fichiers `.md` affichés directement par GitHub ou GitLab, édition dans le navigateur, rien à installer.
2. [Publier un site statique](site-statique/index.md) : `mkdocs.yml` et dossier `docs/`, publication sur GitHub Pages ou GitLab Pages par la CI (exemple : ce site).
3. [Contrôler la documentation en CI](controles/index.md) : vérification de la syntaxe, des liens et build strict à chaque *merge request*.

## Aller plus loin

- **Schémas** éditables (`.drawio.png`) ou générés (voir [Schémas](../schemas/index.md)).
- **Données dans des formats ouverts** : CSV pour les données tabulaires, JSON ou YAML pour les données complexes (ex : [catalogue Backstage](https://backstage.io/docs/features/software-catalog/descriptor-format) pour la cartographie du SI, données de dimensionnement exploitées par Terraform).
- **Diaporamas** en Markdown (voir [Diaporamas](../presentations/index.md)).
- **Intégration du rendu dans une application existante** à l'aide d'une bibliothèque de conversion Markdown vers HTML.

## Les limites et comment les atténuer

- **Pas d'édition simultanée en temps réel** : chacun modifie de son côté puis on fusionne, ce qui ne convient pas aux brouillons à plusieurs mains ni au brainstorming. Il est possible de commencer sur un outil collaboratif (pad, document partagé) puis de verser le résultat stabilisé dans le dépôt.
- **Prise en main difficile pour les non-développeurs** : l'éditeur web de l'usine logicielle et la prévisualisation aident (voir [Débuter avec l'usine logicielle](usine-logicielle/index.md)).
- **Mise en page fine et export PDF limités** : des plugins PDF et des feuilles de style pour l'impression permettent de compenser en partie.

## Quand l'utiliser ?

- **Adapté** : documentation technique, procédures d'exploitation, décisions d'architecture (ADR), cours et supports de formation, documents à faire valider (l'approbation de la *pull request* fait office de visa).
- **Moins adapté** : documents en édition collaborative (brouillons, brainstorming, prises de notes en réunion) et documents à forte mise en page.

## Ressources

- [www.writethedocs.org - Docs as Code](https://www.writethedocs.org/guide/docs-as-code/)
