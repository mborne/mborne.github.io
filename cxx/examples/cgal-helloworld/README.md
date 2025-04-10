# cgal-helloworld

Exemple écrit en ~2012 pour prise en main de la bibliothèque [CGAL](https://www.cgal.org/) pour un calcul de [snap rounding](https://doc.cgal.org/latest/Snap_rounding_2/index.html).

## Construction

* Installer les pré-requis :

```bash
# Un compilateur et cmake
sudo apt-get install clang cmake
# OpenSceneGraph
sudo apt-get install libcgal-dev
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
