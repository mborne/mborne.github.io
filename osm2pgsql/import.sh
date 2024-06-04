#!/bin/bash

#--------------------------------------------------------------
# Compute paths
#--------------------------------------------------------------

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

OSM_STYLES_DIR=${SCRIPT_DIR}/styles
OSM_CARTO_DIR=${OSM_STYLES_DIR}/openstreetmap-carto

#--------------------------------------------------------------
# Handle params
#--------------------------------------------------------------
OSM_DATA_DIR=${OSM_DATA_DIR:-${SCRIPT_DIR}/data}

PGDATABASE=${PGDATABASE:-osm}
echo "[INFO] PGDATABASE=${PGDATABASE}"

OSM_PLANET_URL=${OSM_PLANET_URL:-https://download.geofabrik.de/europe/monaco-latest.osm.pbf}
echo "[INFO] OSM_PLANET_URL=${OSM_PLANET_URL}"

CACHE_SIZE=${CACHE_SIZE:-2000}
echo "[INFO] CACHE_SIZE=${CACHE_SIZE}"

#--------------------------------------------------------------
# Create osm database
#--------------------------------------------------------------
createdb $PGDATABASE
psql -d $PGDATABASE -c "CREATE EXTENSION IF NOT EXISTS postgis"
psql -d $PGDATABASE -c "CREATE EXTENSION IF NOT EXISTS hstore"

#--------------------------------------------------------------
# Download openstreetmap-carto if required
#--------------------------------------------------------------
if [ ! -e "${OSM_CARTO_DIR}/openstreetmap-carto.style" ];
then
    bash "${SCRIPT_DIR}/get-styles.sh"
fi

#--------------------------------------------------------------
# Download external data
#--------------------------------------------------------------
cd "${OSM_CARTO_DIR}"
python3 "scripts/get-external-data.py" \
    --database $PGDATABASE \
    --verbose

#--------------------------------------------------------------
# Download OSM data
#--------------------------------------------------------------
mkdir -p $OSM_DATA_DIR
wget -O "$OSM_DATA_DIR/osm.pbf" $OSM_PLANET_URL

#--------------------------------------------------------------
# Import OSM file to PostgreSQL
# --flat-nodes="${OSM_DATA_DIR}/nodes.raw" --cache=0
#--------------------------------------------------------------
osm2pgsql \
    --database=$PGDATABASE \
    --slim \
    --hstore \
    --multi-geometry \
    --cache=$CACHE_SIZE \
    --style="${OSM_CARTO_DIR}/openstreetmap-carto.style" \
    --tag-transform-script="${OSM_CARTO_DIR}/openstreetmap-carto.lua" \
    "$OSM_DATA_DIR/osm.pbf"

#--------------------------------------------------------------
# Init replication table
#--------------------------------------------------------------
osm2pgsql-replication init \
    --database=$PGDATABASE \
    --osm-file "$OSM_DATA_DIR/osm.pbf"

#--------------------------------------------------------------
# Create indexes
#--------------------------------------------------------------
python3 "${OSM_CARTO_DIR}/scripts/indexes.py"

