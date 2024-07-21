#!/bin/bash
# Script to list all files from a GitHub directory using GitHub API with wget and jq

# Explicitly set the PATH
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Ensure wget and jq are installed
sudo apt update
sudo apt install wget jq -y

echo "download!"
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

REPO="eliyay010/fonts-installation"
PATH_TO_CONTENT="fonts/Calibri"

# GitHub API endpoint to get the contents of the directory
API_URL="https://api.github.com/repos/$REPO/contents/$PATH_TO_CONTENT"

# Fetch the JSON data from GitHub API using wget and parse it using jq
response=$(wget -qO- "$API_URL")

# Parse JSON response with jq to extract file names
echo "$response" | jq '.[] | .name'

echo "Files listed successfully."
echo "Press enter to exit"
read
