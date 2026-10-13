# DevSecOps - l'automatisation des contrôles et des correctifs

## Durcissement de la configuration des serveurs

- [dev-sec.io - hardening à la sauce DevSecOps](https://dev-sec.io/) traite le durcissement de la configuration de [plusieurs systèmes (Linux, SSH, PostgreSQL,...)](https://dev-sec.io/baselines/) avec une **approche inspirante** : **une recommandation = la doc d'un test sur la configuration** qui est **accompagnée d'un script pour la corriger**.
- [docker-bench-security - script de contrôle de configuration de docker](https://github.com/docker/docker-bench-security#readme) où on retrouve le principe **une recommandation = un test** (un peu plus efficace qu'un PDF avec "vous devez configurez l'option userns-remap")

## Contrôle de la configuration TLS

- [www.sslshopper.com - SSL Checker](https://www.sslshopper.com/ssl-checker.html) : **Contrôle de la configuration TLS** (particulièrement efficace pour détecter des problèmes récurrent liés à l'absence des certificats intermédiaires)

## Contrôle des entêtes de sécurité

- [securityheaders.com](https://securityheaders.com) : Contrôle de configuration des [entètes de sécurité (Strict-Transport-Security (HSTS), Content-Security-Policy (CSP),...)](https://www.anopixel.fr/en-tetes-de-securite-http-security-headers.html)
