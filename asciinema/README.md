# asciinema - enregistrement du terminal

[asciinema](https://asciinema.org/) est un utilitaire permettant d'enregistrer les commandes et leurs résultats dans un terminal.

## Installation

```bash
sudo apt-get update
sudo apt-get install -y asciinema
sudo npm install -g svg-term-cli
```

## Utilisation

```bash
asciinema rec /tmp/demo.cast
# exécuter des commandes...
# CTRL+D pour arrêter l'enregistrement
cat /tmp/demo.cast | svg-term --out docs/demo.svg
```

## Démonstration

> Visible uniquement en mode web

<div id="asciinema-player"></div>
<script>
AsciinemaPlayer.create(
    './demo.cast', 
    document.getElementById('asciinema-player'),
    {
        preload: true
    }
);
</script>

## Ressources

* [asciinema.org - Getting started](https://asciinema.org/docs/getting-started)
* [github.com - asciinema/asciinema-player](https://github.com/asciinema/asciinema-player/tree/master#readme) pour l'intégration dans une page HTML.
* [github.com - marionebl/svg-term-cli](https://github.com/marionebl/svg-term-cli) pour convertir en SVG.



