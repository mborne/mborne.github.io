# eigen-sparse-solve

Test de la bibliothèque [Eigen](https://eigen.tuxfamily.org/dox/GettingStarted.html) pour résoudre des systèmes creux (2013)

## Construction

* Installer les pré-requis :

```bash
# Un compilateur et cmake
sudo apt-get install clang cmake
# Eigen
sudo apt-get install libeigen3-dev
```

* Construire avec cmake :

```bash
# préparer un dossier
mkdir build
cd build
cmake ..
# construire les exécutables
make
# exécuter la démo
./eigen-sparse-solve
```

## Ressources

* [eigen.tuxfamily.org - Getting started](https://eigen.tuxfamily.org/dox/GettingStarted.html)
* [eigen.tuxfamily.org - Using Eigen in CMake Projects](https://eigen.tuxfamily.org/dox/TopicCMakeGuide.html)
* [gitlab.com - libeigen/eigen](https://gitlab.com/libeigen/eigen)
