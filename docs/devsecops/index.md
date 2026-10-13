# DevSecOps

## Points clés

- L'**agilité** induit le besoin de **livrer rapidement les évolutions**
- **DevOps** : **Si les DEV attendent les OPS, on ne livre pas rapidement** -> Il faut rapprocher les DEV et les OPS et automatiser les déploiements (ex : procédure de déploiement -> scripts de déploiement)
- **DevSecOps** : **S'il faut attendre des validation de sécurité, on ne peut livrer rapidement les évolutions** -> Il faut intégrer les SEC dans le processus et [automatiser au maximum les contrôles](automatisation/index.md) (ex : recommandations -> scripts de contrôle et de rémédiation)

## Les thèmes

<div class="grid cards" markdown>

- :material-bullhorn-outline: **[Sensibilisation](sensibilisation/index.md)**

    Les attaques SSH, l'exposition des services, le durcissement des serveurs, les contrôles TLS et entêtes de sécurité.

- :material-incognito: **[Les abuser stories](abuser-story/index.md)**

    Se placer du point de vue de l'attaquant pour intégrer la sécurité dans le *backlog* et le processus de développement.

- :material-robot-industrial-outline: **[L'automatisation des contrôles](automatisation/index.md)**

    Une recommandation = un test (docker-bench-security, dev-sec.io).

</div>

## Ressources

Pour aller plus loin :

- [blog.stephane-robert.info - DevSecOps : la sécurité intégrée au développement](https://blog.stephane-robert.info/docs/devops/fondamentaux/devsecops/)
- [blog.stephane-robert.info - OWASP Top 10 CI/CD : les 10 risques de sécurité des pipelines](https://blog.stephane-robert.info/docs/securiser/supply-chain/owasp-top-10/)
- [roadmap.sh - DevSecOps](https://roadmap.sh/devsecops)
- [cyber.gouv.fr - Sécuriser un site web](https://cyber.gouv.fr/publications/securiser-un-site-web)
