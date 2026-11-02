# La programmation générique par restriction de type

!!! warning "En construction"

    Notes personnelles à relire et compléter pour servir de support pour les cours.

Dans certains langages offrant un mécanisme de typage dynamique, il est tout à fait possible de mettre à disposition des fonctions et des conteneurs supportant plusieurs types sans faire appel à la programmation générique.

Dans ces langages, la programmation générique permet principalement de **se protéger contre des erreurs à l'exécution** à l'aide de **paramètres de type** sur lesquels il est possible de **définir des contraintes**.

## Intérêt au niveau des structures de données

Avec la programmation générique, il est par exemple possible de spécifier qu'un traitement ne s'applique pas sur une **liste** mais sur **une liste d'utilisateurs** :

```java
void process(Logger logger, List<User> users){
    for ( User user : users ){
        logger.info("Traitement de {}...",user.getName());
        //...
    }
}
```

En l'absence de ce mécanisme, la fonction `process` ne peut pas être **protégée contre une erreur à l'exécution**.

On soulignera qu'il était par exemple nécessaire de *downcaster* de `Object` en `User` [avant l'introduction des *Generics* en Java](https://docs.oracle.com/javase/tutorial/extra/generics/intro.html) :

```java
void process(Logger logger, List users){
    for ( Object item : users ){
        User user = (User)item;
        logger.info("Traitement de {}...",user.getName());
        //...
    }
}
```

## Intérêt au niveau des algorithmes

Au niveau des algorithmes, la programmation générique permet principalement de :

* Spécifier les contraintes sur les types en entrée.
* Renvoyer une valeur avec un type fonction des paramètres en entrée.

En Java, la [méthode statique "min" de la classe Collections](https://www.geeksforgeeks.org/collections-min-method-in-java-with-examples/) est une bonne illustration :

```java
public static <T extends Object & Comparable<? super T>>
T min(Collection<? extends T> coll){
    //... algorithme du calcul du minimum
}
```

où :

* On prend en entrée une `Collection` avec un type générique `T`
* Ce type générique `T` doit être un `Object` qui implémente l'interface [Comparable](https://docs.oracle.com/javase/8/docs/api/java/lang/Comparable.html)
* Le résultat est de type `T`

En l'absence de ce mécanisme, il ne serait pas possible de faire mieux que l'interface suivante qui induirait un *downcast* du résultat au niveau du code appelant l'utilitaire :

```java
Object min(Collection items){
    // calcul du minimum avec downcast sur Comparable
}
```

## Ressources

* [www.typescriptlang.org - Generics](https://www.typescriptlang.org/docs/handbook/2/generics.html)
