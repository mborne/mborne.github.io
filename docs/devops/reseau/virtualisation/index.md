# La virtualisation des réseaux

## VLAN et VXLAN

- [VLAN (Virtual Local Area Network)](https://www.fingerinthenet.com/vlan/) : segmentation logique du réseau au niveau Ethernet.

???info "Utilisation de VLAN"

    - Les VLAN sont très utilisés en entreprise et en datacenter pour segmenter le réseau sur une même infrastructure physique.
    - On les retrouve aussi en homelab et en virtualisation (hyperviseurs, switches manageables, pare-feu) pour isoler les flux entre VM, services et environnements.
    - Dans Kubernetes, les VLAN sont plutôt utilisés au niveau de l'infrastructure sous-jacente ; l'isolation intra-cluster est généralement gérée par le CNI et les politiques réseau.

- [VXLAN](https://fr.wikipedia.org/wiki/Virtual_Extensible_LAN) : extension L2 sur un réseau L3 via encapsulation de trames Ethernet dans UDP (généralement sur le port 4789).

???info "Utilisation de VXLAN"

    - VXLAN est utilisé par le driver `overlay` de Docker Swarm.
    - VXLAN est utilisé par plusieurs CNI Kubernetes selon la configuration (ex. Flannel en backend VXLAN, Calico en mode VXLAN, Cilium en mode tunnel VXLAN ; Cilium peut aussi utiliser Geneve).

???warning "Pas de chiffrement sur VXLAN"

    - Le trafic VXLAN n'est pas chiffré nativement : à utiliser sur des réseaux de confiance (ou protégés), pas en exposition directe sur Internet.
    - Les [différents backends Flannel de K3S (wireguard-native, ipsec, etc.)](https://docs.k3s.io/networking/basic-network-options#flannel-options) illustrent des alternatives permettant d'ajouter du chiffrement.

## Impact de la virtualisation sur le MTU

- Chaque couche d'encapsulation (VLAN, VXLAN, Geneve, IPsec, WireGuard, etc.) ajoute des en-têtes et réduit la MTU utile.
- Si la MTU n'est pas cohérente de bout en bout, on observe des symptômes difficiles à diagnostiquer : timeouts, lenteurs, retransmissions TCP, échec partiel de certaines requêtes.
- Règle simple : identifier les couches d'encapsulation et retrancher leur surcoût pour obtenir la MTU utile de bout en bout.

???info "Cas d'école avec Docker"

    - Réseau bridge local (sans tunnel) : MTU souvent proche de 1500, selon l'hôte et l'infrastructure.
    - Réseau overlay (Docker Swarm) : encapsulation VXLAN, MTU utile souvent autour de 1450.
    - Si le réseau physique est déjà contraint (cloud, VPN, tunnel), la MTU overlay peut devoir être encore plus basse.
    - Bon réflexe : vérifier la MTU des interfaces Docker et ajuster la configuration réseau pour éviter la fragmentation.
