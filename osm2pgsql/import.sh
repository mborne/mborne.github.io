#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
STYLES_DIR=${SCRIPT_DIR}/styles

OSM_DATA_DIR=${OSM_DATA_DIR:-${SCRIPT_DIR}/data}

PGDATABASE=${PGDATABASE:-osm}
echo "[INFO] PGDATABASE=${PGDATABASE}"

OSM_PLANET_URL=${OSM_PLANET_URL:-https://download.geofabrik.de/europe/monaco-latest.osm.pbf}
echo "[INFO] OSM_PLANET_URL=${OSM_PLANET_URL}"

CACHE_SIZE=2000
echo "[INFO] CACHE_SIZE=${CACHE_SIZE}"

# create osm database
createdb $PGDATABASE
psql -d $PGDATABASE -c "CREATE EXTENSION IF NOT EXISTS postgis"
psql -d $PGDATABASE -c "CREATE EXTENSION IF NOT EXISTS hstore"

#  --host $DATABASE_IP --username $DATABASE_USERNAME
cd "${STYLES_DIR}/openstreetmap-carto"
python3 scripts/get-external-data.py \
    --database $PGDATABASE \
    --verbose

mkdir -p $OSM_DATA_DIR
wget -O "$OSM_DATA_DIR/osm.pbf" $OSM_PLANET_URL

#--host=$DATABASE_IP \
#--user=$DATABASE_USERNAME \

osm2pgsql \
    --database=$PGDATABASE \
    --slim \
    --hstore \
    --multi-geometry \
    --cache=$CACHE_SIZE \
    --style="${STYLES_DIR}/openstreetmap-carto/openstreetmap-carto.style" \
    --tag-transform-script="${STYLES_DIR}/openstreetmap-carto/openstreetmap-carto.lua" \
    "$OSM_DATA_DIR/osm.pbf"


