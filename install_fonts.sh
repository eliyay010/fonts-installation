#!/bin/bash
# Script to list all files from a GitHub directory using GitHub API with wget and awk (Limited Capability)

echo "Downloading..."
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p $FONT_DIR

REPO="eliyay010/fonts-installation"
PATH="fonts/Calibri"

# GitHub API endpoint to get the contents of the directory
API_URL="https://api.github.com/repos/$REPO/contents/$PATH"

# Use wget to fetch the JSON data from GitHub API
response=$(wget -qO- $API_URL)

# Parse JSON response with awk to extract file names
echo "Files in $PATH:"
echo "$response" | awk -F'"' '/"name":/ {print $4}'

echo "Files listed successfully."
echo "Press enter to exit"
read
