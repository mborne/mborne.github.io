# Les protocoles réseau

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

Voir aussi :

- [La résolution de nom de domaine (DNS)](dns/index.md)
