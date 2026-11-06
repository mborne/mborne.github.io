---
tags:
    - Outil
    - Sécurité
    - Supply chain
    - Conteneurs
search:
    boost: 2
---

# Cosign

> 🤖 Contenu généré par IA (non vérifié).

[Cosign](https://github.com/sigstore/cosign#readme) est l'outil du projet [Sigstore](https://www.sigstore.dev/) permettant de **signer et vérifier des images de conteneur** (et plus généralement des artefacts OCI ou des fichiers). Il permet aussi d'attacher à une image des **attestations** signées (ex : SBOM produit par [Syft](../syft/index.md)).

Deux modes de signature sont possibles :

* **Avec une paire de clés** gérée par l'utilisateur (`cosign generate-key-pair`).
* **Sans clé (*keyless*)** : la signature repose sur une identité OIDC (compte GitHub, Google, workflow GitHub Actions,...) et un certificat éphémère délivré par [Fulcio](https://docs.sigstore.dev/certificate_authority/overview/), la signature étant enregistrée dans le journal de transparence [Rekor](https://docs.sigstore.dev/logging/overview/).

## Installation

* [sigstore/cosign - releases](https://github.com/sigstore/cosign/releases)
* [cosign/install.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/cosign/install.sh) procède au téléchargement et à l'installation du .deb :

```bash
curl -sS https://mborne.github.io/outils/cosign/install.sh | bash
```

## Utilisation

Pour afficher l'aide :

```bash
cosign --help
```

### Signature avec une paire de clés

Pour générer une paire de clés (`cosign.key` et `cosign.pub`) :

```bash
cosign generate-key-pair
```

Pour signer une image (la signature est poussée dans la registry à côté de l'image) :

```bash
cosign sign --key cosign.key registry.example.org/mon-app:1.0.0
```

!!!tip "Signer par digest plutôt que par tag"

    Un tag pouvant être déplacé, il est préférable de signer l'image par son digest (`registry.example.org/mon-app@sha256:...`).

Pour vérifier la signature d'une image :

```bash
cosign verify --key cosign.pub registry.example.org/mon-app:1.0.0
```

### Attestation SBOM

Pour enchaîner [Syft](../syft/index.md) (génération du SBOM), [Grype](../grype/index.md) (analyse du SBOM) et Cosign (attestation signée du SBOM) :

```bash
IMAGE=registry.example.org/mon-app:1.0.0

# génération du SBOM
syft $IMAGE -o cyclonedx-json=sbom.cdx.json
# analyse des vulnérabilités à partir du SBOM
grype sbom:sbom.cdx.json --fail-on high
# signature de l'image et attestation du SBOM
cosign sign --key cosign.key $IMAGE
cosign attest --key cosign.key --type cyclonedx --predicate sbom.cdx.json $IMAGE
```

Pour vérifier l'attestation SBOM :

```bash
cosign verify-attestation --key cosign.pub --type cyclonedx registry.example.org/mon-app:1.0.0
```

### Signature sans clé (keyless)

En l'absence de l'option `--key`, cosign utilise le mode *keyless* (ouverture d'un navigateur pour l'authentification OIDC ou utilisation du jeton OIDC d'un workflow GitHub Actions) :

```bash
cosign sign registry.example.org/mon-app@sha256:...
```

La vérification porte alors sur l'identité du signataire et l'émetteur OIDC :

```bash
cosign verify \
    --certificate-identity=dev@example.org \
    --certificate-oidc-issuer=https://github.com/login/oauth \
    registry.example.org/mon-app@sha256:...
```

!!!warning "Données publiques"

    En mode *keyless*, l'identité du signataire (ex : adresse email) est inscrite dans le journal de transparence public Rekor.

## Ressources

* [github.com - sigstore/cosign](https://github.com/sigstore/cosign#readme)
* [docs.sigstore.dev - Cosign](https://docs.sigstore.dev/cosign/signing/overview/)
* [docs.sigstore.dev - Verifying signatures](https://docs.sigstore.dev/cosign/verifying/verify/)
