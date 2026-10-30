# Les spécificités des langages

> 🤖 Rédaction assistée par IA.

Cette fiche est une annexe venant compléter la présentation [mborne.github.io/cours-patron-conception - Les patrons de conception](https://mborne.github.io/cours-patron-conception). Elle vise à guider dans l'**adaptation des patrons de conception en fonction du langage utilisé**.

En effet, si les concepts de base de la P.O.O. (classe, interface, encapsulation, héritage...) ont progressivement été intégrés dans la plupart des langages (ex : PHP 5 en 2004[^php5], TypeScript en 2012[^ts], ECMAScript 6 en 2015[^es6]...), **chaque langage a des spécificités qui devront être prises en compte et exploitées dans la conception**.

Nous noterons aussi que **les langages ont évolué depuis la parution du [GoF](../references/index.md) en 1994** dont les exemples sont en C++ et en Smalltalk. Certains patrons sont désormais intégrés aux langages, simplifiés, voire rendus inutiles par l'arrivée de nouveaux concepts (*generics*, lambdas, générateurs...).

## Typage statique ou typage dynamique

Quel que soit le langage de programmation utilisé, une valeur aura toujours un **type**. Ceci permettra par exemple d'avoir comme résultat :

* `5` pour l'addition de deux nombres `2+3`
* `"23"` pour la concaténation de deux chaînes de caractères `"2"+"3"`

Nous distinguerons toutefois les langages en fonction du **moment où les types sont vérifiés** :

* Avec un **typage statique**, le **type des variables est connu et vérifié à la compilation** (Java, C#, C++, Go, Rust, TypeScript...)[^inference].
* Avec un **typage dynamique**, le **type est porté par la valeur et vérifié à l'exécution**. Une même variable peut successivement contenir des valeurs de types différents (Python, JavaScript, PHP, Ruby...)[^graduel].

!!! info "Impact"

    **Certains patrons de conception sont moins pertinents avec un typage dynamique** car le langage offre nativement ce qu'ils permettent de construire :

    * Le ***duck typing***[^duck] permet de manipuler des objets n'ayant pas d'interface commune déclarée : les interfaces des patrons sont alors implicites.
    * Le type étant connu à l'exécution, un [Visitor](../comportement/Visitor.md) peut appeler la méthode correspondant au type de l'objet sans passer par une méthode `accept` (ex : [ast.NodeVisitor](https://docs.python.org/3/library/ast.html#ast.NodeVisitor) en Python appelle `visit_<NomDeClasse>`).
    * Les classes étant des valeurs (Python, JavaScript, PHP), une classe peut être passée en paramètre et jouer le rôle de [Factory](../creation/Factory.md).

    En contrepartie, un typage statique permet de **détecter à la compilation** le non-respect des contrats définis par les patrons.

## La signature des méthodes

En fonction des langages, une méthode sera identifiée :

* Par sa **signature**, c'est-à-dire **son nom et le type de ses paramètres** (Java, C#, C++). Plusieurs méthodes peuvent alors porter le même nom (surcharge ou *overloading*).
* Par **son seul nom** (Python, JavaScript, PHP, mais aussi Go), ce qui impose l'**unicité du nom des fonctions et méthodes**. TypeScript permet de déclarer plusieurs signatures, mais avec une seule implémentation.

!!! info "Impact"

    Nous serons amenés à adapter la présentation de certains patrons de conception. Par exemple, le [patron Visitor](../comportement/Visitor.md) s'appuie en Java sur la surcharge (`visit(Point)`, `visit(LineString)`) alors qu'il faudra **des noms uniques** (`visitPoint`, `visitLineString`) dans les autres langages.

## La gestion de la mémoire

Les choix de conception se feront en fonction des mécanismes de **gestion de la mémoire** du langage utilisé :

* Un **ramasse-miettes** (*garbage collector*) libère automatiquement les objets qui ne sont plus accessibles (Java, C#, Go, JavaScript, Python, PHP...).
* Le **comptage de références** libère un objet dès qu'il n'est plus référencé, mais ne sait pas libérer seul des **références circulaires** qu'il faudra casser avec des **références faibles** (ex : `std::shared_ptr` / `std::weak_ptr` en C++, `Rc` / `Weak` en Rust, ARC en Swift).
* La **libération manuelle** de la mémoire (ex : `malloc` / `free` en C, `new` / `delete` en C++) qu'il est possible d'automatiser en C++ avec des **pointeurs intelligents** et le principe [RAII](https://fr.wikipedia.org/wiki/Resource_acquisition_is_initialization).
* La notion de **propriétaire** d'une valeur et d'**emprunt** en [Rust](https://doc.rust-lang.org/book/ch04-00-understanding-ownership.html), vérifiée à la compilation.

En fonction des cas, nous serons **plus ou moins contraints sur les relations entre les objets** (ex : une relation bidirectionnelle parent / enfant est triviale avec un ramasse-miettes, demande une référence faible avec le comptage de références et une conception spécifique en Rust).

!!! info "Impact"

    Concevoir un moteur de jeu vidéo en UML sans se demander s'il sera implémenté en C++, en Java ou en JavaScript n'a pas de sens. Les contraintes ne sont pas les mêmes.

## La présence de concepts complémentaires

Certains langages offriront des **concepts complémentaires aux concepts de base de la P.O.O.** :

* Des **propriétés** et des **accesseurs "magiques"** permettant d'exécuter du code lors de l'accès à un attribut :
    * [Property en C#](https://learn.microsoft.com/fr-fr/dotnet/csharp/programming-guide/classes-and-structs/properties#properties-with-backing-fields)
    * [`@property`](https://docs.python.org/3/library/functions.html#property) et [`__getattr__`](https://docs.python.org/3/reference/datamodel.html#object.__getattr__) en Python
    * [`get` / `set`](https://developer.mozilla.org/fr/docs/Web/JavaScript/Reference/Functions/get) en JavaScript
    * `__get` / `__set` en PHP

    !!! info "Impact"

        Il n'est pas obligatoire (voire pas dans la culture) de définir des méthodes `getX()` / `setX()` dans certains langages : un attribut public pourra être transformé en propriété sans modifier le code appelant.

* Des **métadonnées** associées au code (annotations en Java, attributs en C# et en PHP >= 8.0...) pouvant être exploitées via des mécanismes d'**introspection** et de **réflexion**.

    !!! info "Impact"

        En Java, JUnit (`@Test`) et Spring (`@Autowired`) s'appuieront sur ces mécanismes alors que nous trouverons des mécanismes de **génération de code** pour obtenir des équivalents dans d'autres langages (ex : macros en C++ et Rust avec `#[derive(...)]`, [Qt Meta-Object Compiler](https://doc.qt.io/qt-6/moc.html),...)

## Les patrons intégrés

Certains patrons de conception sont **intégrés aux langages** :

* Le patron [Prototype](../creation/Prototype.md), qui traite la copie d'objets, peut être :
    * Présent par défaut (ex : [`copy.copy()` et `copy.deepcopy()`](https://docs.python.org/3/library/copy.html) en Python, méthode [`clone()`](https://docs.oracle.com/en/java/javase/21/docs/api/java.base/java/lang/Object.html#clone()) héritée de `Object` en Java)
    * À la base du langage (ex : [héritage par prototypes](https://developer.mozilla.org/fr/docs/Web/JavaScript/Inheritance_and_the_prototype_chain) en JavaScript)[^js-copie]
* Le patron [Iterator](../comportement/Iterator.md) est exploité par les boucles (ex : `Iterable` et `for (... : ...)` en Java, `__iter__` et `for ... in` en Python, `Symbol.iterator` et `for ... of` en JavaScript).

!!! info "Impact"

    Nous nous appuierons sur ces mécanismes plutôt que de réimplémenter ces patrons.

## La présence d'autres paradigmes

Dans de nombreux langages, nous noterons que la P.O.O. cohabitera avec d'**autres paradigmes** :

* La **programmation générique** (templates en C++, *generics* en Java, C#, TypeScript, Rust...) permettant d'écrire du code indépendant des types manipulés (ex : `List<T>`).
* La **programmation fonctionnelle** où les **fonctions sont des valeurs** pouvant être passées en paramètre (lambdas, *closures*) avec des traitements tels `.map`, `.filter`, `.reduce`,...
* Les **générateurs** (mot clé `yield` en Python, JavaScript, C#...) permettant de produire des valeurs à la demande.

Nous soulignerons que nous pourrons :

* **Hybrider la P.O.O. avec la programmation générique** (ex : une interface `Repository<T>`).
* **Simplifier certains patrons avec la programmation fonctionnelle** (ex : une lambda pourra remplacer une classe implémentant une [Strategy](../comportement/Strategy.md) ou un [Observer](../comportement/Observer.md) n'ayant qu'une méthode).
* Établir des **ponts entre la P.O.O. et la programmation fonctionnelle** à l'aide du [patron Iterator](../comportement/Iterator.md) (ex : `Iterable` et `Stream` en Java, générateurs en Python et JavaScript).

[^php5]: PHP 5 introduit un nouveau [modèle objet](https://www.php.net/manual/fr/language.oop5.php) avec la visibilité (`public`, `protected`, `private`), les interfaces et les classes abstraites.

[^ts]: [TypeScript](https://www.typescriptlang.org/docs/handbook/2/classes.html) ajoute à JavaScript les interfaces, la visibilité et les classes abstraites.

[^es6]: ECMAScript 6 (ES2015) introduit la syntaxe [`class`](https://developer.mozilla.org/fr/docs/Web/JavaScript/Reference/Classes) en JavaScript, qui repose toujours sur l'héritage par prototypes.

[^inference]: Le type n'a pas forcément à être écrit grâce à l'**inférence de type** (ex : `let x = 5;` en Rust, `var` en Java, `auto` en C++).

[^graduel]: Un nombre croissant de langages à typage dynamique **permettent de déclarer des types** (typage graduel) :

    * En PHP, les [déclarations de type](https://www.php.net/manual/fr/language.types.declarations.php) sont **contrôlées à l'exécution**.
    * En Python, les [annotations de type](https://docs.python.org/3/library/typing.html) (Python >= 3.5) ne sont **pas contrôlées à l'exécution** mais exploitées par des **outils d'analyse statique** (ex : [mypy](https://mypy.readthedocs.io/)) et par les éditeurs.
    * [TypeScript](https://www.typescriptlang.org/) ajoute un typage statique à JavaScript : les types sont vérifiés à la compilation puis **effacés** dans le code JavaScript produit.

[^duck]: Le *duck typing* (« si ça marche comme un canard et que ça cancane comme un canard, alors c'est un canard ») consiste à **s'appuyer sur les méthodes disponibles plutôt que sur le type déclaré** d'un objet. Par exemple, en Python, une fonction `render(geometry)` appelant `geometry.draw()` acceptera aussi bien un `Point` qu'une `LineString` du moment qu'ils ont une méthode `draw()`, sans qu'ils implémentent une interface commune.

[^js-copie]: En JavaScript, [`Object.create(prototype)`](https://developer.mozilla.org/fr/docs/Web/JavaScript/Reference/Global_Objects/Object/create) crée un objet à partir d'un autre et [`structuredClone()`](https://developer.mozilla.org/fr/docs/Web/API/Window/structuredClone) réalise une copie profonde des données (sans conserver la classe).
