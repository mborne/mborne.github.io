# netplan

## Utilisation

* Configuration IP statique avec route par défaut sur une passerelle :

```yaml
network:
  version: 2
  ethernets:
    enp0s2:
      dhcp4: false
      dhcp6: false
      nameservers:
        addresses: [1.1.1.1,8.8.8.8]
      addresses:
        - 192.168.70.11/24
      routes:
        - to: default
          via: 192.168.14.1
```
