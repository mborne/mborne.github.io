#!/bin/bash

TTS_LANG=${TTS_LANG:-fr-FR}
TTS_DIR=/tmp/tts

if [ -z "$1" ];
then
    echo "Usage: pico/say.sh <MESSAGE>"
    exit 1
fi

mkdir -p $TTS_DIR

uuid=$(uuidgen)
echo "$1" | pico2wave -l $TTS_LANG -w "${TTS_DIR}/${uuid}-pico.wav"

sox "$TTS_DIR/${uuid}-pico.wav" "$TTS_DIR/${uuid}-sox.wav" treble 24 gain -l 6

aplay "$TTS_DIR/${uuid}-sox.wav"

