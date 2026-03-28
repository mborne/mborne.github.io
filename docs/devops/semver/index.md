# DevOps - La gestion sémantique de version

## Principes

* Numéroter les versions en `<majeur>.<mineur>.<patch>` ou `v<majeur>.<mineur>.<patch>` (selon la technologie utilisée)
* Incrémenter `<majeur>` pour les **changements cassants** ou évolutions structurantes.
* Incrémenter `<mineur>` pour les **ajouts de fonctionnalités rétro-compatibles** .
* Incrémenter `<patch>`  pour les **corrections de bug**.
* Numéroter les branches stables `<majeur>.<mineur>`

## Numérotation des builds

Dans certains cas, construire plusieurs versions d'un artefact pour une même version du code fait sens. Le résultat de la construction pourra alors être numéroté comme suit `<majeur>.<mineur>.<patch>-<build>`.

En matière de production d'image docker, nous remarquerons que ce principe sera par exemple exploité pour :

* Construire des images avec plusieurs OS de base (ex : `-alpine` pour une image basée sur alpine contrairement à l'image par défaut basée sur debian)
* Construire régulièrement des images en mettant à jour l'image de base utilisée (ex : `-YYYYMMDD` avec une construction quotidienne ou hebdomadaire).

## Références

* [semver.org - *Semantic Versioning 2.0.0*](https://semver.org/lang/fr/) qui détaille les principes de numérations de versions.
* [github.com - jgraph/drawio-desktop - release v20.3.0](https://github.com/jgraph/drawio-desktop/releases/tag/v20.3.0) qui illustre la construction pour plusieurs cibles avec une version du code.
