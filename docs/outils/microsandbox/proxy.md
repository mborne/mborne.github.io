---
tags:
    - Réseau
    - Sandboxing agent IA
    - microsandbox
    - Proxy
---

# microsandbox - utilisation d'un proxy sortant

> 🤖 Rédaction assistée par IA.

!!! warning "En construction"

    Test en cours de microsandbox comme alternative à [Lima](../lima/index.md), [Multipass](../multipass/index.md) & co (vu dans [etalab-ia/codebox](https://github.com/etalab-ia/codebox)).

Cette fiche illustre comment limiter les destinations d'une sandbox [microsandbox](index.md) à une liste de domaines **et** faire sortir son trafic par un proxy d'entreprise (ex : squid). Elle s'appuie sur des tests réalisés avec msb 0.7.16.

## Exemple

Configuration `sandbox-proxy.yaml` combinant filtrage par domaine et interception TLS :

```yaml
image: "nicolaka/netshoot:latest"
network:
  # liste non vide => tout le reste est refusé (y compris en DNS)
  allow: ["ipinfo.io", "mborne.github.io"]
  # mode strict (défaut) : un HTTPS autorisé par nom d'hôte doit être intercepté
  tls:
    enabled: true
    # bypass: ["pinned-api.example.com"]  # clients à certificate pinning / mTLS
```

```bash
# domaine autorisé => 200
msb run --conf sandbox-proxy.yaml --proxy http://<PROXY_IP>:3128 -- curl -sS https://ipinfo.io
# domaine non autorisé => "Could not resolve host"
msb run --conf sandbox-proxy.yaml --proxy http://<PROXY_IP>:3128 -- curl -sS https://www.google.fr
```

!!! warning "Adresse IP du proxy"
    Le proxy doit être désigné par son **adresse IP** : msb ne résout pas le nom d'hôte passé dans `--proxy` (ex : `http://proxy:3128`).

Pour vérifier que le trafic passe bien par le proxy, il suffit de pointer `--proxy` sur un port fermé : la requête échoue alors en timeout.

## Fonctionnement

- **Le filtrage est fait par msb, pas par le proxy** : msb résout le nom, applique sa politique réseau puis envoie `CONNECT <IP>:<port>` au proxy.
    - ⚠️ Le proxy ne voit actuellement pas le nom de domaine[^1773] (une ACL `dstdomain` côté squid est inutile) et sert uniquement de point de sortie et de journal.
- **Le DNS ne passe pas par le proxy** mais par le forwarder DNS de msb : un domaine absent de `allow` est bloqué dès la résolution (`curl: (6) Could not resolve host`).
- **Le mode strict est actif par défaut** (`network.strict: true`) : un HTTPS autorisé uniquement par un nom d'hôte doit être **intercepté** pour que msb puisse vérifier l'en-tête `Host` de la requête. Sans interception, la connexion est coupée après le ClientHello (`curl: (35) TLS connect error: ... unexpected eof while reading`), avec ou sans proxy.
- Seuls les proxys HTTP CONNECT, SOCKS4 et SOCKS5 sont supportés, un seul par sandbox. Avec HTTP CONNECT, l'UDP hors DNS est bloqué.
- L'authentification se fait avec `--http-connect-username` et `--http-connect-password-env` (le mot de passe est lu dans une variable d'environnement de l'hôte).

## Interception TLS ou filtrage par SNI

| Configuration                   | Domaine autorisé en HTTPS             | Remarque                                             |
| ------------------------------- | ------------------------------------- | ---------------------------------------------------- |
| `allow` seul (strict, sans TLS) | échec `curl: (35) ... unexpected eof` | coupure après le ClientHello, indépendante du proxy  |
| `allow` + `tls.enabled: true`   | OK, contrôle de l'en-tête `Host`      | mode recommandé, requis par les secrets              |
| `allow` + `strict: false`       | OK, contrôle par DNS et SNI           | pas de CA à installer, mais domain fronting possible |

### Interception TLS (recommandé)

Avec `tls.enabled: true` (ou `--tls-intercept`), le contrôle porte sur le domaine réellement demandé (en-tête `Host`) et pas seulement sur le SNI. C'est aussi le mode utilisé par les secrets : déclarer un secret active l'interception.

La [documentation](https://docs.microsandbox.dev/networking/outbound-proxy) confirme que l'interception TLS et l'injection de secrets fonctionnent avec un proxy sortant.

Contraintes :

- La CA de msb (`~/.microsandbox/tls/ca.{crt,key}`) est ajoutée au trust store système de la sandbox. Les outils ayant leur propre magasin de certificats (Node, Python `certifi`, Java...) peuvent nécessiter `msb-trust.sh` (voir [docs.microsandbox.dev - TLS](https://docs.microsandbox.dev/networking/tls)).
- Les clients à certificate pinning ou exigeant du mTLS doivent être placés dans `tls.bypass` (ils retombent alors dans un filtrage par SNI).
- QUIC/HTTP3 n'est pas intercepté.

### Filtrage par SNI (`strict: false`)

```yaml
network:
  strict: false
  allow: ["ipinfo.io", "mborne.github.io"]
```

Le trafic HTTPS n'est pas déchiffré et aucune CA n'est à installer. En contrepartie, le domaine n'est vérifié que via le DNS et le SNI : un client peut annoncer un SNI autorisé et demander un autre `Host`. À réserver aux sandboxes sans secrets ou aux cas où l'interception pose problème.

## Pièges côté squid

Avec la configuration par défaut de squid sous Ubuntu :

| Problème                                                                                 | Symptôme                                                                                | Correction                                                                       |
| ---------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| msb utilise `CONNECT` même pour HTTP en clair (port 80), refusé par `CONNECT !SSL_ports` | `TCP_DENIED/403 CONNECT x.x.x.x:80` côté squid, `curl: (56) Connection reset by peer`   | `acl SSL_ports port 80` dans `/etc/squid/conf.d/` ou se limiter à HTTPS          |
| msb transmet l'IP résolue, y compris IPv6, à un squid sans IPv6                          | `TCP_TUNNEL/503 CONNECT [2606:...]:443` côté squid, connexion reset sans repli sur IPv4 | activer l'IPv6 côté squid (réseau docker) ou forcer IPv4 côté client (`curl -4`) |

## Ressources

- [docs.microsandbox.dev - Outbound proxies](https://docs.microsandbox.dev/networking/outbound-proxy)
- [docs.microsandbox.dev - TLS inspection](https://docs.microsandbox.dev/networking/tls)
- [docs.microsandbox.dev - Networking](https://docs.microsandbox.dev/networking/overview)
- [docs.microsandbox.dev - Configuration (`network`)](https://docs.microsandbox.dev/cli/configuration#network)

[^1773]: L'envoi du nom d'hôte dans le `CONNECT` (résolution par le proxy, utile avec un DNS d'entreprise) est en discussion dans [superradcompany/microsandbox#1773 - How should DNS resolution work with outbound proxies?](https://github.com/superradcompany/microsandbox/issues/1773) (issue ouverte au 20/11/2026).
