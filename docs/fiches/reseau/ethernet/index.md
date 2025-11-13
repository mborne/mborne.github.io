# Ethernet

> 🤖 Rédaction assistée par IA.

!!!warning "En construction"
    Cette fiche est en cours de rédaction. J'approfondis mes connaissances sur les réseaux pour être plus à l'aise avec la virtualisation des réseaux (Docker, Kubernetes, Proxmox).

**Ethernet** est le protocole dominant au niveau **couche 2 (liaison de données)**. Il fait abstraction sur le transfert physique (L1) et permet le contrôle d'intégrité de celui-ci.

## Points clés

- Ethernet assure la transmission de **[trames](#les-trames)** d'une **[adresse MAC](#les-adresses-mac) source** vers une **[adresse MAC](#les-adresses-mac) cible**.
- Pour les données, les trames sont porteuses d'un *EtherType* (0x0800 = IPv4, 0x0806 = ARP,..) et d'une *Payload*.
- Ethernet n'intègre **pas de mécanisme de routage** (la communication n'est possible qu'entre deux noeuds connectés à la même "interface").
- Ethernet intègre un mécanisme de somme de contrôle permettant de rejeter les **trames** subissant des modifications lors du transfert physique.

## Les adresses MAC

> Voir [fr.wikipedia.org - Adresse MAC](https://fr.wikipedia.org/wiki/Adresse_MAC)

- Les adresse MAC sont encodées sur 6 octets et généralement affichées en hexadécimal (ex : `5E:FF:56:A2:AF:15`).
- Les adresses MAC peuvent être universelles (attribuées par le constructeur) ou localement administrées (définies par l'utilisateur) auquel cas l'unicité globale n'est pas garantie (voir [génération d'une adresse MAC](#generation-dune-adresse-mac)).
- Pour les adresses MAC universelles :
    - Les 3 premiers octets sont affectés aux constructeurs (c.f. liste des [Organizationally Unique Identifier](https://standards-oui.ieee.org/oui/oui.txt))
    - Les 3 derniers octets correspondent à l'identifiant de l'interface réseau (Network Interface Controller)

## Les trames

La structure des trames est la suivante :

| Champ                       | Taille                 | Rôle                                                                                                                                                                                                                                                                        |
| --------------------------- | ---------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Préambule                   | 7 octets               | Synchronisation du récepteur                                                                                                                                                                                                                                                |
| SFD (Start Frame Delimiter) | 1 octet                | Indique le début de la trame (valeur : `10101011`)                                                                                                                                                                                                                          |
| **Adresse MAC destination** | 6 octets               | Identifie le destinataire                                                                                                                                                                                                                                                   |
| **Adresse MAC source**      | 6 octets               | Identifie l’émetteur                                                                                                                                                                                                                                                        |
| **EtherType / Longueur**    | 2 octets               | Type du protocole de couche supérieure (ex: [0x0800 pour IPv4, 0x0806 pour ARP, 0x86DD pour IPv6,...](https://fr.wikipedia.org/wiki/EtherType#EtherType_pour_quelques_protocoles_courants)) ou longueur des données (si valeur ≤ 1500, pour les anciens réseaux IEEE 802.3) |
| **Données (payload)**       | 46 à 1500 octets (MTU) | Contenu utile (données IP, ARP, etc.)                                                                                                                                                                                                                                       |
| FCS (Frame Check Sequence)  | 4 octets               | CRC pour la détection d’erreurs                                                                                                                                                                                                                                             |

!!!info "Remarques"
    - Préambule, SFD et FCS (Frame Check Sequence) sont gérés par le matériel et ne seront pas visibles dans les captures standards (Wireshark, tcpdump) : la plupart des cartes réseau retirent ces champs avant de passer les trames à la pile logicielle.
    - La valeur 1500 octets correspond à la taille maximale par défaut de la charge utile Ethernet (payload). Au niveau interface, la **MTU (Max Transmission Unit)** est généralement fixée à 1500 octets pour Ethernet : elle définit la taille maximale d'un paquet IP (en octets) transmis sans fragmentation et correspond, sur Ethernet standard, à la taille maximale du payload.
    - Ethernet impose aussi une taille minimale de trame (64 octets au total), d'où un payload minimal de 46 octets (les données sont alors complétées par du padding si nécessaire).
    - Certains équipements supportent des ["jumbo frames"](https://fr.wikipedia.org/wiki/Trame_g%C3%A9ante) (payload > 1500), souvent configurées autour de 9000 octets. Cette taille n'est pas normalisée et doit être prise en charge et configurée de bout en bout (NIC, commutateurs, OS). L'utilisation de jumbo frames sans compatibilité totale peut provoquer des problèmes d'interopérabilité et de fragmentation.

## Les modes de diffusion

Plusieurs modes de diffusion sont possibles :

- **unicast** : envoi à une adresse MAC précise 
- **broadcast** : envoi à tous les "voisins" avec adresse de destination = `FF:FF:FF:FF:FF:FF`
- [multicast](https://fr.wikipedia.org/wiki/Multicast) : envoi à un groupe spécifique d'adresses (utilisé par certains protocoles comme [IGMP](https://fr.wikipedia.org/wiki/Internet_Group_Management_Protocol) ou IPv6).

## Les équipements

Au niveau Ethernet, nous trouvons par exemple :

- Les **cartes réseaux** qui se voient affecter une adresse MAC avec les 3 premiers octets correspondant au constructeur. 
- Les **hubs** qui transmettent les trames à tous les nœuds connectés, ce qui peut entraîner des collisions (technologie obsolète).
- Les **switchs** qui optimisent les transmissions en mémorisant les adresses MAC des nœuds connectés à leurs ports, réduisant ainsi les collisions.

!!!info "Remarques"
    - Nous retrouverons ces équipements sous forme d'**interface réseau** au niveau de Linux (`ip link`) et Windows (`Get-NetAdapter`)
    - Nous trouverons des équivalents virtuels pour ces éléments. Par exemple, avec Linux un interface de type `tap` est équivalente à une carte réseau virtuelles et un `bridge` à un switch.
    - Les hubs qui génèraient des collisions sont obsolètes au profit des switchs.

## La sécurité des switchs

Une attaque courante consiste à envoyer des trames avec une **fausse adresse MAC source** (spoofing). Cela peut :

- Saturer la table d'adresses MAC du switch (attaque de type [MAC flooding](https://fr.wikipedia.org/wiki/Saturation_de_la_table_d%27apprentissage)), le forçant à se comporter comme un hub et à transmettre les trames à tous les ports.
- Rediriger des trames destinées à une autre machine vers l'attaquant (attaque de type *Man-in-the-Middle*).

## En pratique

### Capture des trames

Avec [tcpdump](https://www.tcpdump.org/), il est possible d'ajouter l'option `-e` pour afficher les adresses MAC et EtherType pour les trames capturées :

```bash
sudo tcpdump -i eth0 -e -n
```

### Génération d'une adresse MAC

Pour générer une adresse MAC (`xx:xx:xx:xx:xx:xx`), il faut **prendre en compte la signification des <u>2 premiers bits</u> du <u>premier octet</u>** (voir [fr.wikipedia.org - Adresse_MAC - Structure](https://fr.wikipedia.org/wiki/Adresse_MAC#Structure)) :

| Bit     | Nom | Signification                                                   |
| ------- | --- | --------------------------------------------------------------- |
| 0 (LSB) | I/G | **0 = unicast**, 1 = multicast                                  |
| 1       | U/L | 0 = universel (OUI constructeur), **1 = localement administré** |

Pour un usage local / unicast, nous pourrons donc utiliser par exemple :

| Préfixe (premier octet) | Binaire    | Exemple d’adresse   |
| ----------------------- | ---------- | ------------------- |
| `02`                    | `00000010` | `02:00:00:00:00:01` |
| `06`                    | `00000110` | `06:11:22:33:44:55` |
| `0A`                    | `00001010` | `0A:FF:EE:DD:CC:BB` |
| `0E`                    | `00001110` | `0E:00:00:12:34:56` |

Avec QEMU, nous trouverons l'utilisation fréquente du préfixe `52:54:00` ainsi que le script suivant dans la documentation :

```bash
mac_address="52:54:00:$(dd if=/dev/urandom bs=512 count=1 2>/dev/null \
                           | md5sum \
                           | sed -E 's/^(..)(..)(..).*$/\1:\2:\3/')"
echo $mac_address
```

> Source : https://guix.gnu.org/cookbook/fr/html_node/Pont-reseau-pour-QEMU.html#Invoquer-QEMU-avec-les-bonnes-options-de-la-ligne-de-commande

