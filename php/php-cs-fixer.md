
# PHP-CS-Fixer - mise en forme automatique du code PHP

L'outil [php-cs-fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer#php-coding-standards-fixer) permet la **mise en forme automatique du code en fonction de règles de codage**. Son utilisation évitera d'avoir un code mixant des styles différents dans le formatage du code, dans l'initialisation des tableaux (`$tableau = []` ou `$tableau = array()`),...

## Installation

```bash
# Pour tous les projets (php-cs-fixer --help)
composer global require friendsofphp/php-cs-fixer
# En dépendance de dev d'un projet (vendor/bin/php-cs-fixer --help)
composer require --dev friendsofphp/php-cs-fixer
```

## Utilisation en ligne de commande

Si on choisit de s'appuyer sur les règles de codage de [Symfony](https://symfony.com/doc/current/contributing/code/standards.html), il suffit de lancer la commande suivante pour forcer l'application des règles dans le dossier `src` :

```bash
php-cs-fixer fix src --rules @Symfony
```

Pour se contenter de valider les règles, il suffit de lancer la commande suivante :

```bash
php-cs-fixer fix src --rules $(PHP_CS_RULES) -v --dry-run --diff
```

## Ressources

* [github.com - mborne/remote-git - Makefile](https://github.com/mborne/remote-git/blob/master/Makefile) : exemple de makefile facilitant la mise en oeuvre d'une intégration continue (c.f. [.github/workflows/ci.yml](https://github.com/mborne/remote-git/blob/e8b741ad7557f7b588709b49759634ec060a7e8f/.github/workflows/ci.yml))