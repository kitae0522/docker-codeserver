#!/bin/bash

GIT_NAME=""
GIT_EMAIL=""

GO_VERSION="1.23.2"
DOCKER_COMPOSE_VERSION="v2.29.7"

set -e

# Setting Github
git config --global user.name $GIT_NAME
git config --global user.email $GIT_EMAIL

# Update package index
echo "Updating package index..."
sudo apt update

# Install Wget
echo "Installing wget..."
sudo apt install wget

# Install Go
echo "Installing Go..."
wget https://golang.org/dl/go$GO_VERSION.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz
rm go$GO_VERSION.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashsrc
source ~/.bashsrc

# Verify Go installation
echo "Verifying Go installation..."
go version

# Install Docker
echo "Installing Docker..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Verify Docker installation
echo "Verifying Docker installation..."
docker --version

# Install Docker Compose
echo "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verify Docker Compose installation
echo "Verifying Docker Compose installation..."
docker-compose --version

echo "Installation completed successfully!"
