---
tags:
    - Outil
    - Fichiers
    - Données géographiques
    - Simplification
search:
    boost: 2
---

# Mapshaper

> 🤖 Rédaction assistée par IA.

Mapshaper est un outil complet pour éditer et convertir les données géographiques (Shapefile, GeoJSON, TopoJSON, GeoPackage, FlatGeobuf, GeoParquet, KML, CSV...), disponible en interface web et en ligne de commande.

L'outil dispose de fonctionnalités puissantes pour **simplifier les géométries**, nettoyer les données, effectuer des opérations géométriques (clip, erase, dissolve...) et convertir entre différents formats.

## Cas d'utilisation

* **simplifier les géométries en conservant la topologie à l'échelle d'une couche**
* convertir entre formats (GeoJSON, Shapefile, TopoJSON, GeoPackage, ...),
* nettoyer et réparer les topologies,
* éditer les données attributaires,
* combiner et fusionner des couches,
* filtrer les entités géographiques.

## Installation

### Ligne de commande

Mapshaper nécessite Node.js. Une fois Node.js installé :

```bash
npm install -g mapshaper
```

Vérifier l'installation :

```bash
mapshaper --version
```

### Interface web

Accessible directement à [mapshaper.org](https://mapshaper.org) sans installation requise. Tous les traitements s'exécutent dans le navigateur.

## Simplification géométrique

### Concept

La simplification réduit le nombre de points d'une géométrie, ce qui :

* **réduit la taille des fichiers** (notamment important pour les données complexes comme les côtes ou limites administratives),
* **accélère le rendu** sur le web,
* **préserve l'essentiel** de la forme tout en éliminant les détails inutiles.

### Méthodes de simplification

Mapshaper offre trois algorithmes différents :

#### Visvalingam-Whyatt (par défaut)

Supprime les points situés dans les angles les plus aigus pour un résultat plus fluide. C'est généralement le meilleur choix.

```bash
mapshaper zones.shp -simplify 10%
```

#### Douglas-Peucker

Conserve les points situés dans une distance maximale de la ligne originale. Rapide mais peut créer des pointes aux angles aigus.

```bash
mapshaper zones.shp -simplify method=dp 10%
```

#### Simplification cartographique

Basée sur les triangles formés par les points adjacents.

### Exemples

#### Simplifier avec un pourcentage de conservation

```bash
mapshaper zones.shp -simplify 25% -o format=geojson
```

Cela réduit le nombre de points à 25% du total original.

#### Simplifier avec une distance donnée (algorithme Douglas-Peucker)

```bash
mapshaper zones.shp -simplify method=dp interval=1000 -o
```

Conserve tous les points à plus de 1000 unités de distance de la ligne simplifiée.

#### Simplifier pour le web (petites géométries)

```bash
mapshaper routes.shp -simplify 10% keep-shapes -o format=geojson
```

L'option `keep-shapes` empêche les petits polygones de disparaître lors d'une forte simplification.

#### Combiner simplification et conversion

```bash
mapshaper limites.shp \
  -simplify 15% \
  -o format=geojson limites-simple.geojson
```

#### Simplifier en coordonnées planaires

```bash
mapshaper zones.shp -simplify 10% planar -o format=geojson
```

Par défaut, mapshaper traite les coordonnées comme des latitude/longitude (sphériques). L'option `planar` les traite comme des coordonnées cartésiennes sur un plan.

### Options utiles

| Option               | Description                                 |
| -------------------- | ------------------------------------------- |
| `method=visvalingam` | Utilise Visvalingam-Whyatt (défaut)         |
| `method=dp`          | Utilise l'algorithme Douglas-Peucker        |
| `keep-shapes`        | Empêche les petits polygones de disparaître |
| `planar`             | Traite les coordonnées comme cartésiennes   |
| `no-quantization`    | Désactive la quantification des coordonnées |

## Workflow complet d'optimisation

Un cas d'usage plus concret consiste à récupérer les départements depuis la Géoplateforme, puis à produire un GeoJSON allégé pour le web :

```bash
# 1. Télécharger les départements en GeoJSON avec ogr2ogr (~131M)
ogr2ogr -f GeoJSON departements.geojson \
  WFS:"https://data.geopf.fr/wfs?service=WFS&version=2.0.0&request=GetCapabilities" \
  ADMINEXPRESS-COG.LATEST:departement

# 2. Nettoyer et simplifier pour réduire fortement la taille (0.8M)
mapshaper departements.geojson \
  # 3. Nettoyer les topologies
  -clean \
  # 4. Conserver 0.2% du détail original
  -simplify 0.2% keep-shapes \
  # 5. Exporter en GeoJSON
  -o format=geojson departements-light.geojson
```

Résultat :

- URL pour QGIS : <https://mborne.github.io/outils/mapshaper/departements-light.geojson>
- Visualisation GitHub : [github.com/mborne/mborne.github.io/blob/main/docs/outils/mapshaper/departements-light.geojson](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/mapshaper/departements-light.geojson)

## Ressources

* **Site officiel** : [mapshaper.org](https://mapshaper.org)
* **Documentation** : [mapshaper.org/docs](https://mapshaper.org/docs/)
* **Dépôt GitHub** : [github.com/mbloch/mapshaper](https://github.com/mbloch/mapshaper)

## Voir aussi

* [github.com - gregoiredavid/france-geojson](https://github.com/gregoiredavid/france-geojson) / <https://france-geojson.gregoiredavid.fr/>
* [ogr2ogr](../ogr2ogr/index.md) - Conversion et transformation vectorielle GDAL
* [QGIS](../qgis/README.md) - Interface complète pour l'édition de données géographiques
