# Ethernet

!!!warning "En construction"
    Je révise et creuse pour mieux comprendre la virtualisation des réseaux avec Docker, Kubernetes et Proxmox.

**Ethernet** est le protocole dominant au niveau **couche 2 (liaison de données)** faisant abstraction sur le transfert physique (L1).

## Points clés

- Ethernet utilise des [adresse MAC](https://fr.wikipedia.org/wiki/Adresse_MAC) de 6 octets (ex : `5E:FF:56:A2:AF:15`) pour l'adressage.
- Les adresses MAC des cartes réseaux sont globalement uniques [^1] :
    - Les 3 premiers octets sont affectés aux constructeurs (c.f. liste des [Organizationally Unique Identifier](https://standards-oui.ieee.org/oui/oui.txt))
    - Les 3 derniers octets correspondent à l'identifiant de l'interface réseau (Network Interface Controller)
- Ethernet assure la transmission de **trames** d'un **adresse MAC source** vers une **adresse MAC cible**.
- Pour les données, les trames sont porteuses d'un *EtherType* (0x0800 = IPv4, 0x0806 = ARP,..) et d'une *Payload* 
- Ethernet n'intègre **pas de mécanisme de routage** (la communication n'est possible qu'entre deux noeuds connectés à la même "interface").
- Ethernet intègre un mécanisme de somme de contrôle permettant de rejeter les **trames** subissant des modifications lors du transfert physique.

[^1]: Il sera en réalité possible et nécessaire de [générer des adresses pour des interfaces virtuelles](#generation-dune-adresse-mac).

## Structure des trames

> 🤖 Rédaction assistée par IA.

| Champ                         | Taille           | Rôle                                                                                                                                                                                                                |
| ----------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Préambule                     | 7 octets         | Synchronisation du récepteur                                                                                                                                                                                        |
| SFD (Start Frame Delimiter)   | 1 octet          | Indique le début de la trame (valeur : `10101011`)                                                                                                                                                                  |
| **Adresse MAC destination**   | 6 octets         | Identifie le destinataire                                                                                                                                                                                           |
| **Adresse MAC source**        | 6 octets         | Identifie l’émetteur                                                                                                                                                                                                |
| **EtherType / Longueur** [^2] | 2 octets         | Type du protocole de couche supérieure (ex: [0x0800 pour IPv4, 0x0806 pour ARP, 0x86DD pour IPv6,...](https://fr.wikipedia.org/wiki/EtherType#EtherType_pour_quelques_protocoles_courants)) ou longueur des données |
| **Données (payload)**         | 46 à 1500 octets | Contenu utile (données IP, ARP, etc.)                                                                                                                                                                               |
| FCS (Frame Check Sequence)    | 4 octets         | CRC pour la détection d’erreurs                                                                                                                                                                                     |

> Préambule, SFD et FCS (Frame Check Sequence) sont gérés par le matériel et ne seront pas visible dans la capture des trames.

[^2]: Si valeur <= 1500, alors ce serait une longueur (cas théorique correspondant aux anciens réseaux).

## Structure des adresses MAC

- **unicast** : envoi à une adresse MAC précise 
- **broadcast** : envoi à tous les "voisins" avec adresse de destination = `FF:FF:FF:FF:FF:FF`
- multicast : envoi à plusieurs adresses est aussi possible.

## Les équipements

Au niveau Ethernet, nous trouvons par exemple :

- Les **cartes réseaux** se voient affecter une adresse MAC avec les 3 premiers octets correspondant au constructeur. 
- Les **hubs** qui assurent la transmission des trames à tous les noeuds connectés (quelque soit l'adresse de destination) - **à éviter**.
- Les **switch** qui optimisent ces envois en mémorisant les adresses MAC des noeuds connectées aux différents ports par inspection de l'adresse source des paquets entrants.

!!!info "Remarques"
    - Nous les retrouverons sous forme d'**interface réseau** au niveau de Linux (`ip link`) et Windows (`Get-NetAdapter`)
    - Nous trouverons des équivalents virtuels pour ces éléments. Par exemple, avec Linux un interface de type `tap` est équivalente à une carte réseau virtuelles et un `bridge` à un switch.

## En pratique

### Capture des trames

Avec [tcpdump](https://www.tcpdump.org/), il est possible de pour visualiser les trames en ajoutant l'option `-e` :

```bash
sudo tcpdump -i eth0 -e -n
```

### Génération d'une adresse MAC

> 🤖 Rédaction assistée par IA.

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

Pour QEMU, nous pourrons utiliser `52:54:00` et le script suivant [^3] :

```bash
mac_address="52:54:00:$(dd if=/dev/urandom bs=512 count=1 2>/dev/null \
                           | md5sum \
                           | sed -E 's/^(..)(..)(..).*$/\1:\2:\3/')"
echo $mac_address
```

[^3]: https://guix.gnu.org/cookbook/fr/html_node/Pont-reseau-pour-QEMU.html#Invoquer-QEMU-avec-les-bonnes-options-de-la-ligne-de-commande

