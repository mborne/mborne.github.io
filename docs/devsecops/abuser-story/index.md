# DevSecOps - les abuser stories

> 🤖 Rédaction assistée par IA.

## Le concept

Dans une démarche agile, les besoins sont exprimés sous forme de ***user stories*** du point de vue d'un utilisateur légitime :

> En tant que **utilisateur**, je veux **réinitialiser mon mot de passe par email** afin de **retrouver l'accès à mon compte**.

Une ***abuser story*** reprend le même format en se plaçant du point de vue d'un **attaquant** ou d'un **utilisateur malveillant** :

> En tant que **attaquant**, je veux **déclencher la réinitialisation du mot de passe d'un autre utilisateur** afin de **prendre le contrôle de son compte**.

Elle décrit ce que le système **ne doit pas permettre**. Elle est rattachée à une ou plusieurs *user stories* et se traduit par des **mesures de sécurité** exprimées sous forme de **critères d'acceptation** :

- Le lien de réinitialisation est à usage unique et expire rapidement.
- La réponse est identique que le compte existe ou non (pas d'énumération des comptes).
- Le nombre de demandes est limité (pas de bombardement de mails).
- L'utilisateur est notifié lorsque son mot de passe est modifié.

## L'intérêt pour intégrer la sécurité dans le développement

!!!info "Objectif"
    Traiter la sécurité **au fil de l'eau avec les mêmes outils que les fonctionnalités** plutôt que **dans une validation en fin de projet** qui bloque les livraisons.

Les *abuser stories* permettent :

- De **faire entrer la sécurité dans le *backlog*** : les mesures de sécurité sont estimées, priorisées et planifiées comme le reste du travail. Elles ne sont plus une liste de recommandations à découvrir lors d'un audit.
- De **rendre les risques compréhensibles par tous** : le format narratif parle aux développeurs, au *product owner* et aux métiers, là où une exigence de type "le système doit être conforme à..." reste abstraite.
- De **changer de point de vue** : se demander "comment pourrais-je abuser de cette fonctionnalité ?" lors de l'affinage d'une *user story* fait émerger des risques qui passent inaperçus du point de vue de l'utilisateur légitime.
- De **définir des critères vérifiables** : les critères d'acceptation se prêtent à des **tests automatisés** qui garantissent la non-régression (voir [l'automatisation des contrôles](../automatisation/index.md)).
- De **partager la responsabilité** : l'équipe de développement s'approprie la sécurité avec l'appui des experts sécurité, plutôt que de la déléguer entièrement à ces derniers.

## Ressources

- [cyber.gouv.fr - Agilité et sécurité numériques : méthode et outils à l’usage des équipes projet](https://cyber.gouv.fr/publications/agilite-et-securite-numeriques-methode-et-outils-lusage-des-equipes-projet) : le guide de l'ANSSI qui évoque les ***abuser stories*** en complément des ***user stories***.
