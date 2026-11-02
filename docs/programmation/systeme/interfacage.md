# Interfaçage entre les langages de programmation

## Points clés

* Les langages de haut niveau sont construits sur la base d'un langage de plus bas niveau
* Il existe des ponts entre les langages
* Étudier ces mécanismes d'interfaçage est un bon point d'entrée pour comprendre en détail le fonctionnement des langages (C, C++, Java, NodeJS...) et outils (ex : PostgreSQL) que l'on utilise.

## Interfaçage entre C et ASM

* [www.devdungeon.com - How to Mix C and Assembly](https://web.archive.org/web/20230205043600/https://www.devdungeon.com/content/how-mix-c-and-assembly) (archive) qui montre comment appeler de l'assembleur en C et vice versa.
* [en.wikipedia.org - X86_calling_conventions - cdecl](https://en.wikipedia.org/wiki/X86_calling_conventions#cdecl) et [en.wikipedia.org - X86_calling_conventions - fastcall](https://en.wikipedia.org/wiki/X86_calling_conventions#Microsoft_fastcall) pour les conventions d'appel de fonctions qui sont derrière ces possibilités d'interfaçage.

## Interfaçage entre Python et C

* [Extending Python with C or C++](https://docs.python.org/3/extending/extending.html)
* [Boost python](https://www.boost.org/doc/libs/1_63_0/libs/python/doc/html/tutorial/index.html#tutorial.quickstart)

## Interfaçage entre Java et C

* [www.jmdoudoux.fr - JNI](https://www.jmdoudoux.fr/java/dej/chap-jni.htm)

## Interfaçage entre Rust et C

* [docs.rust-embedded.org - A little C with your Rust](https://docs.rust-embedded.org/book/interoperability/c-with-rust.html)

## Interfaçage entre NodeJS et C++

* [NodeJS - C++ addons](https://nodejs.org/api/addons.html)

## Outils

* [godbolt.org](https://godbolt.org/) permet de visualiser le code généré par les compilateurs des différents langages (dont le code ASM généré pour du C ou du C++, bytecode JAVA,...)
* [www.swig.org](https://www.swig.org/tutorial.html) permet de générer du code pour interfacer de nombreux langages avec du C ou C++
