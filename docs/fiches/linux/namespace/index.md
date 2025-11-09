# Les namespaces Linux

Les namespaces permettent d'isoler des aspects du système (réseau, système de fichier,...) pour créer des environnements indépendants. Ils sont à la base des conteneurs (Docker, LXC, etc.).

## Les différents types

| Type                                 | Isolation principale                            |
| ------------------------------------ | ----------------------------------------------- |
| **mnt** (Mount)                      | Arborescence des systèmes de fichiers           |
| **pid** (Process)                    | Espace des PIDs (processus visibles)            |
| **net** (Network)                    | Interfaces réseau, routes, sockets              |
| **ipc** (Interprocess Communication) | Files de messages, sémaphores, shm              |
| **uts** (Unix Timesharing System)    | Nom d’hôte et domaine NIS                       |
| **user**                             | Identités et permissions (UID/GID mapping)      |
| **cgroup**                           | Hiérarchie des groupes de contrôle (ressources) |
| **time**                             | Horloge système et offsets de temps             |

## Principales commandes

* [unshare](https://manpages.ubuntu.com/manpages/resolute/en/man1/unshare.1.html) : démarrer un programme dans un nouveau namespace
* [lsns](https://manpages.ubuntu.com/manpages/noble/en/man8/lsns.8.html) : lister les namespaces
* [ip netns](https://manpages.ubuntu.com/manpages/trusty//man8/ip-netns.8.html) : gérer les namespaces réseaux
* [nsenter](https://manpages.ubuntu.com/manpages/noble/en/man1/nsenter.1.html) : démarrer un programme dans un namespace existant


## Docker et les namespace Linux

L'exemple suivant adapté à partir de celui de [blog.stephane-robert.info - Introduction aux namespaces Linux](https://blog.stephane-robert.info/docs/admin-serveurs/linux/namespaces/) illustre l'utilisation des namespaces Linux par Docker :

```bash
# démarrer un conteneur
sudo docker run -d --rm --name=busybox busybox:latest sleep 600
# récupérer le PID du processus correspondant au conteneur 
CONTAINER_PID=$(sudo docker inspect busybox -f json | jq '.[].State.Pid')
# afficher les namespaces correspondant
sudo lsns -p $CONTAINER_PID
# entrer dans le conteneur façon "docker exec" :
sudo nsenter --target $CONTAINER_PID --mount --uts --ipc --pid --net --cgroup sh
```

## Ressources

* [blog.stephane-robert.info - Introduction aux namespaces Linux](https://blog.stephane-robert.info/docs/admin-serveurs/linux/namespaces/)
* [dev.to - Bridging 2 VEth Devices within Namespaces](https://dev.to/stanleyogada/demystifying-linux-network-bridging-and-network-namespaces-19ap)
