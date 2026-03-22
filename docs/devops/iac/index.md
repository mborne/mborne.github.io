# DevOps - Infrastructure as Code

!!!info "Attention"
    Cette fiche vient compléter [cours-devops - Les principes de DevOps - Infrastructure as Code](https://mborne.github.io/cours-devops/principes.html#infrastructure-as-code).

## Principes

- Les **procédures de déploiement** deviennent des **scripts de déploiement**.
- Les **informations prisonnières des documents** (dimensionnement, configuration,...) deviennent des **paramètres ou des secrets pour ces scripts de déploiement**.

## Bonnes pratiques

- [Idempotence](idempotence/index.md) : Pouvoir exécuter plusieurs fois les scripts de déploiement.
- Atomicité : Pouvoir interrompre et relancer les scripts de déploiement (atomicité).
- [Cohabitation](cohabitation/index.md) : Pouvoir **cohabiter avec d'autres scripts de déploiement** (~Orthogonalité).
- Testabilité : Pouvoir tester les déploiements hors production (ex : DEV / QUA).
- Pouvoir mettre à jour ou reconstruire le système.
