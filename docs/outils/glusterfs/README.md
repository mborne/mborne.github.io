# GlusterFS

Quelques notes sur un test de GlusterFS.

## Pré-requis

* Disque dédié (ici, test [vagrantbox](https://github.com/mborne/vagrantbox) avec `/dev/sdc` ajouté)

## Format and mount

```bash
blkid --match-token TYPE=xfs /dev/sdc || mkfs.xfs -i size=512 /dev/sdc
mkdir -p /data/brick1
echo '/dev/sdc /data/brick1 xfs defaults 1 2' >> /etc/fstab
mount -a && mount
```

## Setup GlusterFS

```bash
sudo apt-get update
sudo apt-get install -y glusterfs-server
sudo systemctl enable glusterd
sudo systemctl start glusterd
```

```bash
gluster peer probe vagrantbox-2
gluster peer probe vagrantbox-3
```

```bash
gluster volume create gv0 replica 3 vagrantbox-1:/data/brick1/gv0 vagrantbox-2:/data/brick1/gv0 vagrantbox-3:/data/brick1/gv0
gluster volume start gv0
```

## Resources

* <https://docs.gluster.org/en/main/Quick-Start-Guide/Quickstart/>
