# pico

Installation de pico2wave et sox pour faire facilement de la synthèse vocale.

## Pré-requis

Pour [pico/say.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/pico/say.sh), aplay et audio doivent être configurés :

```bash
sudo apt-get update
sudo apt-get install -y alsa-utils pulseaudio
```

## Installation

[pico/install.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/pico/install.sh) assure l'installation de "pico2wave" et "sox" :

```bash
curl -sS https://mborne.github.io/outils/pico/install.sh | bash
```

## Utilisation

[pico/say.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/pico/say.sh) génère un WAV à partir d'un texte et lance sa lecture à haute voix :

```bash
# Télécharger le script
wget -O /tmp/pico-say.sh https://mborne.github.io/outils/pico/say.sh

# Parler en français
bash /tmp/pico-say.sh "La sauvegarde n'a pas fonctionné"

# Parler en anglais
TTS_LANG=en-US bash /tmp/pico-say.sh "Backup failed!"
```

## Resources

* [www.framboise314.fr - Donnez la parole à votre Raspberry Pi](https://www.framboise314.fr/donnez-la-parole-a-votre-raspberry-pi/)
