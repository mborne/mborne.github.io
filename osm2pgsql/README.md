# osm2pgsql

## Paramétrage

La connexion à la base de données s'appuie sur les variables d'environnements standards de PostgreSQL (PGHOST, PGPORT, PGUSER, PGPASSWORD, PGDATABASE,...).

| Variable       | Description                                    | Valeur par défaut                                          |
| -------------- | ---------------------------------------------- | ---------------------------------------------------------- |
| OSM_PLANET_URL | URL du fichier PBF pour [import.sh](import.sh) | https://download.geofabrik.de/europe/monaco-latest.osm.pbf |
| OSM_DATA_DIR   | Dossier de téléchargement des données          | `osm2pgsql/data`                                           |

## Utilisation

```bash
# configuration de l'accès à la base de données
export PGHOST=localhost
export PGUSER=postgres
export PGPORT=5432
export PGPASSWORD=ChangeIt

# valeur par défaut
export OSM_PLANET_URL=https://download.geofabrik.de/europe/monaco-latest.osm.pbf

# Espagne
#export OSM_PLANET_URL=http://download.geofabrik.de/europe/spain-latest.osm.pbf

# Monde entier
#export OSM_PLANET_URL=https://planet.openstreetmap.org/pbf/planet-latest.osm.pbf

bash osm2pgsql/import.sh
```

## TODO

* Création des indexes
* Mise à jour des données
* Vérifier la possibilité de faire le lien avec un serveur de tuile

## Ressources

* [osm2pgsql.org - OSM2PGSQL MANUAL](https://osm2pgsql.org/doc/manual.html)
* [osm2pgsql.org - osm2pgsql-replication](https://osm2pgsql.org/doc/man/osm2pgsql-replication-1.9.1.html)

