# Historique

## Virtualisation du poste de travail et sandboxing d'agent IA

> Novembre 2026

* [Virtualisation](../devops/virtualisation/index.md) : focus poste de travail, distinction hyperviseurs / gestionnaires de VM ([issue #74](https://github.com/mborne/mborne.github.io/issues/74))
* Ajout de la fiche [Multipass](../outils/multipass/index.md) avec ses limites (pas de GPU, KVM imbriqué)
* [WSL](../outils/wsl/index.md) : principales commandes, limites d'isolation et cas d'utilisation (Docker, K3S)
* Sandboxing d'agent IA : création d'une VM / instance de DEV pour VSCode avec [Multipass](../outils/multipass/vm-dev-vscode.md) et [WSL](../outils/wsl/devbox-vscode.md)

## Outils

> Novembre 2026

* Ajout des fiches [syft](../outils/syft/index.md), [grype](../outils/grype/index.md) et [cosign](../outils/cosign/index.md) en complément de [trivy](../outils/trivy/index.md)
* Ajout de la fiche [GitHub CLI](../outils/gh/index.md)
* Normalisation des fiches outils en `index.md` et des fins de ligne en LF

## Programmation

> Novembre 2026

* [Programmation](../programmation/index.md) : nouvelle rubrique (concepts de base, POO, programmation générique, gestion des erreurs, bonnes pratiques,...) en cours de relecture ([issue #64](https://github.com/mborne/mborne.github.io/issues/64))

## Architecture et patrons de conception

> Octobre - Novembre 2026

* Migration des annexes de [cours-patron-conception](https://github.com/mborne/cours-patron-conception) (patrons de conception, [refactoring](../architecture/refactoring/index.md), [gestion des dépendances](../architecture/dependances/index.md)) avec relecture des fiches ([PR #54](https://github.com/mborne/mborne.github.io/pull/54), [PR #55](https://github.com/mborne/mborne.github.io/pull/55))
* Ajout des fiches [Template Method](../architecture/patrons-conception/comportement/TemplateMethod.md), [Injection de dépendances](../architecture/patrons-conception/architecturaux/InjectionDependances.md), [Architecture pilotée par les événements](../architecture/patrons-conception/architecturaux/EDA.md) et [Architecture microservices](../architecture/patrons-conception/architecturaux/Microservices.md)

## IA

> Octobre 2026

* Retours d'expérimentations LLM ([PR #53](https://github.com/mborne/mborne.github.io/pull/53))

## Navigation et restructuration des thématiques

> Septembre - Octobre 2026

* Référencement des pages dans la navigation (hors fiches outils) et affichage d'un fil d'Ariane
* DevOps : fiches à plat (origines, principes, IaC, livrables, virtualisation, conteneurs, réseaux, cloud) avec des titres autonomes
* Réseaux : découpage en protocoles, virtualisation des réseaux et flux entrants / sortants
* Cloud : synthèse des points clés du cours et ajout d'une fiche sur les conteneurs
* DevSecOps : rubrique dédiée (sensibilisation, *abuser story*, automatisation)
* Architecture : découpage en thèmes (API, patrons de conception)
* IA : rubriques Optimisation et LLM (principe de fonctionnement, concepts avancés, techniques de rendu, modèles locaux, développement, MCP)
* Redirection des anciennes URL
* Liens vers les mentions légales et la page [Cookies et statistiques](../cookies/index.md) en pied de page avec documentation des cookies Matomo
* Documentation : découpage en catégories (Markdown, Docs as code, Schémas, Générateurs de site, Diaporamas, Enregistrement du terminal) et ajout d'une fiche [Docs as code](../documentation/docs-as-code/index.md) ([issue #49](https://github.com/mborne/mborne.github.io/issues/49))

## Réorganisation

> Mars 2026

* Réorganisation pour avoir un point d'entrée par thématique ([issue #19](https://github.com/mborne/mborne.github.io/issues/19))
* Ajout d'une section documentation ([issue #13](https://github.com/mborne/mborne.github.io/issues/13))

## Amélioration de la présentation

> Novembre 2025

* Mise en évidence des liens vers des ressources externes ([icône ↗️](https://github.com/mborne/mborne.github.io/blob/main/docs/assets/css/style.css))
* Uniformisation des scripts d'installation (stanalone + lien vers la source dans le README)
* Reprise de la page d'accueil et appeler à manifestation d'intérêt pour savoir s'il est utile de poursuivre l'effort
* Mise à jour de la fiche KVM (Motivation : montée en puissance de proxmox à prévoir suite aux changements de tarif de VMWare)
* Suppression de la fiche sur [Dagster](https://dagster.io/)

## Intégration des fiches sur les outils et annexes DevOps

> Avril 2025

* Bascule sur un rendu MkDocs avec [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/).
* Ajout de mentions légales.
* Déplacement de l'inventaire des dépôts.
* Adaptation GitHub actions
* Intégration du dépôt "mborne/toolbox" dans "Outils"

> Novembre 2025

* Intégration des annexes du [cours-devops](https://mborne.github.io/cours-devops)

## Version initiale

> Juin 2024

La version initiale de [mborne.github.io](https://mborne.github.io) correspondait à un travail d'inventaire des dépôts et des tests d'indexation avec [Google Search Console](https://search.google.com/search-console/about).
