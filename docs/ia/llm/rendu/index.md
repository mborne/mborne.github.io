---
tags:
    - LLM
    - Rendu
---

# Les LLM - Techniques de rendu

!!!warning "IMPORTANT"
    L'affichage d'un tableau, d'un graphique ou d'une carte n'est pas du ressort du LLM mais de l'application!

## Le formatage markdown

De nombreux modèles produisent naturellement des réponses avec un [formatage markdown](https://www.markdownguide.org/cheat-sheet/).

Il suffit donc de convertir le texte en sortie du LLM au format markdown en HTML pour afficher des listes à puce, des liens, des tableaux,...

## La cartographie

Pour **afficher une carte**, il est **possible en première approche de générer une image (carte statique)**, par exemple en appelant un serveur WMS.

Pour aller plus loin, il est possible de s'appuyer sur des bibliothèques JavaScript telles OpenLayers ou Leaflet pour **afficher des données** ou **appliquer une symbologie** (le style pouvant être généré par un LLM).

La **mise en oeuvre d'interraction en langage naturel avec une carte (ex : zoom sur l'église) sera plus potentiellement complexe** car elle implique :

- La **création d'un grand nombre d'outils** (autant qu'il y a de contrôle sur une carte : zoom in/out, zoom sur un lieu, charger des données, gérer des styles,...)
- La **mise en oeuvre d'une communication entre le navigateur et un serveur** pour l'exécution des appels d'outils (si l'agent s'exécute côté serveur) [^1]

[^1]: Pour y voir plus clair, il faudra que je prenne un peu de temps pour expérimenter le développement d'un tool `get_user_current_position` permettant de redescendre côté serveur [la position obtenue à l'aide de l'API Geolocation du navigateur](https://www.w3schools.com/html/html5_geolocation.asp)

## Les SIG

Il est possible de mettre à disposition des outils permettant de communiquer avec un SIG tels QGIS (voir [QGISMCP - tools](https://github.com/jjsantos01/qgis_mcp#tools)).
