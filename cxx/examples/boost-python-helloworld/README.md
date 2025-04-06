# boost-python-helloworld

Exemple d'utilisation de boost-python pour créer un module sur une classe Point écrite en C++ (~2012, adapté pour fonctionné avec Python 3.10)

## Description

* [CMakeLists.txt](CMakeLists.txt) : construction avec installation dans boost-python-helloworld/bin
* [hello.cpp](hello.cpp) : Création du module python en C++
* [demo/hello-test.py](demo/hello-test.py) : Exemple d'utilisation du module
* [Makefile](Makefile) : Raccourci pour la construction avec cmake & l'exécution de hello-test.py

## Demo

```bash
# construction de demo/hello.so et exécution de demo/hello-test.py
make demo
```

## Voir aussi

* [gradot.wordpress.com - Boost pour appeler du C++ depuis Python](https://gradot.wordpress.com/2018/12/11/boost-pour-appeler-du-c-depuis-python/)

