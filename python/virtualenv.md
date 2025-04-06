# virtualenv

[virtualenv](https://virtualenv.pypa.io/en/latest/index.html) est un outil permettant de créer des environements Python isolé.

## Installation

```bash
sudo apt-get install python3-virtualenv
```

## Utilisation

Par exemple, pour installer [jupyter](https://jupyter.org/) :

```bash
# création d'un environnement virtuel
python -m venv ~/jupyter-venv
# activation de l'environnement virtuel
source ~/jupyter-venv/bin/activate

# installation de jupyter dans l'environnement virtuel
pip install jupyter

# démarrage notebook (ouvrir l'URL qui s'affiche)
jupyter-notebook python/examples/jupyter-helloworld/

# désactivation de l'environnement virtuel
deactivate
```

## Ressources

* [gist.github.com - mborne - Ansible dans un environnement virtuel Python](https://gist.github.com/mborne/eeb3a0177fe27f5ed393a00eded0a86f)
