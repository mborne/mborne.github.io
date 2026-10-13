# Les flux entrants et sortants

Une fois les [protocoles](../protocoles/index.md) en place, des intermédiaires se placent sur le chemin des flux :

| Sujet | Couche | Rôle |
| --- | --- | --- |
| Pare-feu | L3/L4 | Autoriser ou bloquer des flux (IP, port) |
| [Partage de charge et reverse proxy](lb-rp/index.md) | L4/L7 | Recevoir les flux **entrants** et les répartir entre les serveurs |
| [Proxy sortant](proxy-sortant/index.md) | L7 | Faire passer les flux **sortants** par un intermédiaire |
