
# KVM - Configuration de la résolution de nom

## Points clés

- libvirt intègre un serveur DNS (dnsmasq)
- Un domaine (ex : `lab.kvm`) peut être configuré au niveau des réseaux (ex : `<domain name='lab.kvm' localOnly='yes'/>`)
- Ce domaine est alors utilisé pour générer la configuration dnsmasq et fourni au niveau DHCP
- L'utilisation du domaine exposé au niveau DHCP est activé à l'aide de `use-domains: true` dans [kvm/create-ubuntu-server.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/kvm/create-ubuntu-server.sh) :

```yaml
version: 2
renderer: networkd
ethernets:
# NAT network interface (virbr0)
enp1s0:
    dhcp4: yes
    dhcp4-overrides:
        use-domains: true
```

## Principe

- Modifier la configuration réseau pour ajouter ce domain à l'aide de `sudo virsh net-edit default` :

```xml
<network>
  <name>default</name>
  <uuid>...</uuid>
  <forward mode='nat'/>
  <bridge name='virbr0' stp='on' delay='0'/>
  <!-- A AJOUTER :-->
  <domain name='lab.kvm' localOnly='yes'/>
  <dns>
    <forwarder addr='1.1.1.1'/>
  </dns>
  <ip address='192.168.122.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='192.168.122.2' end='192.168.122.254'/>
    </dhcp>
  </ip>
</network>
```

- Recharger cette configuration réseau :

```bash
sudo virsh net-destroy default
sudo virsh net-start default
sudo virsh net-autostart default
```

- Tester depuis l'hôte :

```bash
dig node-1.lab.kvm @192.168.122.1
```

- Tester depuis une VM :

```bash
host node-1.lab.kvm
host node-1
```