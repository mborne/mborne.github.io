# DevOps

Ces fiches sont les annexes venant compléter la présentation [mborne.github.io/cours-devops - Introduction à la méthode DevOps](https://mborne.github.io/cours-devops).

## Généralités

!!!info "[cours-devops - Les origines de DevOps](https://mborne.github.io/cours-devops/origines.html) prend une approche historique pour expliquer la génèse de DevOps"

    Internet ⇒ on peut livrer rapidement ⇒ agilité des développement ⇒ on doit recetter rapidement ⇒ test unitaire / intégration continue ⇒ on peut aussi livrer rapidement... pour peu qu'on rapproche les DEV et les OPS et qu'ils arrêtent de communiquer via des documents.


!!!info "[cours-devops - Les principes de DevOps](https://mborne.github.io/cours-devops/principes.html) se concentre sur les principes génériques (l'intérêt de Terraform, Ansible, Docker et Kubernetes est abordé dans les parties suivantes)"

    Mur de la confusion ⇒ il faut un objectif commun / un seul processus, CALMS, métriques, observabilité, Infrastructure as Code, GitOps, Docs as Code, Everything as code!

* [DevOps - les principes](principes/index.md) complète ces deux présentations avec des références.
* [DevOps - Infrastructure as Code](./iac/index.md)
* [Les 12 facteurs](./12-facteurs/index.md)

## Infrastructure

* [DevOps - Les réseaux](./reseau/index.md)
* [Partage de charge et reverse proxy](./lb-rp/index.md)
* [blog.octo.com - Le bastion SSH](https://blog.octo.com/le-bastion-ssh/)
* [Le proxy sortant](./proxy-sortant/index.md)

## Virtualisation

* [WSL (Windows Subsystem For Linux)](../outils/wsl/README.md)
* [VirtualBox](https://www.virtualbox.org/)
* [QEMU](../outils/qemu/README.md) / [KVM](../outils/kvm/README.md)
 
## Conteneurs

* [Docker](../outils/docker/README.md)
* [Kubernetes](../outils/kubernetes/index.md)

## Déploiement

* [Le stockage des livrables et des artefacts](stockage-artefact/index.md)
* [Vagrant](../outils/vagrant/README.md)
* [Ansible](../outils/ansible/README.md)
* [Terraform](../outils/terraform/README.md) / [OpenTofu](../outils/opentofu/README.md)

## Sécurité

* [DevSecOps - 5 minutes pour comprendre l'idée...](devsecops/index.md)
* [Les certificats LetsEncrypt et le protocole ACME](letsencrypt-acme/index.md)

## Ressources

* [blog.stephane-robert.info](https://blog.stephane-robert.info/) est une mine d'or pour progresser sur le sujet **DevSecOps**
* [roadmap.sh - DevOps](https://roadmap.sh/roadmaps?g=DevOps) permet de faire le tour d'un ensemble de **concepts et outils**

Pour aller plus loin sur l'informatique en nuage :

* [ENSG - Technologies de Cloud Computing (Cédric Esnault)](https://cedricici.github.io/cours-cloud/public/#/)
* [www.redhat.com - IaaS, PaaS, SaaS : quelles sont les différences ?](https://www.redhat.com/fr/topics/cloud-computing/iaas-vs-paas-vs-saas)




