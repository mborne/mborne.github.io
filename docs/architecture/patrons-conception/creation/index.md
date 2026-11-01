# Les patrons de création

> 🤖 Rédaction assistée par IA.

Les patrons de création traitent de l'**instanciation des objets**. Ils permettent de **découpler le code utilisant des objets de la manière dont ces objets sont créés**.

## Les patrons du GoF

* [Singleton](Singleton.md) : garantir qu'une classe n'a **qu'une seule instance**, accessible depuis toute l'application
* [Prototype](Prototype.md) : **copier un objet sans connaître sa classe concrète**
* [Factory (Fabrique)](Factory.md) : **centraliser la création d'instances** en fonction d'un type (variantes : fabrique statique, *Factory Method*, *Abstract Factory*…)
* [Builder (Monteur)](Builder.md) : **construire un objet complexe par étapes**

## Compléments

* [Fluent Interface (Interface fluide)](FluentInterface.md) : **enchaîner des appels sur un même objet** de façon lisible
* [Couplage de Fluent Interface et Builder](FluentBuilder.md) : illustration de l'**utilisation conjointe** des deux patrons
