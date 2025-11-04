# DevOps - la sécurité

## Illustration des attaques au niveau SSH

!!!info "Objectif"
    Prendre conscience du risque et comprendre l'intérêt de mettre en oeuvre un bastion SSH (réduction de la surface d'attaque).

Le fichier [sshd-logs.txt](sshd-logs.txt) illustre la fréquence des attaques sur le service SSH d'une machine exposée sur internet :

```
Oct 16 06:39:02 ma-machine sshd[6991]: Invalid user ubuntu from xxx.xxx.xxx.xxx port 60710
Oct 16 06:39:44 ma-machine sshd[7008]: Invalid user sales1 from xxx.xxx.xxx.xxx port 38142
Oct 16 06:39:59 ma-machine sshd[7021]: Invalid user ubuntu from xxx.xxx.xxx.xxx port 60408
Oct 16 06:40:06 ma-machine sshd[7038]: Invalid user santosh from xxx.xxx.xxx.xxx port 45275
Oct 16 06:40:46 ma-machine sshd[7060]: Invalid user alexandre from xxx.xxx.xxx.xxx port 35560
Oct 16 06:40:58 ma-machine sshd[7065]: Invalid user gaochangfeng from xxx.xxx.xxx.xxx port 49846
```


