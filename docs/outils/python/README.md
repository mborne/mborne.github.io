---
tags:
    - Langage
---

# Python

## Gestion des dépendances

* [pip](https://packaging.python.org/tutorials/installing-packages/)
* [PyPI](https://pypi.org/)

## Gestionnaires d'environnements

* [virtualenv](virtualenv.md)
* [conda](../conda/README.md)

## Maintenance

* [devguide.python.org - Status of Python versions](https://devguide.python.org/versions/)

## Calcul et le traitement d'image

* [NumPy](https://numpy.org/)
    * [www.dataquest.io - NumPy Cheat Sheet](https://www.dataquest.io/cheat-sheet/numpy-cheat-sheet/)
    * [github.com - mborne/numpy-experiments - 01-noisy-line et 02-noisy-circle](https://github.com/mborne/numpy-experiments#01-noisy-line)
* [Matplotlib](https://matplotlib.org/) pour l'affichage de graphiques mathématiques
    * [Matplotlib - User Guide](https://matplotlib.org/stable/users/index.html)
    * [Matplotlib - Examples](https://matplotlib.org/stable/gallery/index.html)
* [SciPy](https://docs.scipy.org/doc/scipy/reference/) extension de NumPy :
    * [Interpolation](https://docs.scipy.org/doc/scipy/reference/interpolate.html)
    * [Delaunay triangulation, convex hulls, and Voronoi diagrams](https://docs.scipy.org/doc/scipy/reference/spatial.html#delaunay-triangulation-convex-hulls-and-voronoi-diagrams)
    * [Clustering](https://docs.scipy.org/doc/scipy/reference/cluster.html)
    * ...
* [opencv-python](https://docs.opencv.org/4.x/d6/d00/tutorial_py_root.html) pour le traitement d'image, lecture camera,...
* [Pandas](https://pandas.pydata.org/docs/index.html) lecture et traitement de données

## Données spatiales

* [OWSLib](https://owslib.readthedocs.io/en/latest/) pour accès aux **services OGC (WFS, WMS,...)**
    * [examples/owslib/wfs-gpf-filtering.py](examples/owslib/wfs-gpf-filtering.py)
* [Shapely](https://shapely.readthedocs.io/en/latest/) pour des **calculs géométriques** (basée sur [GEOS](https://trac.osgeo.org/geos)).
* [GeoPandas](https://geopandas.org/) aggrégation de plusieurs bibliothèques.
* [Rasterio](https://rasterio.readthedocs.io/en/latest/) pour les GeoTIFF.
* [GDAL](https://pypi.org/project/GDAL/) est un binding de la bibliothèque GDAL/OGR (version "roots" des autres bibliothèques)
* [pyproj](http://pyproj4.github.io/pyproj/stable/) offre des fonctionnalités de transformations de coordonnées (binding PROJ4 pour Python).

## Rendu cartographique

* [Folium](https://python-visualization.github.io/folium/quickstart.html#Getting-Started) assure le **rendu des données cartographiques** en générant une carte Leaflet.
* [Descartes](https://pypi.org/project/descartes/) assure le **rendu des géométries** à l'aide de [matplotlib](https://matplotlib.org/).

## Optimisation et machine learning

* [pytorch](https://pytorch.org/)
* [scikit-learn](https://scikit-learn.org/stable/)
* [tensorflow](https://www.tensorflow.org/)
    * [github.com - mborne/numpy-experiments - 03-noisy-circle-tf](https://github.com/mborne/numpy-experiments#03-noisy-circle-tf)

## Divers

* [jupyter](https://jupyter.org/)
    * [Project Jupyter Documentation](https://docs.jupyter.org/en/latest/)
* [gradio](https://www.gradio.app/)
    * [gradio - Quickstart](https://www.gradio.app/guides/quickstart)
    * [gradio - Documentation](https://www.gradio.app/docs)
    * [gradio - Playground](https://www.gradio.app/playground)

## Ressources

Pour débuter :

* [www.w3schools.com - Python Tutorial](https://www.w3schools.com/python/default.asp)
* [roadmap.sh - Python](https://roadmap.sh/python)
* [www.codewars.com - Kata en python](https://www.codewars.com/kata/search/python?beta=false&order_by=popularity%20desc)

Pour découvrir les bibliothèques :

* [medium.com/@chrieke - Essential geospatial Python libraries](https://medium.com/@chrieke/essential-geospatial-python-libraries-5d82fcc38731)

Pour la programmation fonctionnelle en python :

* [www.analyticsvidhya.com - The power of Python Map, Reduce and Filter – Functional Programming for Data Science](https://www.analyticsvidhya.com/blog/2021/09/the-power-of-python-map-reduce-and-filter-functional-programming-for-data-science/)
