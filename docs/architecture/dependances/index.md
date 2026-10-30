# La gestion des dépendances

> 🤖 Rédaction assistée par IA.

## Principe

Un outil de gestion de dépendances s'appuie généralement sur :

* Un **descripteur de projet** qui **liste les dépendances et leurs versions**
* Un **utilitaire en ligne de commande pour télécharger les dépendances** et **construire le projet**
* Au moins un **dépôt public** permettant le téléchargement des dépendances (tout en ayant la **possibilité d'avoir des dépôts privés**)

## Quelques exemples

| Langage | Outil | Descripteur | Dépôt public | Fiche |
| --- | --- | --- | --- | --- |
| Java | [Maven](https://maven.apache.org/) ([Maven in five minutes](https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html)), [Gradle](https://gradle.org/) | `pom.xml` | [Maven Central](https://central.sonatype.com/) | [Java](../../outils/java/README.md) |
| JavaScript | [npm](https://www.npmjs.com/), [yarn](https://yarnpkg.com/) | `package.json` | [npmjs.com](https://www.npmjs.com/) | [JavaScript](../../outils/js/README.md) |
| PHP | [Composer](https://getcomposer.org/) | `composer.json` | [packagist.org](https://packagist.org/) | [PHP](../../outils/php/README.md) |
| Python | [pip](https://pip.pypa.io/), [uv](https://docs.astral.sh/uv/) | `pyproject.toml` | [pypi.org](https://pypi.org/) | [Python](../../outils/python/README.md) |
| Rust | [cargo](https://doc.rust-lang.org/cargo/) | `Cargo.toml` | [crates.io](https://crates.io/) | [Rust](../../outils/rust/README.md) |

## Voir aussi

* [La gestion sémantique de version](../../devops/livrables/semver/index.md) qui donne du sens aux numéros de version et permet de **déclarer des contraintes sur les dépendances** (ex : `^1.4.0`).
* [12 facteurs - II. Dépendances](../../devops/cloud/12-facteurs/index.md) qui invite à **déclarer explicitement et isoler les dépendances**.
* [Le stockage des livrables](../../devops/livrables/stockage-artefact/index.md) pour les dépôts publics et les gestionnaires d'artefact (dépôts privés).
