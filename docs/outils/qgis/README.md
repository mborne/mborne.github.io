# QGIS

[QGIS](https://qgis.org/) est un SIG libre avec un riche ensemble de fonctionnalités.

## Installation

* [qgis.org - Download QGIS for your platform](https://qgis.org/download/)
* [qgis/install.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/qgis/install.sh) procède à l'installation pour Ubuntu en s'appuyant sur [ppa:ubuntugis/ppa](https://launchpad.net/~ubuntugis/+archive/ubuntu/ppa) :

```bash
curl -sS https://mborne.github.io/outils/qgis/install.sh | bash
```

## Ressources

* [qgis/qgis-scale-tiles.xml](qgis-scale-tiles.xml) permet d'éviter des problèmes de ré-échantillonage en alignant les niveaux de zoom avec ceux des pyramides webmercator (WMTS, TMS,...).
* [qgis/helloworld-gpf.qgz](./helloworld-gpf.qgz) est une carte d'exemple affichant des flux WMTS et WFS de la Géoplateforme :

![Screenshot de la carte helloworld-gpf](./img/screenshot-helloworld-gpf.png)
