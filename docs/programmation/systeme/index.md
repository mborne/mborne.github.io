# Système et interfaçage

## Les concepts des systèmes d'exploitation

Le système d'exploitation (OS) assume plusieurs rôles. Il offre des éléments qui se retrouvent dans de nombreux langages de programmation :

* Un cadre pour la **construction d'application** :
    * [Les bibliothèques](bibliotheque.md)
    * Les **programmes** qui peuvent être vus comme des bibliothèques offrant un point d'entrée (la fameuse fonction `main`) pour le démarrage d'un processus.
    * Les **services** qui peuvent être vus comme des **programmes s'exécutant en tâche de fond**.
* Un cadre pour l'**exécution des applications** :
    * Les **processus** qui permettent l'exécution en parallèle de plusieurs programmes sur une même machine.
    * Les **threads** qui permettent plusieurs exécutions en parallèle au sein d'un même processus.
* Un cadre pour la **communication avec le matériel** :
    * Les **bibliothèques systèmes**
    * Les pilotes matériels
* Un cadre pour la **communication entre les applications** :
    * Les **fichiers**
    * Les **pipes**
    * Les **sockets**
* Un cadre pour la **gestion des droits**

## L'interfaçage entre les langages

* [L'interfaçage entre les langages de programmation](interfacage.md)
* [La signature des fonctions](signature-fonction.md)
