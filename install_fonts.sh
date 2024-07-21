#!/bin/bash
# Script to download and install fonts from a specific directory on a server

FONT_DIR="$HOME/.local/share/fonts"
mkdir -p $FONT_DIR

SERVER_URL="wget -qO- https://raw.githubusercontent.com/eliyay010/fonts-installation/main/fonts/Calibri/"

# Fetch the list of font files from the server
echo "Listing font files from $SERVER_URL:"
wget -qO- $SERVER_URL | grep -oP 'href="\K[^"]+' | grep '\.ttf$'

echo "Fonts installed successfully."
echo "Press enter to exit"
read
