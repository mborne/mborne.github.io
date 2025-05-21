# minikube - instance locale kubernetes

## Installation

c.f. [kubernetes.io - Installer Kubernetes avec Minikube](https://kubernetes.io/fr/docs/setup/learning-environment/minikube/)

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
