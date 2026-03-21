# DevSecOps - 5 minutes pour comprendre l'idée...

## Points clés

- L'**agilité** induit le besoin de **livrer rapidement les évolutions**
- **DevOps** : **Si les DEV attendent les OPS, on ne livre pas rapidement** -> Il faut rapprocher les DEV et les OPS et automatiser les déploiements (ex : procédure de déploiement -> scripts de déploiement)
- **DevSecOps** : **S'il faut attendre des validation de sécurité, on ne peut livrer rapidement les évolutions** -> Il faut intégrer les SEC dans le processus et [automatiser au maximum les contrôles](#automatisation-des-contrôles) (ex : recommandations -> scripts de contrôle et de rémédiation)

## Intégrer la sécurité dans le développement

Voir [cyber.gouv.fr - Agilité et sécurité numériques : méthode et outils à l’usage des équipes projet](https://cyber.gouv.fr/publications/agilite-et-securite-numeriques-methode-et-outils-lusage-des-equipes-projet) qui évoque la notion d'***abuser story*** en complément de celle d'***user story*** pour **intégrer le traitement des problématiques de sécurité au processus de développement**.


## Automatisation des contrôles

Quelques exemples inspirants :

* [docker-bench-security - script de contrôle de configuration de docker](https://github.com/docker/docker-bench-security#readme) où **une recommandation = un test** (un peu plus efficace qu'un PDF avec "vous devez configurez l'option userns-remap")
* [dev-sec.io - hardening à la sauce DevSecOps](https://dev-sec.io/) où **une recommandation = la doc d'un test sur la configuration** qui est **accompagnée d'un script pour la corriger**.

## Références

Pour aller plus loin :

* [blog.stephane-robert.info - DevSecOps : la sécurité intégrée au développement](https://blog.stephane-robert.info/docs/devops/fondamentaux/devsecops/)
* [roadmap.sh - DevSecOps](https://roadmap.sh/devsecops)

