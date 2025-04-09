
# Dagster

[Dagster](https://docs.dagster.io/) est un orchestrateur de données conçu pour les ingénieurs de données.

## Installation

Avec conda :

```bash
# création d'un environnement
conda create --name dagster python=3.12
# activation d'un environnement
conda activate dagster
# installation de Dagster
pip install dagster dagster-webserver

# bonus :

# installation de pandas
pip install pandas

# installation de ogr2ogr dans l'environnement
conda install gdal
```

## Premier exemple

Voir [exemple/bdpr-download/assets.py](exemple/bdpr-download/assets.py) :

```bash
cd exemple/bdpr-download
dagster dev -f assets.py
```

## Ressources

* [docs.dagster.io - installation](https://docs.dagster.io/getting-started/installation)
