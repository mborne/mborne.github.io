# Injection de dépendances

> 🤖 Rédaction assistée par IA.

## Problème

Une classe a besoin d'autres objets (ses **dépendances**) pour fonctionner. Si elle les **crée elle-même** (`new`) ou les **récupère par un accès statique** (`getInstance()`), alors :

* Ces **dépendances sont cachées** : elles n'apparaissent pas dans la signature de la classe
* Elles sont **difficiles à remplacer** (ex : par un objet factice dans les tests, par une autre implémentation selon la configuration)
* La classe est **fortement couplée** à une implémentation concrète

## Cas d'école

Reprenons la `Sequence` présentée dans la fiche [Singleton](../creation/Singleton.md). Un service de création d'utilisateurs s'en sert pour attribuer des identifiants uniques :

```ts
class UserService {
    createUser(name: string): User {
        const id = Sequence.getInstance().next();
        return new User(id, name);
    }
}
```

**Il est impossible de tester `UserService` avec un identifiant prévisible** : l'état de la `Sequence` est partagé par toute l'application (et donc par tous les tests).

## Solution

Le principe consiste à **fournir à la classe ses dépendances au lieu de la laisser les obtenir elle-même** :

* Les **dépendances sont passées par le constructeur** (elles deviennent explicites)
* La classe **dépend d'une abstraction** (interface) plutôt que d'une implémentation concrète (voir le principe d'inversion des dépendances, le "D" de [SOLID](https://fr.wikipedia.org/wiki/SOLID_(informatique)))
* Les **objets sont assemblés à un seul endroit**, au démarrage de l'application

On parle d'**inversion de contrôle (IoC)** : ce n'est plus la classe qui contrôle la création de ses dépendances.

## Exemple d'implémentation

Nous définissons une abstraction pour la génération d'identifiants et la `Sequence` l'implémente (avec un constructeur **public**, ce n'est plus un singleton) :

```ts
interface IdGenerator {
    next(): number;
}

class Sequence implements IdGenerator {
    private _current = 0;

    next(): number {
        return this._current++;
    }
}
```

`UserService` reçoit son générateur par le constructeur :

```ts
class UserService {
    constructor(private idGenerator: IdGenerator) {}

    createUser(name: string): User {
        return new User(this.idGenerator.next(), name);
    }
}
```

Au démarrage de l'application, **une seule instance** de `Sequence` est créée puis **transmise aux classes qui en ont besoin** :

```ts
// main.ts - assemblage des objets (composition root)
const sequence = new Sequence();
const userService = new UserService(sequence);
const groupService = new GroupService(sequence);
```

Dans les tests, il devient trivial d'injecter un générateur factice :

```ts
class FakeIdGenerator implements IdGenerator {
    next(): number {
        return 42;
    }
}

const userService = new UserService(new FakeIdGenerator());
const user = userService.createUser("john");
// user.id vaut 42
```

## Conteneurs IoC et portée *singleton*

Lorsque le nombre de classes augmente, l'assemblage manuel devient fastidieux. Les frameworks proposent un **conteneur IoC** qui **construit les objets et injecte automatiquement leurs dépendances**.

Par défaut, ces conteneurs créent **une seule instance par service** (portée *singleton*). Nous obtenons ainsi l'**unicité de l'instance sans accès statique** :

* Avec [Angular](https://angular.dev/guide/di) :

```ts
@Injectable({ providedIn: 'root' })
export class Sequence {
    // ...
}

@Injectable({ providedIn: 'root' })
export class UserService {
    private sequence = inject(Sequence);
    // ...
}
```

* Avec [Symfony](https://symfony.com/doc/current/service_container.html), les services sont **partagés par défaut** et l'*autowiring* injecte les dépendances en s'appuyant sur le type des paramètres du constructeur :

```php
class UserService
{
    public function __construct(private IdGenerator $idGenerator) {}
}
```

* Avec [Spring](https://docs.spring.io/spring-framework/reference/core/beans.html), les composants (`@Component`, `@Service`...) ont la portée `singleton` par défaut :

```java
@Service
public class UserService {
    private final IdGenerator idGenerator;

    public UserService(IdGenerator idGenerator) {
        this.idGenerator = idGenerator;
    }
}
```

## Mises en garde

* Il convient de **privilégier l'injection par le constructeur** (plutôt que par mutateur ou attribut) : l'objet est complet dès sa création et ses dépendances sont visibles
* Un **constructeur avec un grand nombre de dépendances** est le signe d'une classe qui a **trop de responsabilités**
* Le conteneur ne doit pas être utilisé comme un **[service locator](https://en.wikipedia.org/wiki/Service_locator_pattern)** : récupérer le conteneur dans le code métier pour y chercher ses dépendances revient à **réintroduire des dépendances cachées**
* L'injection de dépendances n'impose pas l'utilisation d'un framework : un **assemblage manuel au démarrage** suffit pour une petite application

## Liens utiles

* [fr.wikipedia.org - Injection de dépendances](https://fr.wikipedia.org/wiki/Injection_de_d%C3%A9pendances)
* [fr.wikipedia.org - Inversion de contrôle](https://fr.wikipedia.org/wiki/Inversion_de_contr%C3%B4le)
* [martinfowler.com - Inversion of Control Containers and the Dependency Injection pattern](https://martinfowler.com/articles/injection.html)
* [angular.dev - Dependency injection in Angular](https://angular.dev/guide/di)
* [symfony.com - The DependencyInjection Component](https://symfony.com/doc/current/components/dependency_injection.html)
* [docs.spring.io - The IoC Container](https://docs.spring.io/spring-framework/reference/core/beans.html)
