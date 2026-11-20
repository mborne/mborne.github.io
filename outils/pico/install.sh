#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

echo "-------------------------------------------------------------------"
echo "-- pico/install.sh"
echo "-------------------------------------------------------------------"

echo "${ICON_INFO} Installing pico TTS engine and sox audio processing tool..."
sudo apt-get update
sudo apt-get install -y libttspico-utils sox

echo "${ICON_OK} pico TTS engine and sox audio processing tool installed successfully."

echo "${ICON_INFO} Usage :"
echo "${ICON_INFO} To display help information about pico TTS engine :"
echo 'pico2wave --help'
echo "${ICON_INFO} To convert text to speech :"
echo 'echo "Hello world" | pico2wave -l en-US -w /tmp/hello-world.wav'
echo "${ICON_INFO} To play the generated audio file :"
echo 'aplay /tmp/hello-world.wav'


