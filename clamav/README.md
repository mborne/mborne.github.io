# ClamAV

[ClamAV®](https://www.clamav.net/) is an open-source antivirus engine for detecting trojans, viruses, malware & other malicious threats.

## Usage

```bash
# ensure that definitions are updated
sudo service clamav-freshclam status
# see config
cat /etc/clamav/freshclam.conf

# scan directory
clamscan -r /home/mickael/.npm
```

## Ressources

* [www.clamav.net - ClamAV](https://www.clamav.net/) official website
* [docs.clamav.net - ClamAV Documentation](https://docs.clamav.net/)
* [doc.ubuntu-fr.org - ClamAV](https://doc.ubuntu-fr.org/clamav)
* [Fichier de test Eicar](https://fr.wikipedia.org/wiki/Fichier_de_test_Eicar)
* URL for the virus definitions :
  * https://database.clamav.net/main.cvd
  * https://database.clamav.net/daily.cvd

