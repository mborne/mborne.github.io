# Données géographiques

!!!info "En construction"

    Cette partie a vocation à accueillir dans l'immédiat les annexes des parties [Les spécificités liées aux données géographiques](https://mborne.github.io/cours-archi-si-geo/#les-sp%C3%A9cificit%C3%A9s-li%C3%A9es-aux-donn%C3%A9es-g%C3%A9ographiques) et [Les infrastructures de données géographiques](https://mborne.github.io/cours-archi-si-geo/#les-infrastructures-de-donn%C3%A9es-g%C3%A9ographiques) du cours [Introduction à l'architecture des SI](https://mborne.github.io/cours-archi-si-geo/#2).
    
!!!info "En attente de confirmation d'utilité pour aller plus loin"

    Voir [issue 18](https://github.com/mborne/mborne.github.io/issues/18).

## Les standards

* [www.ogc.org - Standards](https://www.ogc.org/standards/) pour une vue d'ensemble des standards de OGC (WMTS / OGC API – Tiles, WFS / OGC API Feature,...)

## Les utilitaires

> TODO https://github.com/mborne/mborne.github.io/issues/9

## Les services

> TODO https://github.com/mborne/mborne.github.io/issues/9

<!--

### Validation des données spatiales

Quelques travaux autour de [IGNF/validator](https://github.com/IGNF/validator) :

* [mborne/validator-experiments](https://github.com/mborne/validator-experiments) - validation des données ROUTE500 et cadastrales avec [IGNF/validator](https://github.com/IGNF/validator) (2020, test de robustesse à industrialiser?)
* [mborne/debug-gml-pcrs](https://github.com/mborne/debug-gml-pcrs) - Dépôt de reproduction d'un bug de [GDAL - GMLAS driver](https://gdal.org/drivers/vector/gmlas.html) (2022, **bug corrigé, archivé**)

### Cartographie web

* [mborne/jquery-geometry-editor](https://github.com/mborne/jquery-geometry-editor) - Un prototype d'extension JQuery visant à **rendre l'édition d'une géométrie dans un formulaire web aussi simple que l'édition d'une date** (2016, **archivé**, industrialisé en [IGNF/ol-geometry-editor](https://github.com/IGNF/ol-geometry-editor))
* [mborne/geoportail-leaflet](https://github.com/mborne/geoportail-leaflet) - Un exemple illustrant l'**utilisation des services WMTS de l'IGN** de la même manière qu'un TMS d'OSM **avec Leaflet** (2014, **archivé**)

### Simulation des règlements d'urbanisme

Relatif au travail autour de [Simplu3D](https://simplu3d.github.io/) en satellite du [GéoPortail de l'Urbanisme](https://www.geoportail-urbanisme.gouv.fr/) :

* [mborne/plu-formel](https://github.com/mborne/plu-formel) (2019, **fork archivé**, voir [CNIG - Structuration du réglement urbanisme (niveau 2)](https://cnig.gouv.fr/structuration-des-reglements-d-urbanisme-a25890.html))
* [mborne/simplu3D-experiments](https://github.com/mborne/simplu3D-experiments) (2018, **fork archivé**)



## Chargement des données spatiales

Les **dépôts suivants doivent être archivés**. Ils étaient utilisés par [mborne/postgis-integration](https://github.com/mborne/postgis-integration) avant le portage en Python :

* [mborne/node-dl](https://github.com/mborne/node-dl) qui encapsule des appels à [wget](https://doc.ubuntu-fr.org/wget) pour le **téléchargement des données**.
* [mborne/node-extract](https://github.com/mborne/node-extract) qui appelle l'exécutable adapté (tar, unzip,...) pour **décompresser les archives**.
* [mborne/node-ogr2pg](https://github.com/mborne/node-ogr2pg) qui exécute des commandes [ogr2ogr](https://gdal.org/programs/ogr2ogr.html) pour **charger différents formats dans PostgreSQL/PostGIS**.
* [mborne/node-postgis-helper](https://github.com/mborne/node-postgis-helper) qui est une tentative d'aller un plus plus loin avec une **gestion des métadonnées sur les sources** et une **exploration des schémas** en vue de générer des API (1).

> (1) Cette idée est abandonnée au profit d'outil tels [pg_featureserv](https://github.com/CrunchyData/pg_featureserv?tab=readme-ov-file#pg_featureserv).
-->


## Sources d'information et communautés

* [georezo.net](https://georezo.net/)
* [geotribu.fr](https://geotribu.fr/)
* [forum.geocommuns.fr](https://forum.geocommuns.fr/)
* [www.developpez.net - Forum SIG : Système d'information Géographique](https://www.developpez.net/forums/f1254/applications/sig-systeme-d-information-geographique/)
* [www.openstreetmap.fr - actualites](https://www.openstreetmap.fr/actualites/)
* [cartes.gouv.fr - actualité](https://cartes.gouv.fr/actualites)
* [geoplateforme.github.io - Documentation Géoplateforme](https://geoplateforme.github.io/)
* [geoservices.ign.fr - actualités](https://geoservices.ign.fr/actualites)

