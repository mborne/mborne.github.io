---
tags:
    - Optimisation
    - Descente de gradient
    - Réseau de neurones
---

# L'optimisation

## Points clés

- L'optimisation consiste à **trouver les paramètres qui minimisent une fonction de coût** (ex : la somme des carrés des écarts entre un modèle et des observations).
- **Plusieurs méthodes sont possibles** en fonction du problème :
    - **Moindres carrés** : résolution directe pour un modèle linéaire (ex : `y = a.x + b`).
    - **Linéarisation itérative** : pour un modèle non linéaire (ex : cercle), le problème est linéarisé autour d'une estimation qui est affinée à chaque itération.
    - **Descente de gradient** : les paramètres sont corrigés pas à pas dans le sens opposé au gradient de la fonction de coût. Le gradient peut être calculé à la main (dérivées symboliques) ou par **différentiation automatique** (ex : *autograd* avec PyTorch).
    - **Réseau de neurones** : le modèle est un réseau dont les paramètres (poids) sont optimisés par descente de gradient (ex : Adam) sur des données d'entraînement, puis évalués sur des données de test.
- La descente de gradient introduit des **hyperparamètres** (taux d'apprentissage, nombre d'itérations, initialisation) dont dépend la convergence.
- [PyTorch](https://pytorch.org/) est principalement populaire pour :
    - Sa capacité à **basculer les calculs du CPU vers le GPU de manière transparente** (ex : `torch.set_default_device(device)`).
    - Son implémentation de la **différentiation automatique** (*autograd*).
    - Ses **briques prêtes à l'emploi** pour les réseaux de neurones : couches (`torch.nn`), fonctions de coût (ex : `BCELoss`) et optimiseurs (`torch.optim`, ex : Adam).
    - Une **API proche de numpy** (tenseurs) et une exécution pas à pas facile à déboguer.
    - Son **écosystème** (ex : [Hugging Face Transformers](../../outils/huggingface/index.md) s'appuie sur PyTorch).
- **L'entraînement d'un [LLM](../llm/index.md) repose sur ce même principe**, à une toute autre échelle (milliards de paramètres).

## Expérimentations

Le dépôt [mborne/numpy-experiments](https://github.com/mborne/numpy-experiments#readme) (Python, Jupyter notebooks avec numpy, matplotlib et PyTorch) illustre ces méthodes :

| Notebook | Problème | Méthode |
| -------- | -------- | ------- |
| [01-noisy-line](https://github.com/mborne/numpy-experiments/blob/master/01-noisy-line.ipynb) | Estimer une droite à partir de points bruités | Moindres carrés (`numpy.linalg.lstsq`) |
| [02-noisy-circle](https://github.com/mborne/numpy-experiments/blob/master/02-noisy-circle.ipynb) | Estimer un cercle à partir de points bruités | Linéarisation itérative + moindres carrés |
| [03-noisy-circle-gradient](https://github.com/mborne/numpy-experiments/blob/master/03-noisy-circle-gradient.ipynb) | Idem | Descente de gradient (dérivées symboliques) |
| [04-noisy-circle-autograd](https://github.com/mborne/numpy-experiments/blob/master/04-noisy-circle-autograd.ipynb) | Idem | Descente de gradient (*autograd* PyTorch) |
| [nn-two-classes-linear](https://github.com/mborne/numpy-experiments/blob/master/binary-classification/nn-two-classes-linear.ipynb) | Classer des points en deux classes séparables par une droite | Réseau de neurones à une couche |
| [nn-two-classes-non-linear](https://github.com/mborne/numpy-experiments/blob/master/binary-classification/nn-two-classes-non-linear.ipynb) | Classer des points en deux classes concentriques | Réseau de neurones avec une couche cachée (ReLU) |

## Ressources

* [docs.pytorch.org - Learning PyTorch with Examples](https://docs.pytorch.org/tutorials/beginner/pytorch_with_examples.html)
