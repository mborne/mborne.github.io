# pico

Installation de pico2wave et sox.

## Pré-requis

aplay et audio configuré :

```bash
sudo apt-get update
sudo apt-get install -y alsa-utils pulseaudio
```

## Installation

[pico/install.sh](install.sh)

## Utilisation

Voir [pico/say.sh](say.sh) :

```bash
# Parler en français
bash pico/say.sh "La sauvegarde n'a pas fonctionné"

# Parler en anglais
TTS_LANG=en-US bash pico/say.sh "Backup failed!"
```

## Resources

* [www.framboise314.fr - Donnez la parole à votre Raspberry Pi](https://www.framboise314.fr/donnez-la-parole-a-votre-raspberry-pi/)
