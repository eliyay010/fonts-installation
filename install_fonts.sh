#!/bin/bash
# Script to download and install fonts from a GitHub directory using the GitHub API

FONT_DIR="$HOME/.local/share/fonts"
mkdir -p $FONT_DIR

REPO="eliyay010/fonts-installation"
PATH="fonts/Calibri"

# GitHub API endpoint to get the contents of the directory
API_URL="https://api.github.com/repos/$REPO/contents/$PATH"

# Fetch the list of font files using GitHub API and filter for .ttf files
echo "Listing font files from $API_URL:"
curl -s $API_URL | jq -r '.[] | select(.name | endswith(".TTF")) | .name'

echo "Fonts listed successfully."
echo "Press enter to exit"
read
