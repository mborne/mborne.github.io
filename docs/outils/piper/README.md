# Piper

[https://github.com/rhasspy/piper/](https://github.com/rhasspy/piper/) permet de convertir un texte en son.

## Installation

* [piper/create-venv.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/piper/create-venv.sh) assure l'installation dans `~/tts-venv` :

```bash
curl -sS https://mborne.github.io/outils/piper/create-venv.sh | bash
```

## Utilisation

Voir [piper/say.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/piper/say.sh) :

```bash
# Télécharger le script
wget -O /tmp/piper-say.sh https://mborne.github.io/outils/piper/say.sh

# Lire à haute voix
echo "Bienvenue dans le monde de la synthèse vocale!" | bash /tmp/piper-say.sh
```

## Ressources

* <https://rhasspy.github.io/piper-samples/>
* <https://huggingface.co/rhasspy/piper-voices/tree/v1.0.0/fr/fr_FR/upmc/medium>
* [ssamjh.nz - How to Create a Custom Piper TTS Voice](https://ssamjh.nz/create-custom-piper-tts-voice/)
