---
tags:
    - LLM
    - Principe de fonctionnement
---

# Les LLM - Principe de fonctionnement

Un LLM est réseau de neurone de type [Transformeur](https://fr.wikipedia.org/wiki/Transformeur) avec en entrée et en sortie un texte (il en existe d'autres types, par exemple pour convertir un texte en une image).

Sans aller dans les détails, il convient de noter que :

- Les réseaux de neurones travaillent avec des nombres.
- Le texte en entrée est donc transformé en une suite de nombres (*token*) [^1] et l'opération inverse est appliquée sur la sortie.
- La taille du modèle est liée au nombre de paramètres du réseau de neurone.
- En général [^2], plus le modèle est gros, plus il est puissant.

[^1]: Ne pas confondre avec la notion d'*embedding* (i.e. conversion d'un texte en vecteur sémantique)
[^2]: En réalité, il y a plusieurs architecture de modèles (modèles denses, modèles creux, *Mixture-of-Experts*,...) et ça n'est pas toujours vrai.
