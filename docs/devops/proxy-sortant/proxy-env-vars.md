
# Configurer l'utilisation d'un proxy à l'aide de variables d'environnement

## Principe

De nombreux outils supportent la configuration d'un [proxy sortant](./index.md) à l'aide des variables d'environnement `HTTP_PROXY`, `HTTPS_PROXY` et `NO_PROXY`. Par exemple :

```bash
export HTTP_PROXY=http://proxy:3128/
export HTTPS_PROXY=http://proxy:3128/
export http_proxy=http://proxy:3128/
export https_proxy=http://proxy:3128/
# à adapter!
export NO_PROXY=localhost,127.0.0.1,vagrantbox-1,vagrantbox-2,vagrantbox-3
```

## Configuration d'une machine Ubuntu

### Pour un utilisateur

* Ajouter les lignes précédentes au fichier `~/.profile`
* Se déconnecter et rouvrir une session (ou recharger ce fichier avec `source ~/.profile`)

### Pour le système complet

* Ajouter les lignes précédentes au fichier `/etc/environment` (sans toucher à la ligne définissant la variable d'environnement `PATH`!)
* Redémarrer la machine


## Configuration d'une machine Windows

Un dialogue "Modifier les variables d'environnement de votre compte" permet d'ajouter les variables `HTTP_PROXY`, `HTTPS_PROXY` et `NO_PROXY` :

- Option 1 : Chercher "environnement" dans "paramètres"
- Option 2 : Lancer la commande `rundll32 sysdm.cpl,EditEnvironmentVariables` dans un terminal `cmd.exe`.

