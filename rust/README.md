# Rust

[Rust](https://www.rust-lang.org/fr) est un langage de même niveau que C++ qui produit un binaire natif qui s’exécute directement sur l’OS, sans interpréteur ni machine virtuelle.

## Points forts

Contrairement à C++, [Rust](https://www.rust-lang.org/fr) impose des **règles à la compilation** pour garantir :

* Une **gestion stricte de la mémoire**, grâce à un modèle de propriété des variables qui encadre la possession, l’emprunt et la durée de vie des données - ce qui revient à rendre obligatoire l'utilisation de pointeurs intelligents en C++.
* Une prévention des *[race conditions](https://fr.wikipedia.org/wiki/Situation_de_comp%C3%A9tition)* : le **compilateur empêche que deux threads accèdent simultanément à une même variable mutable**, ce qui permet d’éviter les verrous explicites tout en offrant plus de souplesse que l’usage exclusif de variables immuables.

## Installation

Voir [www.rust-lang.org - Install](https://www.rust-lang.org/tools/install) :

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Construction et gestion de dépendances

* [rustc](https://doc.rust-lang.org/rustc/) est le compilateur Rust.
* [cargo](https://doc.rust-lang.org/cargo/) assure la gestion des dépendances et la construction des applications.
* [crates.io](https://crates.io/) est le principal dépôt de dépendances publiques.                |

## Ressources

* [doc.rust-lang.org - The Rust Programming Language](https://doc.rust-lang.org/book/) permet une découverte progressive du langage et de ces concepts.
* [doc.rust-lang.org - Cargo Guide](https://doc.rust-lang.org/cargo/guide/index.html)
* [basic-examples - Quelques exemples rédigés pour découvrir le langage](basic-examples/README.md)
* [wkt-generator - Un exemple rédigé pour prise en main de Cargo](wkt-generator/README.md)
