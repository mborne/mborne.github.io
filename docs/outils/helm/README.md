# Helm

## Install

[helm/install.sh](install.sh)

## Usage

### Manage repositories

```bash
# Add bitnami's repository
helm repo add bitnami https://charts.bitnami.com/bitnami
# Update repositories
helm repo update
# List repositories
helm repo list
# Find charts in a given repository
helm search repo bitnami
# Find charts versions
helm search repo bitnami/nginx-ingress-controller -l
```

### Deploying with helm

```bash
# Show default values
helm show values bitnami/nginx-ingress-controller

# Preview generated YAML's
helm -n ingress-nginx template nginx bitnami/nginx-ingress-controller --set metrics.enabled=true

# Install or upgrade a release in a given namespace
helm -n ingress-nginx upgrade --install \
    nginx bitnami/nginx-ingress-controller \
    -v my-values.yaml
    --set metrics.enabled=true

# List releases
helm -n ingress-nginx list

# Uninstall
helm -n ingress-nginx delete nginx
```

## Resources

* [helm.sh - Install](https://helm.sh/docs/intro/install/)
* [helm.sh - Quickstart](https://helm.sh/docs/intro/quickstart/)
* [artifacthub.io - Find, install and publish Kubernetes packages](https://artifacthub.io/)
