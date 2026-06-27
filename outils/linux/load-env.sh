#!/bin/bash

#--------------------------------------------------
# Export env vars from .env file
#--------------------------------------------------
if [ -z "$1" ];
then
  echo "Usage: load-env.sh <ENV_PATH>"
  exit 1
fi

if [ ! -e "$1" ];
then
  echo $1 not found
  exit 1
fi

export $(grep -v '^#' "$1" | xargs)
