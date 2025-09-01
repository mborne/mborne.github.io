
import dagster as dg

import subprocess
import sqlite3

WFS_URL = "https://data.geopf.fr/wfs/ows?request=GetCapabilities&service=WFS"

LAYERS = [
    "point_de_repere",
    "section_de_points_de_repere"
]

GPKG_PATH = "data/bdpr.gpkg"

@dg.asset
def wfs_data(context):
    for layer in LAYERS:
        cmd = [
            "ogr2ogr",
            "-f", "GPKG",
            "-lco", "GEOMETRY_NAME=geom",
            "-nln", layer,
            "-append" if layer != LAYERS[0] else "-overwrite",
            GPKG_PATH,
            f"WFS:{WFS_URL}",
            f"BDTOPO_V3:{layer}"
        ]
        context.log.info(cmd)
        context.log.info(f"Téléchargement de {layer}")
        result = subprocess.run(cmd, capture_output=True, text=True)
        if result.returncode != 0:
            context.log.error(f"Erreur lors du téléchargement de {layer} : {result.stderr}")
            raise Exception(f"Échec de l'import de {layer}")

@dg.asset(deps=[wfs_data])
def nombre_pr():
    with sqlite3.connect(GPKG_PATH) as conn:
        cursor = conn.cursor()
        cursor.execute(f"SELECT COUNT(*) FROM point_de_repere")
        count = cursor.fetchone()[0]
        return count
    

@dg.asset(deps=[wfs_data])
def nombre_section():
    with sqlite3.connect(GPKG_PATH) as conn:
        cursor = conn.cursor()
        cursor.execute(f"SELECT COUNT(*) FROM section_de_points_de_repere")
        count = cursor.fetchone()[0]
        return count

defs = dg.Definitions(
    assets=[wfs_data,nombre_pr,nombre_section],
)
