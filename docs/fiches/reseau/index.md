# Le réseau

!!!warning "En construction"
    Je révise et creuse pour mieux comprendre la virtualisation des réseaux avec Docker, Kubernetes et Proxmox.

## Les modèles

- [Le modèle OSI](https://fr.wikipedia.org/wiki/Mod%C3%A8le_OSI)
- [Le modèle TCP/IP](https://blog.stephane-robert.info/docs/reseaux/protocole-ip/#le-mod%C3%A8le-tcpip)

## Les principaux protocoles

- [Ethernet](ethernet/index.md) : Abstraction couche physique, transmission directe de trame (L2)
- IPv4 et IPv6 : Transmission de paquets avec routage
- [ARP (Address Resolution Protocol)](https://fr.wikipedia.org/wiki/Address_Resolution_Protocol) : Résolution adresse IP -> adresse MAC
- [DHCP (Dynamic Host Configuration Protocol)](https://fr.wikipedia.org/wiki/Dynamic_Host_Configuration_Protocol) : Adresse IP, masque de sous-réseau, passerelle, 
- [ICMP (Internet Control Message Protocol)](https://fr.wikipedia.org/wiki/Internet_Control_Message_Protocol) : ping, traceroute
- [UDP (User Datagram Protocol)](https://fr.wikipedia.org/wiki/User_Datagram_Protocol)
- [TCP (Transmission Control Protocol)](https://fr.wikipedia.org/wiki/Transmission_Control_Protocol)
- [TLS (Transport Layer Security)](https://fr.wikipedia.org/wiki/Transport_Layer_Security) : authentification du serveur, chiffrement des données, authentification du client (optionnelle)
- HTTP
- HTTPS
 
- [VLAN (Virtual Local Area Network)](https://www.fingerinthenet.com/vlan/) : segmentation logique du réseau au niveau Ethernet.
- [VXLAN](https://fr.wikipedia.org/wiki/Virtual_Extensible_LAN) : virtualisation du réseau par encapsulation Ethernet dans UDP (port 4789).

## Ressources

- https://laissus.developpez.com/tutoriels/cours-introduction-tcp-ip/
- [perso.liris.cnrs.fr - Karim Sehaba - Cours de Réseaux](https://perso.liris.cnrs.fr/karim.sehaba/Reseaux/CMs-Reseaux.pdf)
- ...

