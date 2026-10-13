# Cookies et statistiques

## Mesure de l'audience

Ce site s'appuie sur [Matomo](https://fr.matomo.org/gdpr-analytics/), un outil recommandé par la Commission Nationale de l’Informatique et des Libertés (CNIL), pour mesurer le nombre de visites et comprendre quelles sont les pages les plus consultées.

## Pourquoi l'absence d'écran de consentement?

[Matomo](https://fr.matomo.org/gdpr-analytics/) est configuré en suivant [les recommandations de la CNIL](https://www.cnil.fr/fr/cookies-et-autres-traceurs/regles/cookies-solutions-pour-les-outils-de-mesure-daudience) de sorte que les visites sur ce site ne puissent être associées à une personne et qu'il ne soit pas nécessaire d'afficher une bannière de consentement.

En particulier :

- Les cookies sont déposés sur le domaine du site (*first-party*) et ne permettent pas de suivre la navigation sur d'autres sites.
- Leur durée de vie est limitée à 13 mois et n'est pas prolongée lors des nouvelles visites.
- Les adresses IP sont anonymisées (suppression des deux derniers octets).
- Les données sont conservées 25 mois au maximum et ne sont utilisées que pour produire des statistiques anonymes.
- Les données ne sont ni recoupées avec d'autres traitements, ni transmises à des tiers.

## Les cookies déposés

| Nom du cookie | Finalité | Durée de conservation |
| ------------- | -------- | --------------------- |
| `_pk_id.*` | Identifiant anonyme permettant de distinguer les nouveaux visiteurs des visiteurs réguliers | 13 mois |
| `_pk_ses.*` | Rattachement des pages consultées à une même visite | 30 minutes |
| `_pk_ref.*` | Mémorisation du site d'origine de la visite (site référent) | 6 mois |
| `_pk_testcookie.*` | Vérification de la prise en charge des cookies par le navigateur | Supprimé immédiatement |
| `mtm_consent_removed` | Mémorisation de l'opposition à la mesure d'audience (voir ci-dessous) | 30 ans (ou moins selon le navigateur) |

Voir [matomo.org - What are the cookies created by Matomo JavaScript Tracking client?](https://matomo.org/faq/general/faq_146/) pour plus de détails.

## Exclure ses visites des statistiques

<div id="matomo-opt-out"></div>
<script src="https://stats.quadtreeworld.net/index.php?module=CoreAdminHome&action=optOutJS&divId=matomo-opt-out&language=fr&showIntro=1"></script>
