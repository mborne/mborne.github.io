---
tags:
    - LLM
    - OKF
    - Docs as code
---

# OKF (Open Knowledge Format)

> 🤖 Rédaction assistée par IA.

## Points clés

- L'[Open Knowledge Format (OKF)](https://github.com/GoogleCloudPlatform/knowledge-catalog/blob/main/okf/SPEC.md) est un **format ouvert de représentation de la connaissance** (métadonnées, contexte, savoir-faire autour des données et des systèmes) proposé par Google Cloud (version 0.2).
- Il est conçu pour être **rédigé par des humains, généré par des agents et consommé par les deux**.
- Le format est volontairement minimal : **un dossier de fichiers Markdown avec un en-tête YAML** (*front matter*). Il n'y a ni registre de schémas, ni outillage obligatoire.
- La distribution sous forme de **dépôt Git** est recommandée (historique, auteurs, différences) : c'est une application directe de [docs as code](../../../documentation/docs-as-code/index.md).

## Les concepts

- Un **bundle** est un dossier regroupant des documents de connaissance (unité de distribution).
- Un **concept** est une unité de connaissance représentée par **un fichier Markdown** (ex : une table, une API, un indicateur, une procédure). Son identifiant est son chemin dans le bundle sans l'extension `.md`.
- Le seul champ obligatoire de l'en-tête est **`type`** (ex : `API Endpoint`, `Metric`, `Playbook`). Les types ne sont pas enregistrés de manière centralisée.
- Les champs `title`, `description`, `resource` (URI de la ressource décrite) et `tags` sont recommandés.
- Les concepts sont reliés par des **liens Markdown** classiques (de préférence absolus depuis la racine du bundle, ex : `/tables/customers.md`). Un lien cassé est toléré (connaissance pas encore rédigée).

Exemple de concept :

```markdown
---
type: Playbook
title: "Incident response: data freshness alert"
description: Steps to triage a freshness alert on the orders pipeline.
tags: [oncall, incident]
generated: { by: human:ahormati, at: 2026-04-12T09:00:00Z }
---

# Trigger

A freshness alert fires when `orders` lags more than 30 minutes behind its
expected SLA. See the [orders table](/tables/orders.md).
```

## Les fichiers réservés

| Fichier | Rôle |
| ------- | ---- |
| `index.md` | Liste du contenu d'un dossier pour une **découverte progressive** (*progressive disclosure*) par un humain ou un agent. Pas d'en-tête YAML (sauf `okf_version` à la racine). |
| `log.md` | Historique des modifications du dossier, groupé par date (`YYYY-MM-DD`). |

## Provenance, confiance et cycle de vie

Un corpus étant de plus en plus **rédigé et maintenu par des agents**, OKF standardise quelques champs optionnels pour répondre aux questions "d'où vient cette information ?", "puis-je lui faire confiance ?" et "est-elle encore à jour ?" :

- **Provenance** : `sources` liste les sources dont dérive le concept, avec des indicateurs objectifs de crédibilité (`author`, `usage_count`, `last_modified`).
- **Confiance** : `generated` indique qui a produit le contenu et quand, `verified` qui l'a confirmé. On en déduit un niveau de confiance : *unverified*, *machine-confirmed* ou *human-reviewed* (vérification par un acteur `human:<id>`).
- **Cycle de vie** : `status` (`draft`, `stable`, `deprecated`) et `stale_after` (date à partir de laquelle le contenu est considéré comme périmé).
- **Calcul attesté** (`type: Attested Computation`) : un concept peut porter la manière **officielle de calculer une valeur** (ex : requête SQL) pour qu'un consommateur vérifie que l'agent l'a bien utilisée plutôt que d'improviser.

Les acteurs sont notés `<producteur>/<version>` pour un agent (ex : `reference_agent/gemini-2.5-pro`), `human:<id>` pour une personne et `process:<id>` pour un traitement automatisé.

## Conformité

Un bundle est conforme si chaque fichier Markdown (hors `index.md` et `log.md`) contient un en-tête YAML valide avec un champ `type` non vide. Les consommateurs doivent tolérer les champs inconnus, les types inconnus, les liens cassés et l'absence de fichiers `index.md`.

!!!info "Cas d'un site MkDocs"

    Les en-têtes YAML utilisés par MkDocs (ex : `tags`) sont compatibles avec OKF moyennant l'ajout d'un champ `type`. En revanche, les pages `index.md` jouent un rôle de contenu dans MkDocs (page d'accueil de rubrique) alors qu'elles sont réservées aux listes de contenu dans OKF.

    Voir [issue #38 - Expérimenter une approche Open Knowledge Format (OKF)](https://github.com/mborne/mborne.github.io/issues/38) pour l'application à ce site.

## Ressources

- [github.com - GoogleCloudPlatform/knowledge-catalog - okf/SPEC.md](https://github.com/GoogleCloudPlatform/knowledge-catalog/blob/main/okf/SPEC.md) : spécification
- [github.com - GoogleCloudPlatform/knowledge-catalog - okf](https://github.com/GoogleCloudPlatform/knowledge-catalog/tree/main/okf) : outils et exemples
