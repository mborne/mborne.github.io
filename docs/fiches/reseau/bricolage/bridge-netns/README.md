# Réseau - branchement d'un namespace sur un bridge via un veth

## Principe

- Création d'un bridge "br0" (`192.168.100.1/24`)
- Création d'un namespace réseau "ns-demo" (`192.168.100.2/24`)
- Branchement `br0 <-[v-demo-br] veth [v-demo-ns]-> ns-demo`
- Configuration du NAT pour accès internet

## Script

```bash
#----------------------------------------------------------------------
# création d'un bridge
#----------------------------------------------------------------------
sudo ip link add br0 type bridge
sudo ip addr add 192.168.100.1/24 dev br0

#----------------------------------------------------------------------
# configuration NAT (sortie du bridge)
#----------------------------------------------------------------------
sudo iptables -t nat -A POSTROUTING -s 192.168.100.0/24 -j MASQUERADE

#----------------------------------------------------------------------
# création d'un namespace réseau
#----------------------------------------------------------------------
sudo ip netns add ns-demo

#----------------------------------------------------------------------
# création veth pour branchement demo-ns <-> br0
#----------------------------------------------------------------------
sudo ip link add v-demo-br type veth peer name v-demo-ns

# branchement veth sur bridge
sudo ip link set v-demo-br master br0


sudo ip link set br0 up
sudo ip link set v-demo-br up

#----------------------------------------------------------------------
# configuration côté demo-ns
#----------------------------------------------------------------------

# branchement veth sur namespace
sudo ip link set v-demo-ns netns ns-demo

# configuration IP du namespace
sudo ip netns exec ns-demo ip addr add 192.168.100.2/24 dev v-demo-ns
sudo ip netns exec ns-demo ip link set v-demo-ns up
sudo ip netns exec ns-demo ip route add default via 192.168.100.1

# pour auto-ping
sudo ip netns exec ns-demo ip link set lo up

#----------------------------------------------------------------------
# test de connectivité
#----------------------------------------------------------------------

# test auto ping
sudo ip netns exec ns-demo ping -c 5 192.168.100.2
# test ping bridge
sudo ip netns exec ns-demo ping -c 5 192.168.100.1
# test ping internet
sudo ip netns exec ns-demo ping -c 5 google.fr

# démarrage pour debug :
# sudo ip netns exec ns-demo /bin/bash
```

## Optionnel

```bash
#----------------------------------------------------------------------
# configuration filtrage sur FORWARD
#----------------------------------------------------------------------
# sudo modprobe nf_conntrack
# sudo sh -c 'echo nf_conntrack > /etc/modules-lab./nf_conntrack.conf'

# sudo iptables -P FORWARD REJECT
# sudo iptables -A FORWARD -i br0 -o eth0 -j ACCEPT
# sudo iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
```

