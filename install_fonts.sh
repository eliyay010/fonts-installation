#!/bin/bash
# Script to list all files from a GitHub directory using the GitHub API

# Installing prerequisites if they are not installed
if ! command -v curl &> /dev/null
then
    echo "curl could not be found, installing..."
    sudo apt-get update && sudo apt-get install -y curl
fi

if ! command -v jq &> /dev/null
then
    echo "jq could not be found, installing..."
    sudo apt-get update && sudo apt-get install -y jq
fi

echo "Downloading..."
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p $FONT_DIR

REPO="eliyay010/fonts-installation"
PATH="fonts/Calibri"

# GitHub API endpoint to get the contents of the directory
API_URL="https://api.github.com/repos/$REPO/contents/$PATH"

# Fetch the list of all files using GitHub API
echo "Listing all files from $API_URL:"
FILES=$(curl -s $API_URL | jq -r '.[] | .name')  # Fetch and parse file names

# Loop through each file name and echo it
for file in $FILES; do
    echo "File: $file"
done

echo "Files listed successfully."
echo "Press enter to exit"
read
