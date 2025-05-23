# PHP

## Installation

* [php/install.sh](install.sh) assure l'installation de l'exécutable PHP (NB : le serveur apache2 n'est pas installé)
* [php/install-composer.sh](install-composer.sh) assure l'installation de l'exécutable [PHP Composer](https://getcomposer.org/).
* [php/install-symfony.sh](install-symfony.sh) assure l'installation de [Symfony CLI](https://symfony.com/doc/current/setup.html#creating-symfony-applications)

## Gestion des dépendances

* [PHP Composer](https://getcomposer.org/) permet le téléchargement des dépendances PHP décrites dans le fichier "composer.json" (équivalent à npm, maven, pip... pour PHP)
* [packagist.org](https://packagist.org/explore/popular) est le dépôt public pour les packages PHP.

## Frameworks

* [www.hostinger.com - 11 Best PHP Frameworks For Beginner to Pro Developers](https://www.hostinger.com/tutorials/best-php-framework) présente un comparatif des principaux frameworks (Laravel, CodeIgniter, Symfony,...)

## Bibliothèques

* [packagist.org - Popular Packages](https://packagist.org/explore/popular) permet de découvrir les bibliothèques les plus utilisées et de rechercher celles dont on a besoin (par exemple, pour [manipuler des fichiers Excel](https://packagist.org/explore/popular?query=excel)).

## Maintenance

Pour la version du langage :

* [PHP Supported Versions](https://www.php.net/supported-versions) permet de connaître les versions PHP maintenues
* [PHPUnit - Supported Versions](https://phpunit.de/supported-versions.html) permet de connaître les versions PHP supportées en fonction des versions PHPUnit
* [PHP-CS-Fixer - Supported PHP Versions](https://github.com/PHP-CS-Fixer/PHP-CS-Fixer?tab=readme-ov-file#supported-php-versions) présente les versions de PHP supportées par php-cs-fixer

Pour les dépendances :

```bash
# affiche les mises à jour possibles
composer outdated
```

## Ressources


* [roadmap.sh - PHP Roadmap](https://roadmap.sh/php) propose un ordre d'apprentissage
* [PHP - Les bonnes pratiques](bonnes-pratiques.md)
* [PHP - La bonne manière](https://eilgin.github.io/php-the-right-way/) ira beaucoup plus loin en détaillant les différents points
* [PHP-CS-Fixer - mise en forme automatique du code PHP](php-cs-fixer.md)
* [medium.com - @dimdev - 9 PHP runtimes: performance benchmark](https://medium.com/@dimdev/9-php-runtimes-performance-benchmark-cbc0527b9df9) : comparaison des différents runtimes (apache+mod_php, nginx+php-fpm, [FrankenPHP](https://frankenphp.dev/),...)
