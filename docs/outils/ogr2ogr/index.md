---
tags:
    - Outil
    - Fichiers
    - Base de données
search:
    boost: 2
---

# ogr2ogr

`ogr2ogr` est l'outil de conversion et de transformation vectorielle de GDAL.

## Cas d'utilisation

* convertir entre formats (GeoJSON, Shapefile, GPKG, PostGIS, ...),
* reprojeter les géométries,
* filtrer les colonnes ou les entités,
* préparer des données pour un chargement en base.

## Installation

Le binaire `ogr2ogr` est fourni avec GDAL.

Selon l'environnement :

* Linux: paquet `gdal-bin` (Debian/Ubuntu),
* [Conda](../conda/README.md): paquet `gdal`,
* Windows : binaire installé avec [QGIS](../qgis/README.md)

Vérifier l'installation :

```bash
ogr2ogr --version
```

## Exemples

### Convertir un fichier Shapefile en GeoJSON

```bash
ogr2ogr -f GeoJSON zones.geojson zones.shp
```

### Reprojeter en WGS84 (EPSG:4326)

```bash
ogr2ogr -f GPKG zones-4326.gpkg zones.gpkg -t_srs EPSG:4326
```

### Filtrer les attributs exportés

```bash
ogr2ogr -f GeoJSON communes.geojson communes.gpkg communes -select "insee,nom,population"
```

### Charger des données dans PostGIS

```bash
ogr2ogr \
  -f PostgreSQL \
  "PG:host=localhost dbname=gis user=gis password=gis" \
  communes.gpkg \
  communes \
  -nln public.communes \
  -overwrite
```

## Ressources

Documentation officielle :

* [gdal.org - ogr2ogr](https://gdal.org/programs/ogr2ogr.html)
* [gdal.org - Vector drivers](https://gdal.org/drivers/vector/index.html)
