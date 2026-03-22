# DevOps - la sécurité

Cette page correspond actuellement aux annexes de la présentation [cours-devops - DevOps avec des VM](https://mborne.github.io/cours-devops/vm.html) où il est expliqué dans [Que manque-t'il?](https://mborne.github.io/cours-devops/vm.html#que-manque-til) que nous aurons des **problèmes en nous contentant de donner la CB à un DevOps pour qu'il déploie sur une VM** et que **certaines problématiques doivent être traitées à l'échelle**.


## Illustration des attaques au niveau SSH

!!!info "Objectif"
    Prendre conscience du risque et comprendre l'intérêt de **blinder la configuration SSH + mettre en oeuvre fail2ban si vous avez une seule instance**, voire de **mettre en oeuvre un bastion SSH** si vous avez de nombreuses instances (réduction de la surface d'attaque).

Le fichier [sshd-logs.txt](sshd-logs.txt) illustre la fréquence des attaques sur le service SSH d'une machine exposée sur internet :

```
Oct 16 06:39:02 ma-machine sshd[6991]: Invalid user ubuntu from xxx.xxx.xxx.xxx port 60710
Oct 16 06:39:44 ma-machine sshd[7008]: Invalid user sales1 from xxx.xxx.xxx.xxx port 38142
Oct 16 06:39:59 ma-machine sshd[7021]: Invalid user ubuntu from xxx.xxx.xxx.xxx port 60408
Oct 16 06:40:06 ma-machine sshd[7038]: Invalid user santosh from xxx.xxx.xxx.xxx port 45275
Oct 16 06:40:46 ma-machine sshd[7060]: Invalid user alexandre from xxx.xxx.xxx.xxx port 35560
Oct 16 06:40:58 ma-machine sshd[7065]: Invalid user gaochangfeng from xxx.xxx.xxx.xxx port 49846
```

## Sensibilisation sur l'exposition de services sur internet

!!!info "Objectif"

    Prendre conscience du risque et comprendre l'intérêt d'**utiliser systématiquement un LoadBalancer pour exposer des services sur internet** et d'**utiliser des pare-feux / réseaux privés** (machine sans IP sur internet) pour éviter une exposition non souhaitée.

Voir https://www.shodan.io/ et comprendre qu'un service exposé sans mot de passe ou avec un mot de passe faible finira rapidement par être référencé par ce moteur de recherche...

## Durcissement de la configuration des serveurs

- [dev-sec.io](https://dev-sec.io/) : Recommandations avec une **approche DevSecOps inspirante** (chaque recommandation est la documentation d'un test automatisé et de solutions de remédiation incluant des playbooks ansible)


## Contrôle de la configuration TLS et des entêtes de sécurité

- [www.sslshopper.com - SSL Checker](https://www.sslshopper.com/ssl-checker.html) : **Contrôle de la configuration TLS** (particulièrement efficace pour détecter des problèmes récurrent liés à l'absence des certificats intermédiaires)
- [securityheaders.com](https://securityheaders.com) : Contrôle de configuration des [entètes de sécurité (Strict-Transport-Security (HSTS), Content-Security-Policy (CSP),...)](https://www.anopixel.fr/en-tetes-de-securite-http-security-headers.html)


## Ressources

* [cyber.gouv.fr - Sécuriser un site web](https://cyber.gouv.fr/publications/securiser-un-site-web)
