# minikube - instance locale kubernetes

## Installation

[minikube/install.sh](install.sh) assure l'installation de l'exécutable `minikube`.

## Commande de gestion minikube

| Commande                             | Description                                  |
|--------------------------------------|----------------------------------------------|
| `minikube start --driver=virtualbox` | Démarrer le cluster minikube dans virtualbox |
| `minikube status`                    | Récupérer le statut du cluster               |
| `minikube stop`                      | Arrêter le cluster minikube                  |
| `minikube delete`                    | Supprimer le cluster minikube                |
| `minikube dashboard`                 | Visualisation interface minikube             |

## Création cluster minikube dans virtualbox

```bash
minikube start --driver=virtualbox
minikube status
# ...
minikube stop
minikube delete
```

## Ressources

* [kubernetes.io - Installer Minikube](https://kubernetes.io/fr/docs/tasks/tools/install-minikube/)
