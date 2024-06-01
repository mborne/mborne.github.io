# docker

## Installation

Voir [docker/install.sh](docker/install.sh) :

```bash
# Installation
sudo bash docker/install.sh

# Test
sudo docker run --rm hello-world

# pour exécuter docker sans sudo
sudo adduser $USER docker
```

## Configuration du démon

Quelques options dans  `/etc/docker/daemon.json` :

```json
{
    "data-root": "/var/lib/docker",
    "storage-driver": "overlay2",

    "userns-remap": "default",

    "registry-mirrors": ["https://docker-mirror.quadtreeworld.net"],

    "dns": ["1.1.1.1", "1.0.0.1"],
    "bip": "192.168.100.1/24",
    "fixed-cidr": "192.168.100.1/29",
    "default-address-pools": [
        {"base":"172.80.0.0/16","size":24},
        {"base":"172.90.0.0/16","size":24}
    ],

    "icc": false,
    "live-restore": true,
    "userland-proxy": false,
    "no-new-privileges": true,

    "debug": false,

    "log-driver": "journald"
}
```

Pour appliquer :

```bash
sudo systemctl daemon-reload
sudo systemctl restart docker
```

## Voir aussi

* [github.com - docker/docker-bench-security](https://github.com/docker/docker-bench-security#docker-bench-for-security)
* [github.com - mborne/ansible-docker-ce](https://github.com/mborne/ansible-docker-ce) pour une alternative à [install.sh](install.sh)
