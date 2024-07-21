#!/bin/bash
# Script to list all files from a GitHub directory using GitHub API with wget and jq

echo "Hello!"
sudo apt update
sudo apt install wget jq -y  # Install wget and jq

echo "download!"
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

REPO="eliyay010/fonts-installation"
PATH="fonts/Calibri"

# GitHub API endpoint to get the contents of the directory
API_URL="https://api.github.com/repos/$REPO/contents/$PATH"

# Use wget to fetch the JSON data from GitHub API
response=$(wget -qO- "$API_URL")

# Parse JSON response with jq to extract file names
echo "$response" | jq '.[] | .name'

echo "Files listed successfully."
echo "Press enter to exit"
read
