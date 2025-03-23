
# PHP - Les bonnes pratiques

Cette fiche est une tentative de synthèse de bonnes pratiques pour l'utilisation du langage PHP. [PHP - La bonne manière](https://eilgin.github.io/php-the-right-way/) ira beaucoup plus loin en détaillant les différents points.

## Pour la gestion des dépendances

* Voir [PHP Standards Recommendations](https://www.php-fig.org/psr/)

* Utiliser [PHP composer](https://getcomposer.org/) pour :

  * Décrire et télécharger facilement les dépendances dans `mon-projet/vendor`.
  * Générer un fichier `mon-projet/vendor/autoload.php` (un seul `require autoload.php` sera alors nécessaire)
  * Pouvoir mettre en oeuvre des automatismes à l'installation ou mise à jour (voir [PHP composer / Scripts](https://getcomposer.org/doc/articles/scripts.md#event-names))

## Pour la qualité

* Utiliser [PHPUnit](https://phpunit.de/index.html) pour développer des tests unitaires et fonctionnels

* Choisir une **convention de codage** (ex : [Symfony - Coding Standards](https://symfony.com/doc/current/contributing/code/standards.html)).
* **Utiliser [PHP-CS-Fixer](php-cs-fixer.md)** pour respecter automatiquement cette convention de codage.
* Utiliser un outil d'**analyse statique du code** (ex : [PHPStan](https://phpstan.org/), [PHPMD](https://phpmd.org/rules/),...)

* Générer des journaux applicatifs :

  * Dépendre de [Psr\Log\LoggerInterface](https://www.php-fig.org/psr/psr-3/) au niveau des classes
  * Utiliser [monolog/monolog](https://packagist.org/packages/monolog/monolog) pour instancier [Psr\Log\LoggerInterface](https://www.php-fig.org/psr/psr-3/)

## Pour la scalabilité

Stocker localement uniquement des données spécifiques à l'instance :

* [Utiliser une base de données clé/valeur telle Redis](https://www.atlantic.net/dedicated-server-hosting/setting-up-a-redis-server-as-a-session-handler-for-php-on-ubuntu-22-04/) pour le **stockage des données des sessions**.

* Utiliser une abstraction telle [league/flysystem](https://flysystem.thephpleague.com/v1/docs/) pour le stockage des fichiers pour pouvoir basculer sur un stockage S3.

## Pour la sécurité

* Ne jamais faire confiance aux utilisateurs, **toujours valider les données** (la base...).

* Pour éviter les [injections XSS](https://brightsec.com/blog/cross-site-scripting-php/), toujours **échapper les rendus en HTML** :

  * Utiliser un moteur de template tel [TWIG](https://twig.symfony.com/) qui est intégré au [framework Symfony](https://symfony.com/)
  * Utiliser [ezyang/htmlpurifier](https://packagist.org/packages/ezyang/htmlpurifier) si vous intégrer un éditeur HTML (CKEditor, TinyMCE,...)

* Pour éviter les [injections SQL](https://www.php.net/manual/fr/security.database.sql-injection.php) en accédant aux bases SQL, ne **pas construire une requête SQL avec des données arbitraires** :
  * Utiliser PHP PDO et les **requêtes préparées**
  * Utiliser un **ORM** tel [doctrine/orm](https://www.doctrine-project.org/projects/orm.html)

* Ne **pas exposer la racine d'un projet au niveau du serveur web** :

  * Exposer un dossier `mon-projet/public` contenant un `index.php` au niveau apache/nginx ("document root")
  * Faire un dossier `mon-projet/src` pour les classes
  * Faire un dossier séparé pour les fichiers de configuration (ex : `mon-projet/config` ou `mon-projet/app/config`)

* Ne **pas stocker les fichiers téléversés par des utilisateurs dans un dossier exposé par le serveur** :

  * Faire un dossier séparé pour stocker ces fichiers (ex : `mon-projet/data` ou `/var/mon-projet-data`)
  * Streamer l'envoi du fichier lors du téléchargement en PHP
