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

PGDATABASE=${PGDATABASE:-osm}

CACHE_SIZE=${CACHE_SIZE:-2000}
echo "[INFO] CACHE_SIZE=${CACHE_SIZE}"

#--------------------------------------------------------------
# Download openstreetmap-carto if required
#--------------------------------------------------------------
if [ ! -e "${OSM_CARTO_DIR}/openstreetmap-carto.style" ];
then
    bash "${SCRIPT_DIR}/get-styles.sh"
fi

#--------------------------------------------------------------
# Update OSM data in PostgreSQL
#--------------------------------------------------------------
osm2pgsql-replication update --verbose -- \
    --database=$PGDATABASE \
    --slim \
    --hstore \
    --multi-geometry \
    --cache=$CACHE_SIZE \
    --style="${OSM_CARTO_DIR}/openstreetmap-carto.style" \
    --tag-transform-script="${OSM_CARTO_DIR}/openstreetmap-carto.lua"
