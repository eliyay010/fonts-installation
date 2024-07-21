#!/bin/bash
# Script to recursively list and install all font files from each subfolder under the fonts directory using GitHub API with wget and jq

# Explicitly set the PATH
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Ensure wget and jq are installed
apt update
apt install wget jq -y

echo "Setup complete. Starting download process..."
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

REPO="eliyay010/fonts-installation"
BASE_PATH="fonts"

# GitHub API endpoint to get the list of font folders in the directory
FOLDERS_URL="https://api.github.com/repos/$REPO/contents/$BASE_PATH"

# Fetch the JSON data from GitHub API using wget
folders_response=$(wget -qO- "$FOLDERS_URL")

# Parse JSON response with jq to extract folder paths
echo "$folders_response" | jq -r '.[] | select(.type=="dir") | .path' | while read folder_path
do
  echo "Accessing folder: $folder_path"

  # Construct API URL for contents of the folder
  FOLDER_CONTENTS_URL="https://api.github.com/repos/$REPO/contents/$folder_path"

  # Fetch the contents of the font folder
  fonts_response=$(wget -qO- "$FOLDER_CONTENTS_URL")

  # Parse JSON response to get font files and their download URLs
  echo "$fonts_response" | jq -r '.[] | select(.type=="file") | .name, .download_url' | while read -r file_name; read -r download_url
  do
    echo "Downloading $file_name from $folder_path..."
    # Download the file
    wget -qO "$FONT_DIR/$file_name" "$download_url"
    echo "Installing $file_name..."
    # Assuming moving the file to the fonts directory installs it, add specific installation command if necessary
  done
done

echo "All files have been processed."
read
