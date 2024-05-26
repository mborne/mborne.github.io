# kubectl - gestion d'un cluster kubernetes

## Installation

Voir [kubernetes.io - Installer et configurer kubectl](https://kubernetes.io/fr/docs/tasks/tools/install-kubectl/).

## Principales commandes

| Commande                   | Description                                  |
|----------------------------|----------------------------------------------|
| `kubectl version --client` | Récupération de la version du client kubectl |
| ̀`kubectl get deployments`  | Récupération de la liste des déploiements    |
| ̀`kubectl get services`     | Récupération de la liste des services        |


## Premier déploiement

```bash
# Création d'un déploiement avec une image particulière
kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.10
# Création du service avec exposition du port
kubectl expose deployment hello-minikube --type=NodePort --port=8080
# Récupération de l'état du pod
kubectl get pod
# Récupération de l'URL du service
minikube service hello-minikube --url
# Appel au service
curl -S "$(minikube service hello-minikube --url)"
# Suppression du service
kubectl delete services hello-minikube
# Suppression du déploiement
kubectl delete deployment hello-minikube
```

## Déploiement à l'aide d'un fichier

```bash
# démarrer le pod
kubectl apply -f examples/hello-deployment.yml
# se connecter au pod
kubectl exec -it myapp-pod -- /bin/sh
```

## Déploiement à l'aide d'une URL

```bash
# démarrer nginx
kubectl apply -f https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/controllers/nginx-deployment.yaml
# statut
kubectl get deployments
# exposition de nginx sur port 80
kubectl expose deployment nginx-deployment --type=NodePort --port=80
# récupération url avec minikube
minikube service nginx-deployment --url
# récupérer URL nginx
kubectl get services
```

## Déploiement de whoami

```bash
kubectl apply -f examples/whoami-deployment.yml
# kubectl get services
# kubectl get pods
kubectl expose deployment whoami --type=NodePort --port=8000 --target-port=80
# Récupération de l'URL
minikube service whoami --url
```

## Ressources

* [kubernetes.io - kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
* [kubernetes.io - GETTING STARTED](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands)
