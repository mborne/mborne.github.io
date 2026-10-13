# DevOps dans le cloud

Cette fiche est une annexe du [cours-devops - DevOps dans le cloud](https://mborne.github.io/cours-devops/cloud.html).

## Points clés

Il n'y a pas d'offre idéale, le choix se fait **service par service** et il est d'autant plus libre que les applications respectent les 12 facteurs.

* **IaaS, CaaS, PaaS, FaaS, SaaS** : les offres peuvent être hybridées.
* **Stockage** : une offre SaaS (ex : PostgreSQL managé) peut être intéressante, en particulier si peu de DBA (sauvegardes, réplication...). Kubernetes demandant une bonne maîtrise, l'utilisation de VM (IaaS) peut être raisonnable.
* **Applications** : une fois le stockage externalisé, elles sont sans état (*stateless*). FaaS, PaaS ou CaaS selon leur complexité et l'acceptation d'un *vendor lock-in*.
* **Services supports** (IAM, journaux, supervision, coûts) : ils varient selon l'hébergeur et sont un critère de choix.
* **Infrastructure as Code** avec [Terraform](../../outils/terraform/README.md#quelques-fournisseurs) pour automatiser l'infrastructure, chez un ou plusieurs fournisseurs (ex : [mborne/gke-playground](https://github.com/mborne/gke-playground)).
* **Les 12 facteurs** permettant d'avoir des applications *cloud ready* doivent être pris en charge dès la conception (ils ne sont pas intéressants qu'en vue d'un déploiement cloud).

## Ressources

* [Les 12 facteurs](12-facteurs/index.md) : les critères d'une application prête pour le cloud.
* [Géodata Paris - Technologies de Cloud Computing (Cédric Esnault)](https://cedricici.github.io/cours-cloud/public/#/)
* [www.redhat.com - IaaS, PaaS, SaaS : quelles sont les différences ?](https://www.redhat.com/fr/topics/cloud-computing/iaas-vs-paas-vs-saas)
