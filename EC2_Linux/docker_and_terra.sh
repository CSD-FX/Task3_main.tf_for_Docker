#!/bin/bash
set -e

echo "=== Updating system ==="
sudo apt-get update -y
sudo apt-get upgrade -y

echo "=== Installing prerequisites ==="
sudo apt-get install -y gnupg software-properties-common curl unzip

echo "=== Installing Terraform ==="
# Add HashiCorp GPG key and repo
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt-get update -y
sudo apt-get install -y terraform

echo "Terraform version:"
terraform -version

echo "=== Installing Docker ==="
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

echo "Adding current user to docker group to run docker without sudo"
sudo usermod -aG docker $USER

echo "Docker version:"
docker --version

echo "=== Verify Docker ==="
docker ps

echo "=== Installation Complete! ==="
echo "You may need to log out and log back in for Docker group changes to take effect."
