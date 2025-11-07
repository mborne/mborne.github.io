# asciinema - enregistrement du terminal

[asciinema](https://asciinema.org/) est un utilitaire permettant d'enregistrer les commandes et leurs résultats dans un terminal.

## Installation

* [asciinema/install.sh](https://github.com/mborne/mborne.github.io/blob/main/docs/outils/asciinema/install.sh) assure l'installation du package "asciinema" :

```bash
curl -sS https://mborne.github.io/outils/asciinema/install.sh | bash
```

## Utilisation

Voir `asciinema --help` :

```bash
# Démarrer l'enregistrement
asciinema rec /tmp/demo.cast

# exécuter des commandes...

# CTRL+D pour arrêter l'enregistrement
cat /tmp/demo.cast

# Lire l'enregistrement
asciinema play /tmp/demo.cast
```

## Conversion en SVG

```bash
# installer l'exécutable svg-term
npm install -g svg-term-cli

# convertir comme suit
cat /tmp/demo.cast | svg-term --out docs/demo.svg
```

## Ressources

* [asciinema.org - Getting started](https://asciinema.org/docs/getting-started)
* [github.com - asciinema/asciinema-player](https://github.com/asciinema/asciinema-player/tree/master#readme) pour l'intégration dans une page HTML :

```html
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
```

* [github.com - marionebl/svg-term-cli](https://github.com/marionebl/svg-term-cli) pour convertir en SVG.
