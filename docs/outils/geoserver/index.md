---
tags:
    - Outil
    - Données géographiques
    - Service
    - OGC
search:
    boost: 2
---

# GeoServer

GeoServer est un serveur open source de diffusion de données géographiques.

Il permet de publier des couches raster et vectorielles via des standards OGC (WMS, WMTS, WFS) et des API HTTP simples, avec un style cartographique configurable.

## Cas d'utilisation

* publier des données SIG pour des clients web (OpenLayers, Leaflet, MapLibre),
* exposer des données métiers stockées en base (PostGIS) ou dans des fichiers,
* servir de brique de base d'une infrastructure de données géographiques,
* déléguer la production de tuiles et la gestion de styles cartographiques.

## Installation

### Docker (recommandé pour démarrer)

```bash
docker run --name geoserver \
  -p 8080:8080 \
  -e INSTALL_EXTENSIONS=true \
  -e STABLE_EXTENSIONS="gdal" \
  docker.osgeo.org/geoserver:2.28.0
```

Interface d'administration :

* URL : <http://localhost:8080/geoserver>
* identifiants par défaut : `admin` / `geoserver`

### Linux (paquets/distributions)

Des paquets existent selon les distributions Linux, mais les versions peuvent être anciennes. Pour la production, privilégier une image Docker maintenue ou un déploiement applicatif maîtrisé (Tomcat + GeoServer).

## Exemples

### Ajouter un workspace et un datastore PostGIS

1. Créer un workspace (ex: `cadastre`).
2. Ajouter un datastore de type PostGIS.
3. Publier une table ou une vue en tant que couche.

URL typique du datastore PostGIS :

```text
host=postgres
port=5432
database=gis
schema=public
user=gis
password=***
```

### Appeler une couche en WMS

Exemple de requête `GetMap` :

```text
http://localhost:8080/geoserver/cadastre/wms?service=WMS&version=1.1.1&request=GetMap&layers=cadastre:parcelles&styles=&bbox=0,0,1000000,1000000&width=1024&height=768&srs=EPSG:3857&format=image/png
```

### Récupérer les entités en WFS (GeoJSON)

```text
http://localhost:8080/geoserver/cadastre/ows?service=WFS&version=2.0.0&request=GetFeature&typeNames=cadastre:parcelles&outputFormat=application/json
```

## Points d'attention

* **Sécurité** : changer les identifiants par défaut, limiter l'accès à l'interface d'administration et activer TLS côté reverse proxy.
* **Performances** : activer le cache de tuiles (GeoWebCache intégré) et éviter les styles trop coûteux.
* **CRS/projections** : vérifier le SRID des données source et la cohérence des projections exposées.
* **Volumétrie** : indexer correctement les tables PostGIS (index spatiaux) et filtrer les couches volumineuses.
* **Production** : externaliser la configuration et les données persistantes (volume Docker).

## Ressources

* [geoserver.org - Site officiel](https://geoserver.org/)
* [docs.geoserver.org - Documentation](https://docs.geoserver.org/stable/en/user/)
* [docs.geoserver.org - Installing GeoServer using Docker](https://docs.geoserver.org/stable/en/user/installation/docker.html)
* [www.ogc.org - Standards](https://www.ogc.org/standards/)

## Voir aussi

* [ogr2ogr](../ogr2ogr/index.md) - Préparer et convertir des données avant publication
* [QGIS](../qgis/README.md) - Préparation et contrôle des données SIG
