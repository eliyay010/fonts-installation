#!/bin/bash
# Script to download and install multiple fonts from a repository

# Create the directory for fonts if it doesn't exist
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p $FONT_DIR

# Declare an array of font URLs
declare -a FontURLs=(
"https://raw.githubusercontent.com/yourusername/my-fonts/main/font1.ttf"
"https://raw.githubusercontent.com/yourusername/my-fonts/main/font2.ttf"
"https://raw.githubusercontent.com/yourusername/my-fonts/main/font3.ttf"
)

# Loop through the array and download each font
echo "Downloading and installing fonts..."
for url in "${FontURLs[@]}"; do
    wget -P $FONT_DIR "$url"
done

# Update the font cache
echo "Updating font cache..."
fc-cache -fv

echo "Fonts installed successfully."