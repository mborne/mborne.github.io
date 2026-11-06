---
tags:
    - Outil
    - Sécurité
    - Supply chain
    - Conteneurs
search:
    boost: 2
---

# Syft

> 🤖 Rédaction assistée par IA.

[Syft](https://github.com/anchore/syft#readme) est un outil open source (Anchore) permettant de générer un **SBOM** (*Software Bill of Materials*), c'est-à-dire l'inventaire des composants (paquets système, bibliothèques Python, npm, Java, Go,...) présents dans une image de conteneur, un dossier ou une archive.

Le SBOM peut ensuite être :

* Analysé par un scanner de vulnérabilités tel [Grype](../grype/index.md) (sans avoir à rescanner l'image).
* Signé et attaché à l'image sous forme d'attestation avec [Cosign](../cosign/index.md).
* Archivé avec le livrable pour pouvoir répondre rapidement à la question "suis-je concerné par la CVE X?".

## Installation

* [anchore/syft - releases](https://github.com/anchore/syft/releases)
* [syft/install.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/syft/install.sh) procède au téléchargement et à l'installation du .deb :

```bash
curl -sS https://mborne.github.io/outils/syft/install.sh | bash
```

## Utilisation

Pour afficher l'aide :

```bash
syft --help
```

Pour lister les composants d'une image :

```bash
syft python:3.12-slim
```

Pour analyser un dossier (ex : le dépôt d'une application) :

```bash
syft dir:.
```

Pour générer un SBOM aux formats standards [CycloneDX](https://cyclonedx.org/) ou [SPDX](https://spdx.dev/) :

```bash
# CycloneDX (JSON)
syft python:3.12-slim -o cyclonedx-json=sbom.cdx.json
# SPDX (JSON)
syft python:3.12-slim -o spdx-json=sbom.spdx.json
```

## Ressources

* [github.com - anchore/syft](https://github.com/anchore/syft#readme)
* [oss.anchore.com - Syft](https://oss.anchore.com/docs/guides/sbom/)
* [blog.stephane-robert.info - Syft](https://blog.stephane-robert.info/docs/securiser/supply-chain/syft/)
