# Les variables immuables

!!! warning "En construction"

    Notes personnelles à relire et compléter pour servir de support pour les cours.

Une variable est dite immuable si elle ne peut pas être modifiée après son initialisation.

## Intérêt

* Il est **inutile de copier des variables immuables** pour se protéger contre des modifications dans d'autres parties du programme.
* Il n'y a **pas de risque lié aux accès concurrents** en cas de parallélisation des traitements.

## En pratique

Nous trouverons des variantes en fonction des langages de programmation :

* En Rust, toutes les variables sont immuables par défaut (il faut utiliser le mot clé `mut` dans le cas contraire)
* En C++, les variables peuvent être déclarées `const` auquel cas la valeur ne peut être modifiée.
* En Java, les classes permettant uniquement l'accès en lecture aux données sont immuables. Le mot clé `final` permet de déclarer des variables qui ne peuvent être réassignées (mais il est possible d'en modifier le contenu).
* En JS, le mot clé `const` joue le même rôle que le mot clé `final` en Java (il est possible d'en modifier le contenu).
* ...
