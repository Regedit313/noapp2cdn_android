#!/data/data/com.termux/files/usr/bin/bash

clear

cd "$(dirname "$0")" || exit 1

echo "Creating project folders..."

mkdir -p auto_prepare

echo
echo "Updating Termux..."
pkg update -y
pkg upgrade -y

if [ ! -d ~/storage/shared ]; then
    echo "Setting up storage..."
    termux-setup-storage
else
    echo "Storage is already configured."
fi

echo
echo "Installation completed."
echo
read -p "Press Enter to continue..."
