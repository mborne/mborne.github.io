# Travailler derrière un proxy avec Docker

En présence d'un [proxy sortant](./index.md) pour l'accès aux ressources internet, il convient de :

- [Configurer le démon pour télécharger les images en utilisant le proxy](#configurer-le-demon-pour-telecharger-les-images-en-utilisant-le-proxy)
- [Construire les images en spécifiant le proxy avec des arguments de construction](#construire-les-images-en-specifiant-le-proxy-avec-des-arguments-de-construction)
- [Démarrer les conteneurs en spécifiant le proxy avec des variables d'environnement](#demarrer-les-conteneurs-en-specifiant-le-proxy-avec-des-variables-denvironnement)


## Configurer le démon pour télécharger les images en utilisant le proxy

!!!info "Symptôme"
    `docker pull` ou `docker run` ne fonctionne pas (et ce n'est pas un problème de résolution DNS).

* Créer un fichier `/etc/systemd/system/docker.service.d/http-proxy.conf` en adaptant le contenu suivant :

```ini
[Service]
Environment="HTTP_PROXY=http://proxy:3128"
Environment="HTTPS_PROXY=http://proxy:3128"
Environment="NO_PROXY=localhost,127.0.0.1,::1"
```

* Vérifier que ̀`/etc/default/docker` n'efface pas ces variables en commentant les lignes correspondantes.

* Recharger la configuration du démon docker et le redémarrer :

```bash
sudo systemctl daemon-reload
sudo systemctl restart docker
```

* Tester avec par exemple `docker pull nginx`


## Construire les images en spécifiant le proxy avec des arguments de construction

!!!info "Symptôme"
    La construction d'une image à partir d'un Dockerfile échoue sur les lignes `RUN apt-get update`, `RUN curl`,...

Pour la construction, il est possible de faire suivre les variables d'environnement pour la construction comme suit : 

```bash
docker build --build-arg http_proxy --build-arg https_proxy ...
```

Avec un fichier `docker-compose.yaml`, nous trouverons l'équivalent suivant :

```yaml
services:
  api:
    # ...
    build:
      args:
        - http_proxy
        - https_proxy
    # ...
```

Remarques :

- Par rapport à l'approche consistant à utiliser `ENV HTTP_PROXY=...` dans les images, nous évitons ainsi de persister un proxy dans les images résultantes.
- [docs.docker.com - Configure the Docker client](https://docs.docker.com/network/proxy/#configure-the-docker-client) propose de configurer le proxy via `~/.docker/config.json` mais cette approche ne fonctionnera pas avec certaines usines logicielles.


## Démarrer les conteneurs en spécifiant le proxy avec des variables d'environnement

!!!info "Symptôme"
    Mon conteneur n'arrive pas à accéder à des ressources ou services sur internet (et ce n'est pas un problème de résolution DNS).

Pour l'exécution, il est possible de définir le proxy à l'aide de variables d'environnement : 

```bash
docker run -e HTTP_PROXY=$HTTP_PROXY -e HTTPS_PROXY=$HTTPS_PROXY ...
```

Avec un fichier `docker-compose.yaml`, nous trouverons l'équivalent suivant :

```yaml
services:
  api:
    # ...
    environment:
      - HTTP_PROXY=${HTTP_PROXY}
      - HTTPS_PROXY=${HTTPS_PROXY}
      - http_proxy=${HTTP_PROXY}
      - https_proxy=${HTTPS_PROXY}
    # ...
```


