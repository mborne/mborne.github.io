# DevOps - Les réseaux

!!!info "En construction"
    J'approfondis mes connaissances sur les réseaux en lisant [plusieurs ressources](#ressources) et avec [différentes expérimentations](bricolage/index.md) pour être plus à l'aise avec la virtualisation des réseaux avec des VM (QEMU/KVM, Proxmox, VirtualBox) et des conteneurs (Docker / Kubernetes).

## Les modèles

- [Le modèle OSI](https://fr.wikipedia.org/wiki/Mod%C3%A8le_OSI)
- [Le modèle TCP/IP](https://blog.stephane-robert.info/docs/reseaux/protocole-ip/#le-mod%C3%A8le-tcpip)

## Les principaux protocoles

- [Ethernet](ethernet/index.md) : Abstraction couche physique, transmission directe de trame (L2)
- [IPv4](https://fr.wikipedia.org/wiki/IPv4) et [IPv6](https://fr.wikipedia.org/wiki/IPv6) : Transmission de paquets avec routage
- [ARP (Address Resolution Protocol)](https://fr.wikipedia.org/wiki/Address_Resolution_Protocol) : Résolution adresse IP -> adresse MAC
- [DHCP (Dynamic Host Configuration Protocol)](https://fr.wikipedia.org/wiki/Dynamic_Host_Configuration_Protocol) : Adresse IP, masque de sous-réseau, passerelle, routage...
- [ICMP (Internet Control Message Protocol)](https://fr.wikipedia.org/wiki/Internet_Control_Message_Protocol) : ping, traceroute,...
- [UDP (User Datagram Protocol)](https://fr.wikipedia.org/wiki/User_Datagram_Protocol) : Transport non connecté, faible latence, sans garantie de livraison.
- [TCP (Transmission Control Protocol)](https://fr.wikipedia.org/wiki/Transmission_Control_Protocol) : Transport connecté, fiable, ordonné, avec contrôle de flux et retransmission.
- [TLS (Transport Layer Security)](https://fr.wikipedia.org/wiki/Transport_Layer_Security) : authentification du serveur, chiffrement des données, authentification du client (optionnelle)
- [HTTP](https://fr.wikipedia.org/wiki/Hypertext_Transfer_Protocol) : Protocole applicatif client/serveur pour échanger des ressources web.
- [HTTPS](https://fr.wikipedia.org/wiki/Hypertext_Transfer_Protocol_Secure) : HTTP sur TLS pour garantir confidentialité, intégrité et authentification du serveur.

## Virtualisation des réseaux

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

## Ressources

- [blog.stephane-robert.info - Formation Réseau pour DevOps, SRE et développeurs](https://blog.stephane-robert.info/docs/reseaux/)
- [developpez.com - François Laissus - Cours d'introduction à TCP/IP](https://laissus.developpez.com/tutoriels/cours-introduction-tcp-ip/)
- [perso.liris.cnrs.fr - Karim Sehaba - Cours de Réseaux](https://perso.liris.cnrs.fr/karim.sehaba/Reseaux/CMs-Reseaux.pdf)
