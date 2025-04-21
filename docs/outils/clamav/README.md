# ClamAV

[ClamAV®](https://www.clamav.net/) est un antivirus opensource.

## Installation

* [clamav/install.sh](clamav/install.sh) assure l'installation du package :

```bash
curl -sS https://mborne.github.io/outils/clamav/install.sh | bash
```


## Usage

```bash
# ensure that definitions are updated
sudo service clamav-freshclam status
# see config
cat /etc/clamav/freshclam.conf

# scan HOME directory
clamscan -r $HOME
```

## Ressources

* [www.clamav.net - ClamAV](https://www.clamav.net/)
* [docs.clamav.net - ClamAV Documentation](https://docs.clamav.net/)
* [doc.ubuntu-fr.org - ClamAV](https://doc.ubuntu-fr.org/clamav)
* [Fichier de test Eicar](https://fr.wikipedia.org/wiki/Fichier_de_test_Eicar)
* URL pour la base de définition :
    * <https://database.clamav.net/main.cvd>
    * <https://database.clamav.net/daily.cvd>
