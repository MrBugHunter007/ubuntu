#!/bin/bash

# Ensure the script is run as root
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root. Please run it with sudo." 1>&2
  exit 1
fi

# Update package list
echo "Updating package list..."
sudo apt update

# Install and enable SSH server
echo "Installing OpenSSH server..."
sudo apt install -y openssh-server

echo "Enabling and starting SSH service..."
sudo systemctl enable ssh
sudo systemctl start ssh

# Install Tailscale
echo "Installing Tailscale..."
curl -fsSL https://tailscale.com/install.sh | sh

# Enable and start Tailscale service
echo "Enabling and starting Tailscale..."
sudo systemctl enable tailscaled
sudo systemctl start tailscaled

echo "Setup complete!"
