# conda

## Installation

```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh -p $HOME/miniconda3
```

(c.f. https://doc.ubuntu-fr.org/miniconda#miniconda et https://docs.conda.io/en/latest/miniconda.html )

Pour ne pas activer l'environnement `(base)` par défaut :

```bash
conda config --set auto_activate_base false
```

## Utilisation des environnements

```bash
# création d'un environnement
conda create --name ignf-validator
# activation d'un environnement
conda activate ignf-validator
# installation du package gdal dans l'environnement
conda install gdal
```

```bash
# activation de l'environnement
conda activate ignf-validator
# utilisation...
ogr2ogr --version
# désactivation de l'environnement
conda deactivate
```
