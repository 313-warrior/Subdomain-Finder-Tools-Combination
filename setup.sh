#!/bin/bash

# Install Go if not already installed
if ! [ -x "$(command -v go)" ]; then
    echo "Go is not installed. Installing Go..."
    sudo apt update
    sudo apt install -y golang
fi

# Install Subfinder
echo "Installing Subfinder..."
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Install Assetfinder
echo "Installing Assetfinder..."
go install -v github.com/tomnomnom/assetfinder@latest

# Install Httprobe
echo "Installing Httprobe..."
go install -v github.com/tomnomnom/httprobe@latest

# Add Go binaries to PATH
echo "Adding Go binaries to PATH..."
export PATH=$PATH:$(go env GOPATH)/bin

# Verify installation
echo "Verifying installation..."
if command -v subfinder >/dev/null && command -v assetfinder >/dev/null && command -v httprobe >/dev/null; then
    echo "Subfinder, Assetfinder, and Httprobe installed successfully."
else
    echo "Installation failed. Please check your setup."
fi
