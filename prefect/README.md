# Prefect

[Prefect](https://docs.prefect.io/v3/get-started/index) est un orchestrateur de données.

## Installation

* [docs.prefect.io - Installation](https://docs.prefect.io/v3/get-started/install)

```bash
# Installation de prefect
pip install -U prefect

# Pour démarrer le serveur en self-hosted sur http://localhost:4200
prefect server start
```

## Utilisation

* [docs.prefect.io - Quickstart](https://docs.prefect.io/v3/get-started/quickstart)
* [docs.prefect.io - Examples](https://docs.prefect.io/v3/examples/index)

## Quelques notes

```bash
prefect config set PREFECT_API_URL="http://127.0.0.1:4200/api"
```

## Ressources

* [docs.prefect.io - Prefect server overview](https://docs.prefect.io/v3/manage/server/index)
  * [docs.prefect.io - self hosted - CLI](https://docs.prefect.io/v3/manage/server/examples/cli)
  * [docs.prefect.io - self hosted - Docker](https://docs.prefect.io/v3/manage/server/examples/docker)
  * [docs.prefect.io - self hosted - Helm](https://docs.prefect.io/v3/manage/server/examples/helm) - prefect-worker / prefect-server
