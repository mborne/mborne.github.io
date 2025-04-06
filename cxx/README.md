# C++

## Construction

* [cmake](https://cmake.org/) simplifie la gestion des dépendances et la construction cross-platforme.
* [conan](https://conan.io/) apporte à C++ un gestionnaire de dépendance de même niveau que pip pour Python ou npm pour JavaScript.

## Utilitaires

Voir [www.boost.org - Library Documentation](https://www.boost.org/doc/libs/1_87_0/?view=condensed) :

* [boost-program_options](http://www.boost.org/doc/libs/1_87_0/doc/html/program_options.html) pour l'écriture d'**API CLI** (voir [Getting Started](https://www.boost.org/doc/libs/1_87_0/doc/html/program_options/tutorial.html#id-1.3.31.4.3))
* [boost-serialization](http://www.boost.org/doc/libs/1_87_0/libs/serialization/doc/index.html) pour la **sérialisation et désérialisation des données**.
  * [examples/leveldb-kvs/README.md](examples/leveldb-kvs/README.md)
* [boost-test](http://www.boost.org/doc/libs/1_87_0/libs/test/doc/html/index.html) pour l'écriture de **tests unitaires et fonctionnels**.
  * [examples/leveldb-kvs/test/KeyValueStoreTest.cpp](examples/leveldb-kvs/test/KeyValueStoreTest.cpp)
* [boost-log](http://www.boost.org/doc/libs/1_87_0/libs/log/doc/html/index.html) pour la génération de **journaux applicatifs**.
* [boost-multi_index](https://www.boost.org/doc/libs/1_87_0/libs/multi_index/doc/index.html) pour l'**indexation sur plusieurs propriétés**.
  * [examples/boost-examples/boost-multi-index.cpp](examples/boost-examples/boost-multi-index.cpp)
* [boost-variant](https://www.boost.org/doc/libs/1_87_0/doc/html/variant.html)
  * [examples/boost-examples/boost-variant-binary-visitor.cpp](examples/boost-examples/boost-variant-binary-visitor.cpp)
* [boost-python](https://www.boost.org/doc/libs/1_87_0/libs/python/doc/html/tutorial/index.html)
  * [examples/boost-python-helloworld/README.md](examples/boost-python-helloworld/README.md)


## Traitement de graphe

* [boost-graph](http://www.boost.org/doc/libs/1_87_0/libs/graph/doc/index.html)
  * [examples/boost-examples/boost-graph-helloworld.cpp](examples/boost-examples/boost-graph-helloworld.cpp)

## Algèbre linéraire

* [boost-ublas](http://www.boost.org/doc/libs/1_87_0/libs/numeric/ublas/doc/index.html)
  * [examples/boost-examples/boost-ublas-gmp.cpp](examples/boost-examples/boost-ublas-gmp.cpp)
  * [examples/boost-examples/boost-ublas-gmp.cpp](examples/boost-examples/boost-ublas-gmp.cpp)
* [Eigen](https://eigen.tuxfamily.org/dox/GettingStarted.html)
  * [examples/eigen-sparse-solve/main.cpp](examples/eigen-sparse-solve/main.cpp)


## Bibliothèques pour les données spatiales

* [GDAL](http://www.gdal.org/) est un bibliothèque d'abstraction sur les données géographiques (image et vecteur) supportant de nombreux formats et de nombreux systèmes.
  * [examples/cgal-helloworld/main.cpp](examples/cgal-helloworld/main.cpp)
* [GEOS](https://trac.osgeo.org/geos/) est une bibliothèque de calcul géométrique utilisée par PostGIS (c'est un portage de [JTS (Java Topology Suite)](https://github.com/locationtech/jts#jts-topology-suite) en C++)
* [GMP - The GNU Multiple Precision Arithmetic Library](https://gmplib.org/)
  * [examples/gmpxx-bench-sum/main.cpp](examples/gmpxx-bench-sum/main.cpp)
  * [examples/gmpxx-helloworld/main.cpp](examples/gmpxx-helloworld/main.cpp)

## Autres

* [OpenCV](https://opencv.org/) est une bibliothèque de traitement d'image.
* [OpenSceneGraph](http://www.openscenegraph.org/) est une bibliothèque de rendu 3D.
  * [examples/osg-experiments](examples/osg-experiments/README.md)
* [Qt](https://www.qt.io/) est un framework de développement d'application graphique portable.
* [STXXL](http://stxxl.org/) est une **implémentation de la STL pour les gros jeux de données** (stockage dans des fichiers).

## Ressources

* [roadmap.sh - C++](https://roadmap.sh/cpp)
* [cppreference.com](https://fr.cppreference.com/w/cpp) est le manuel C++ de référence.
* [roadmap.sh - C++ Developer Roadmap](https://roadmap.sh/cpp) propose un ordre d'apprentissage.
* [www.codewars.com](https://www.codewars.com/) propose de nombreux défis en C++ (avec des corrections permettant de progresser)
* [github.com - federico-busato/Modern-CPP-Programming](https://github.com/federico-busato/Modern-CPP-Programming?tab=readme-ov-file#readme)
* [stackoverflow.com - Cross-platform libraries that are free for commercial (or non-commercial) applications](https://stackoverflow.com/a/782146)
