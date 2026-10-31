# Le refactoring

> 🤖 Rédaction assistée par IA.

## Principe

Le refactoring consiste à **améliorer la conception d'un code existant** en maîtrisant les changements de comportement, par exemple pour :

* Le rendre **plus robuste** (correction de bug)
* Le rendre **plus générique** (réponse à de nouvelles fonctionnalités)
* Le rendre **plus lisible** ou **plus performant**

Bien que certains concepts soient les mêmes, cette fiche traite principalement du **refactoring « local » de code**, pas de la refonte complète d'applications ou de systèmes.

## Changement cassant et changement de comportement

Un **changement cassant** est une modification du code qui **implique une mise à jour du code client** (ex : modification du prototype d'une fonction). Les changements cassants sont **à éviter dans la mesure du possible**.

Par ailleurs, **un changement de comportement ne doit pas intervenir sans changement cassant** : modifier silencieusement ce que fait une fonction dont la signature est inchangée empêche les clients de s'en rendre compte. Introduire un changement cassant (ex : renommer la fonction) **force la prise en compte de la modification dans les codes clients**.

## Numérotation des versions

Pour permettre aux clients de suivre les évolutions, il est important de :

* **Tagger/releaser des versions stables** du code
* Adopter une **convention de nommage pour les versions**

La convention généralement utilisée est `<majeur>.<mineur>.<patch>` (ex : `1.2.5`) où :

* L'incrémentation de `<majeur>` traduit une version porteuse de **changement cassant**
* L'incrémentation de `<mineur>` traduit des **ajouts de fonctionnalités sans changement cassant**
* L'incrémentation de `<patch>` traduit une **correction de bug sans ajout de fonctionnalité**

Connue sous le nom de [gestion sémantique de version](../../devops/livrables/semver/index.md), elle permet aux clients de **maîtriser les montées de version tout en récupérant automatiquement les correctifs** (voir aussi [la gestion des dépendances](../dependances/index.md)).

## Accompagnement du changement

Plusieurs dispositifs d'accompagnement sont envisageables et fréquents :

* Un fichier **CHANGELOG** décrit les changements et les adaptations à réaliser (voir [keepachangelog.com](https://keepachangelog.com/fr/1.1.0/))
* Les **fonctionnalités qui vont être supprimées** peuvent être **marquées comme dépréciées** dans des versions intermédiaires
* Des **versions de transition** peuvent être dédiées à la préparation des changements majeurs

!!! example "Exemple"
    Une version 2.8 peut apporter les nouveautés de la 3.0 et marquer comme dépréciées les fonctionnalités supprimées en 3.0. Les clients corrigent les avertissements de dépréciation en 2.8 avant de passer sereinement en 3.0 (bonne pratique du framework PHP [Symfony](https://symfony.com/releases)).

## Gestion de l'historique

La **gestion des versions** est intimement liée à la **gestion de l'historique** (voir [git](../../outils/git/README.md)). Il est fortement conseillé d'adopter un **workflow clair dans la gestion des branches et des tags**, par exemple :

* [A successful Git branching model, Vincent Driessen](https://nvie.com/posts/a-successful-git-branching-model/) qui a popularisé le modèle « git-flow »
* [Why aren't you using git-flow?, Jeff Kreeftmeijer](https://jeffkreeftmeijer.com/git-flow/)

## Code public et code privé (notion d'API)

Il est difficile d'éviter les changements cassants sur toutes les classes d'une bibliothèque. À ce titre, une bibliothèque distingue souvent :

* Son **code public** (son API), sur lequel les clients peuvent s'appuyer et dont les évolutions suivent la numérotation des versions
* Son **code privé** (suffixe `Impl`, namespace `detail`, package `internal`...), susceptible d'évoluer sans préavis

Il faut **éviter de dépendre du code privé d'une bibliothèque tierce** pour ne pas subir des changements non documentés.

## Importance des tests

Lors d'un refactoring, le comportement observé par les clients du code ne doit pas changer. **Les tests unitaires et fonctionnels permettent d'éviter les régressions** : ils sont idéalement en place (et au vert) **avant** de commencer à modifier le code.

## Techniques de refactoring

Outre l'introduction de patrons de conception (ex : une fabrique pour éviter de répéter du code), il existe une multitude de modifications classiques qui tendent à améliorer la qualité d'un code.

À l'instar des patrons de conception, **ces techniques peuvent être cataloguées**. Quelques exemples issus de [refactoring.com - Catalog of refactorings](https://www.refactoring.com/catalog/) :

* [Renommage d'une variable (*Rename Variable*)](https://www.refactoring.com/catalog/renameVariable.html)
* [Suppression d'un setter (*Remove Setting Method*)](https://www.refactoring.com/catalog/removeSettingMethod.html)
* [Extraction d'une fonction (*Extract Function*)](https://www.refactoring.com/catalog/extractFunction.html)

## Introduire un patron lors d'un refactoring

Les patrons de conception ne s'appliquent pas uniquement en partant d'une feuille blanche. Ils peuvent être introduits à l'occasion d'un refactoring pour traiter un problème identifié dans un code existant.

Par exemple, la fiche [Strategy](../patrons-conception/comportement/Strategy.md) part d'un traitement basé sur un `switch` et compare différentes approches avant d'aboutir au patron.

Le [TP - Refactoring de traitement de graphe](tp-graph-ts/index.md) met en pratique cette démarche sur un code existant (ex : ajout de fabriques pour les sommets et les arcs).

## Quand refactorer ?

Un code est rarement totalement satisfaisant, mais le luxe de pouvoir refactorer un code sans but est rarement offert aux développeurs. Nous profiterons généralement d'**occasions concrètes** pour améliorer le code :

* Industrialisation d'un prototype (ex : travaux de recherche)
* Ajout de fonctionnalités à l'occasion d'une nouvelle version
* Correction de bug, optimisation
* Portage de l'application (ex : Android, Windows → Linux...)

## Quels outils ?

Plusieurs familles d'outils aident à maintenir ou à améliorer la qualité d'un code :

* Les outils de **mise en forme automatique du code** (ex : [Prettier](https://prettier.io/), [Black](https://black.readthedocs.io/))
* Les outils d'**analyse statique de code** (ex : [SonarQube](https://www.sonarsource.com/products/sonarqube/), [ESLint](https://eslint.org/))
* Les outils de **mesure de la couverture par les tests** (ex : [nyc](https://github.com/istanbuljs/nyc#readme))
* Les outils d'**intégration continue** (ex : GitLab CI, GitHub Actions, Jenkins...)

Les fonctionnalités de refactoring des IDE (renommage, extraction de méthode...) permettent en outre d'appliquer certaines techniques de manière sûre.

## Références

* [refactoring.com - Catalog of refactorings](https://www.refactoring.com/catalog/)
* [refactoring.guru - Refactoring](https://refactoring.guru/refactoring)
* [sourcemaking.com - Refactoring](https://sourcemaking.com/refactoring)
* [« Clean Code » de Robert C. Martin (résumé)](https://gist.github.com/cedrickchee/55ecfbaac643bf0c24da6874bf4feb08#file-clean_code-md)
