#!/bin/bash

if [ -z "$1" ];
then
    echo "Usage: docker/volume-backup.sh <VOLUME_NAME>"
    exit 1
fi

VOLUME_NAME=$1
BACKUP_DIR=$PWD
TIMESTAMP=$(date -u +"%Y%m%dT%H%M%S")
BACKUP_FILENAME="${TIMESTAMP}_${VOLUME_NAME}.tar.gz"

echo "${VOLUME_NAME} -> ${BACKUP_DIR}/${BACKUP_FILENAME}"

docker run --rm \
  -v "${VOLUME_NAME}:/data" \
  -v "${BACKUP_DIR}:/backup" \
  busybox tar -czf "/backup/${BACKUP_FILENAME}" -C "/data" .

# echo "Backup of ${VOLUME_NAME} created: ${BACKUP_DIR}/${BACKUP_FILENAME}"
