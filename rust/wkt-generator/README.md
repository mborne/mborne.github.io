# wkt-generator - génération d'un tableau de ponctuel pour prise en main de cargo

## Utilisation

```bash
# exécuter le programme
cargo run 10

# construire le programme
cargo build
./target/release/wkt-generator
```

## Bonus

Produire un fichier [demo-points.csv](demo-points.csv) pouvant être lu par [QGIS](../../qgis/README.md) et [GDAL - CSV](https://gdal.org/en/latest/drivers/vector/csv.html) :

```bash
# produire un fichier pour QGIS
./target/release/wkt-generator 10 > demo-points.csv
```
