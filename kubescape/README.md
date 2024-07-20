# Kubescape

[Kubescape](https://kubescape.io/) est un scanner de vulnérabilité OpenSource pour Kubernetes.

## Points clés

* [Kubescape](https://kubescape.io/) peut être utilisé sous forme d'un [client en ligne de commande](https://kubescape.io/docs/getting-started/) pour un **scan à la demande**.
* [Kubescape](https://kubescape.io/) peut être installé sous forme dans le cluster à l'aide d'un **opérateur pour un scan en continu**.
* [Kubescape](https://kubescape.io/) peut **scanner des charts helm** ou **dossier Kustomize** en amont des déploiements.
* [Kubescape](https://kubescape.io/) dispose d'un mécanisme de [**gestion des exceptions**](https://kubescape.io/docs/accepting-risk/) (non trouvé dans [trivy-operator](https://github.com/aquasecurity/trivy-operator))
* [Kubescape](https://kubescape.io/) couvre un [**large spectre de contrôles**](https://hub.armosec.io/docs/controls) :
  * Contrôle de la **configuration du cluster** (ex : [C-0069 - Disable anonymous access to Kubelet service](https://hub.armosec.io/docs/c-0069))
  * Contrôle des **déploiements applicatifs** (ex : [C-0004 - Resources memory limit and request](https://hub.armosec.io/docs/c-0004) pour vérifier la définition des limites de consommation RAM)
  * ... et bien d'autres (ex : [C-0078 - Images from allowed registry](https://hub.armosec.io/docs/c-0078) pour maîtriser les dépôts d'images utilisés)

## Installation du client

* [kubescape/install.sh](install.sh) reprend la méthode [kubescape - Getting Started](https://kubescape.io/docs/getting-started/) :

```bash
# téléchargement ~/.kubescape/bin/kubescape
curl -s https://raw.githubusercontent.com/kubescape/kubescape/master/install.sh | /bin/bash

# ... en intégrant l'ajout suivant dans ~/.profile
export PATH=$PATH:$HOME/.kubescape/bin
```

* [kubescape.io - Installing Kubescape](https://kubescape.io/docs/install-cli/) présente d'autres méthodes possibles dont :

```bash
kubectl krew update
kubectl krew install kubescape
```


## Utilisation du client

Pour scanner un cluster :

```bash
# pour une vue synthétique
kubescape scan framework nsa

# pour avoir le détail des erreurs
kubescape scan framework nsa -v

# pour ignorer certains namespaces
kubescape scan framework nsa --exclude-namespaces kube-system,kube-public

# pour scanner uniquement memory.limits
kubescape scan control C-0004 -v
```

Voir [github.com - kubescape/kubescape - docs/getting-started.md](https://github.com/kubescape/kubescape/blob/master/docs/getting-started.md#examples) pour d'autres exemples (dont scan Kustomize, Helm, dépôt GIT...)

## Ressources

* [kubescape.io - Accepting risk with exceptions](https://kubescape.io/docs/accepting-risk/) pour gérer les exceptions
* [kubescape.io - The Kubescape operator](https://kubescape.io/docs/operator/) pour installation dans un cluster
* [kubescape.io - Integrations - Visual Studio Code](https://kubescape.io/docs/integrations/vscode/) pour scan des YAML dans VS code.
* [github.com - kubescape/kubescape - getting-started examples](https://github.com/kubescape/kubescape/blob/master/docs/getting-started.md#examples)


