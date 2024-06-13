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

### Cas HuggingFace

```bash
conda create --name huggingface python=3.12
conda activate huggingface

# https://pytorch.org/get-started/locally/
pip install torch[and-cuda]
python3 -c 'import torch; print("cuda available : ",torch.cuda.is_available())'

# https://www.tensorflow.org/install/pip?hl=fr#windows-wsl2
python3 -m pip install tensorflow[and-cuda]
python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
```


### Cas IGNF/validator

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

