---
tags:
- NVIDIA
- CUDA
- GPU
- Docker
---

# NVIDIA® CUDA® Toolkit

## Installation avec WSL

* [Installer le driver CUDA Toolkit sur la machine Windows](https://docs.nvidia.com/cuda/wsl-user-guide/index.html#step-1-install-nvidia-driver-for-gpu-support) (il ne faut pas l'installer dans la VM Ubuntu)
* [cuda-toolkit/install-wsl.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/cuda-toolkit/install-wsl.sh) traite les étapes suivantes **en contexte WSL** :

```bash
curl -sSL https://mborne.github.io/outils/cuda-toolkit/install-wsl.sh | bash
```

## Utilisation avec docker

[cuda-toolkit/install-container-toolkit.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/cuda-toolkit/install-container-toolkit.sh) ajoute **le support GPU** à [Docker](../docker/README.md) en installant [nvidia-container-toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html) avec un redémarrage et un test de bon fonctionnement :

```bash
curl -sSL https://mborne.github.io/outils/cuda-toolkit/install-container-toolkit.sh | bash
```

## Tester l'installation

Vous pouvez rejouer le test du script précédent :

```bash
sudo docker run --gpus all nvcr.io/nvidia/k8s/cuda-sample:nbody nbody -gpu -benchmark
```

## Ressources

* [docs.nvidia.com - NVIDIA CUDA](https://docs.nvidia.com/cuda/doc/index.html)
* [developer.nvidia.com - CUDA Toolkit Downloads](https://developer.nvidia.com/cuda-downloads)
* [docs.nvidia.com - CUDA on WSL User Guide](https://docs.nvidia.com/cuda/wsl-user-guide/index.html)
* [docs.nvidia.com - Getting Started with CUDA on WSL 2](https://docs.nvidia.com/cuda/wsl-user-guide/index.html#getting-started-with-cuda-on-wsl-2)
