---
tags:
    - Outil
    - Sécurité
    - Scanner de vulnérabilités
    - Supply chain
    - Conteneurs
search:
    boost: 2
---

# Grype

> 🤖 Rédaction assistée par IA.

[Grype](https://github.com/anchore/grype#readme) est un scanner de vulnérabilités open source (Anchore) capable d'analyser une image de conteneur, un dossier ou un **SBOM** généré par [Syft](../syft/index.md) pour y détecter des dépendances vulnérables (alternative à [Trivy](../trivy/index.md)).

## Installation

* [anchore/grype - releases](https://github.com/anchore/grype/releases)
* [grype/install.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/grype/install.sh) procède au téléchargement et à l'installation du .deb :

```bash
curl -sS https://mborne.github.io/outils/grype/install.sh | bash
```

## Utilisation

Pour afficher l'aide :

```bash
grype --help
```

Pour scanner une image en se limitant aux vulnérabilités pour lesquelles un correctif est disponible :

```bash
grype php:7.4 --only-fixed
```

Pour faire échouer une CI/CD en présence de vulnérabilités de sévérité élevée ou critique :

```bash
grype php:7.4 --fail-on high
```

Pour analyser un SBOM produit par [Syft](../syft/index.md) (sans retélécharger l'image) :

```bash
syft python:3.12-slim -o cyclonedx-json=sbom.cdx.json
grype sbom:sbom.cdx.json
```

Pour produire un rapport exploitable par d'autres outils :

```bash
# JSON
grype php:7.4 -o json > grype-report.json
# SARIF (ex : GitHub code scanning)
grype php:7.4 -o sarif > grype-report.sarif
```

Pour mettre à jour la base de vulnérabilités (téléchargée automatiquement au premier lancement) :

```bash
grype db update
grype db status
```

## Ressources

* [github.com - anchore/grype](https://github.com/anchore/grype#readme)
* [oss.anchore.com - Grype](https://oss.anchore.com/docs/guides/vulnerability/)
* [blog.stephane-robert.info - Grype](https://blog.stephane-robert.info/docs/securiser/outils/grype/)
