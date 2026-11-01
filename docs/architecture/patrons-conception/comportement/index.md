# Les patrons de comportement

> 🤖 Rédaction assistée par IA.

Les patrons de comportement traitent de la **répartition des responsabilités** entre les objets et de la **manière dont ils communiquent**. Ils permettent de **faire varier un traitement ou d'en étendre le fonctionnement sans modifier le code existant**.

## Les patrons du GoF

* [Iterator (Itérateur)](Iterator.md) : **parcourir une collection** sans dépendre de sa structure interne
* [Strategy (Stratégie)](Strategy.md) : **faire varier dynamiquement une partie d'un traitement** en changeant d'algorithme
* [Visitor (Visiteur)](Visitor.md) : **ajouter des traitements sur une hiérarchie de classes** sans la modifier ni tester le type des objets
* [Chain of responsibility (Chaîne de responsabilité)](ChainOfResponsibility.md) : **décomposer un traitement en une succession d'étapes** modifiable dynamiquement
* [Observer (Observateur)](Observer.md) : **notifier des abonnés** en cas d'événement sur un objet
* [State (État)](State.md) : **externaliser les traitements dépendant de l'état** d'un objet avec une classe par état

## Compléments

* [Null Object (Objet nul)](NullObject.md) : **remplacer une référence nulle par un objet neutre** pour éviter les tests de nullité

## Pour aller plus loin

Les patrons suivants ne sont pas traités dans le cours :

* [Template Method (Patron de méthode)](https://refactoring.guru/fr/design-patterns/template-method) : **définir le squelette d'un algorithme** dans une classe parente en laissant les sous-classes en redéfinir certaines étapes
* [Mediator (Médiateur)](https://refactoring.guru/fr/design-patterns/mediator) : **centraliser les échanges entre objets** pour limiter leurs dépendances mutuelles
* [Command (Commande)](https://refactoring.guru/fr/design-patterns/command) : **représenter une action sous forme d'objet** (ex : file d'attente, historique, annulation)
* [Memento (Mémento)](https://refactoring.guru/fr/design-patterns/memento) : **sauvegarder et restaurer l'état d'un objet** sans exposer ses détails internes
* [Interpreter (Interpréteur)](https://fr.wikipedia.org/wiki/Interpr%C3%A9teur_(patron_de_conception)) : **évaluer les expressions d'un langage** représentées sous forme d'arbre d'objets
