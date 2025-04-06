# boost-examples

Quelques exemples rédigés entre 2012 et 2015 pour prise en main de bibliothèques Boost :

* [boost-graph-helloworld.cpp](boost-graph-helloworld.cpp) est un exemple pour prise en main de [boost::graph](https://www.boost.org/doc/libs/1_75_0/libs/graph/doc/index.html) (2012)
* [boost-multi-index.cpp](boost-multi-index.cpp) est un test de [boost::multi_index](https://www.boost.org/doc/libs/1_75_0/libs/multi_index/doc/index.html)
* [boost-ublas-gmp.cpp](boost-ublas-gmp.cpp) est un test [boost::ublas](https://www.boost.org/doc/libs/1_87_0/libs/numeric/ublas/doc/index.html) avec [GMP](https://gmplib.org/) pour la résolution exacte d'une équation avec des rationnels (~2013)
* [boost-ublas-projection.cpp](boost-ublas-projection.cpp) est un test de [boost::ublas](https://www.boost.org/doc/libs/1_87_0/libs/numeric/ublas/doc/index.html) pour la projection d'un point sur une droite (2013)
* [boost-variant-binary-visitor.cpp](boost-variant-binary-visitor.cpp) est un test de [boost::variant](https://www.boost.org/doc/libs/1_87_0/doc/html/variant.html) avec visiteur binaire / double dispatching (~2013)

## Construction

* Installer les pré-requis :

```bash
# Un compilateur et cmake
sudo apt-get install clang cmake
# Quelques bibliothèques boost
sudo apt-get install libboost-all-dev
```

* Construire avec cmake :

```bash
# préparer un dossier
mkdir build
cd build
cmake ..
# construire les exécutables
make
```
