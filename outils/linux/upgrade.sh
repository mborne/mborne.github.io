#!/bin/bash

# wait for auto-update to finish
MAX_WAIT=300 # maximum wait time in seconds
WAIT_TIME=0
while fuser /var/lib/dpkg/lock >/dev/null 2>&1; do
    WAIT_TIME=$((WAIT_TIME + 1))
    if [ "$WAIT_TIME" -ge "$MAX_WAIT" ]; then
        echo "Timeout reached. Exiting..."
        exit 1
    fi
    echo "Waiting for other package managers to finish..."
    sleep 1
done

sudo apt-get update
sudo apt-get upgrade -y


