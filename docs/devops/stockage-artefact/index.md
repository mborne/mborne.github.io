# Le stockage des livrables et des artefacts

Cette fiche présente quelques solutions permettant de stocker le résultat de la construction d'une application (hors cas des images Docker qui est vu dans la suite du cours).

## Les dépôts publics des gestionnaires de dépendance

- [npmjs.com](https://www.npmjs.com/) pour NodeJS
- [packagist.org](https://packagist.org/) pour PHP
- [pypi.org](https://pypi.org/) pour Python
- [Maven Central Repository](https://search.maven.org/) pour Java
- ...

## Les gestionnaires d'artefact

Dans cette catégorie, nous trouverons par exemple [Nexus Repository Manager](https://fr.sonatype.com/products/nexus-repository) qui a ajouté en version 3 le support d'un [grand nombre de formats (APT, PyPI, npm, raw pour des archives .zip / .tar.gz ...)](https://help.sonatype.com/en/formats.html).

## Le système de release du gestionnaire de code source

Nous soulignerons la **possibilité de stocker des livrables en annexe des dépôts GIT** au niveau d'un nombre croissant de gestionnaires de code source :

- [Le système de releases sur GitHub](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository) utilisé par exemple pour fournir les binaires de [drawio-desktop](https://github.com/jgraph/drawio-desktop/releases/tag/v28.2.8)
- [Le système de stockage sur GitLab](https://docs.gitlab.com/ee/ci/pipelines/job_artifacts.html)
- [Le système de package de Gitea](https://docs.gitea.io/en-us/usage/packages/overview/)

En contrepartie d'un rôle toujours plus central pour le gestionnaire de code source, nous soulignerons le **gain en matière de cohérence des droits entre le gestionnaire de code source et le dépôt d'artefact**.

