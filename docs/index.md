# Bienvenue

Ce site regroupe les **supports de cours** dispensés à [Géodata Paris](https://geodata-paris.fr/fr) et en interne à l'[IGN](https://www.ign.fr/), complétés pour former une **base de connaissances** sur l'architecture logicielle, le DevOps, les données géographiques et d'autres sujets pro ou personnels.

---

## 🎓 Les cours

<div class="grid cards" markdown>

-   [**Patrons de conception**](https://mborne.github.io/cours-patron-conception/#1)

    ---

    **Intérêt des concepts de la POO** (constructeur, visibilité, interface,…), **principes de conception** (SOLID, KISS…), puis **anti-patrons** et **patrons de conception** illustrés et mis en pratique en TypeScript à travers des TP.

    Public : Géodata Paris (master TSI).

    [:octicons-arrow-right-24: Accéder au cours](https://mborne.github.io/cours-patron-conception/#1)

</div>

<div class="grid cards" markdown>

-   [**Introduction à l'architecture des SI géographiques**](https://mborne.github.io/cours-archi-si-geo/#1)

    ---

    **Défis** à l'échelle des SI, **principes d'architecture** (SRP, couplage faible,..), **styles d'architecture** (monolythe, client-serveur, n-tiers, micro-services…) et focus sur les **SI manipulant des données géographiques** et leurs spécificités.

    Public : Géodata Paris (master GDS).

    [:octicons-arrow-right-24: Accéder au cours](https://mborne.github.io/cours-archi-si-geo/#1)

</div>

<div class="grid cards" markdown>

-   [**Introduction à la méthode DevOps**](https://mborne.github.io/cours-devops/#1)

    ---

    **Origines** de DevOps (genèse : développements agiles et livraisons fréquentes → agilité dans la gestion des infrastructures), puis **principes** clés, sans insister sur l’automatisation des déploiements ni sur les outils. **Pratique** : **Infrastructure as Code** en IaaS (Terraform, Vagrant, Ansible), **Docker**, **Kubernetes**, **cloud** (choix entre IaaS, PaaS, SaaS, CaaS…)

    Public : formation interne IGN, Géodata Paris (master GDS).

    [:octicons-arrow-right-24: Accéder au cours](https://mborne.github.io/cours-devops/#1)

</div>

---

## 📚 Base de connaissances

Les thèmes ci-dessous constituent une base de référence complémentaire aux cours, librement consultable.

<div class="grid cards" markdown>

-   :material-layers-outline: **[Architecture](architecture/index.md)**

    Principes, patterns, API, roadmaps pour progresser...

-   :material-infinity: **[DevOps](devops/index.md)**

    Annexes du cours : principes (CALMS, GitOps, IaC…), infrastructure réseau, virtualisation, conteneurs (Docker, Kubernetes), déploiement (artefacts, Ansible, Terraform…), DevSecOps, cloud.

-   :material-map-outline: **[Données géographiques](geodata/index.md)**

    Spécificités des données géographiques et IDG (annexes du cours architecture des SI), standards OGC, Géoplateforme, OpenStreetMap, forums et veille.

-   :material-robot-outline: **[IA](ia/index.md)**

    Optimisation (notebooks Jupyter), LLM (compréhension, modèles en local et développement d'applications).

-   :material-file-document-outline: **[Documentation](documentation/index.md)**

    Markdown, MkDocs, Diagrammes as Code (Mermaid, PlantUML…).

</div>

!!! tip "Les outils"
    Les [outils](outils/index.md) (logiciels, bibliothèques, services) sont recensés dans les thèmes correspondants.

---

## 💬 Ces contenus vous sont utiles ?

Ces ressources sont principalement rédigées pour structurer mes connaissances et approfondir certains sujets. Leur mise au propre et leur publication demandent du temps et de l'énergie.

À l'heure de l'IA, un petit signe de vous est précieux pour motiver à faire cet effort :

- [⭐ Une étoile sur le dépôt mborne.github.io](https://github.com/mborne/mborne.github.io) montre que ces contenus sont utiles.
- 📝 Une [issue GitHub](https://github.com/mborne/mborne.github.io/issues) permettra de les améliorer.

Ces petits gestes me motiveront à sortir d'autres contenus de mes dépôts privés 😉.

???info "Quelques exemples de ressources en stock..."
    - [Les données géographiques](https://github.com/mborne/mborne.github.io/issues/18)
    - Les orchestrateurs CI/CD
    - La mise en oeuvre progressive de CI/CD
    - Une tentative de vue d'ensemble des concepts de la programmation (les bases, la POO, la programmation générique, la programmation fonctionnelle...)
