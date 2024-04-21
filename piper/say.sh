#!/bin/bash

# fr_FR-upmc-medium fr_FR-siwis-medium
PIPER_MODEL=${PIPER_MODEL:-fr_FR-upmc-medium}
PIPER_DATA_DIR=${PIPER_DATA_DIR:-$HOME/.piper}

# if [ -z "$1" ];
# then
#     echo "Usage: say-piper.sh <MESSAGE>"
#     exit 1
# fi

source ~/tts-venv/bin/activate
mkdir -p $PIPER_DATA_DIR

TTS_DIR=/tmp/tts
mkdir -p $TTS_DIR

uuid=$(uuidgen)
piper \
  --model "$PIPER_MODEL" $PIPER_EXTRA_OPTS \
  --data-dir $PIPER_DATA_DIR \
  --download-dir $PIPER_DATA_DIR \
  --output_file "$TTS_DIR/piper-${uuid}.wav" < /dev/stdin

aplay "$TTS_DIR/piper-${uuid}.wav"
