# Conda

[Conda](https://docs.conda.io/projects/conda/en/latest/user-guide/getting-started.html) est un gestionnaire de paquet système et un gestionnaire d'environnement multi-OS (Windows, macOS et Linux).

## Installation

!!!warning "Mise en garde"
    - Il existe [plusieurs distributions (anaconda, miniconda, miniforge, micromamba)](https://mivegec.pages.ird.fr/dainat/malbec-fix-conda-licensing-issues/en/pages/conda-distrib/) et [plusieurs canaux](https://mivegec.pages.ird.fr/dainat/malbec-fix-conda-licensing-issues/en/pages/conda-channels/)
    - Un changement de licence en 2024 induit le paiement d'une licence dans certaines condititions pour certaines distributions et certains canaux (c.f. [mivegec.pages.ird.fr - Avoiding the Pitfalls of the Anaconda License](https://mivegec.pages.ird.fr/dainat/malbec-fix-conda-licensing-issues/en/))

* [conda-forge.org - Miniforge](https://conda-forge.org/download/)
* [github.com - conda-forge/miniforge - As part of a CI pipeline](https://github.com/conda-forge/miniforge#as-part-of-a-ci-pipeline) :

```bash
curl -sSL https://mborne.github.io/outils/conda/install-miniforge.sh | bash
```


## Utilisation

### Cas mkdocs

```bash
conda create --name mkdocs -c conda-forge python=3.12
conda activate mkdocs
pip install mkdocs-material
pip install mkdocs-git-revision-date-localized-plugin

# utilisation de mkdocs
git clone https://github.com/mborne/mborne.github.io
cd mborne.github.io
mkdocs serve
```

### Cas GDAL

```bash
# création d'un environnement
conda create --name gdal
# activation d'un environnement
conda activate gdal
# installation du package gdal dans l'environnement
conda install gdal=3.10.3

# utilisation de GDAL...
ogr2ogr --version

# désactivation de l'environnement
conda deactivate
```

### Cas Pytorch avec CUDA

!!!info "Pré-requis :"
    [NVIDIA® CUDA® Toolkit](../cuda-toolkit/README.md)

```bash
conda create --name torch  -c conda-forge python=3.12
conda activate torch

# https://pytorch.org/get-started/locally/
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu128

# tester l'installation de CUDA
python -c "import torch; print('cuda available : ',torch.cuda.is_available())"
```

## Quelques commandes complémentaires

```bash
# Contrôle de la configuration (ex : channel conda-forge présent, defaults absent)
conda config --show channels

# Lister les environnements
conda env list

# Supprimer un environnement
conda env remove --name ENV_NAME
```

## Ressources

* [conda-forge.org](https://conda-forge.org/)
    * [conda-forge.org - download](https://conda-forge.org/download/)
    * [conda-forge.org - packages](https://conda-forge.org/packages/)
* [mivegec.pages.ird.fr - Avoiding the Pitfalls of the Anaconda License](https://mivegec.pages.ird.fr/dainat/malbec-fix-conda-licensing-issues/en/)
