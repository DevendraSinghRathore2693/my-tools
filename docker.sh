#!/bin/bash

####################
#This is docker installation files
#Author: Devendra
#Date: 20th Sept 2026
###################

set -x
set -e
set -o pipefail

# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

#update packages
sudo apt update

#install latest docker version
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo apt update

#check status of docker
sudo systemctl status docker

#docker group
sudo usermod -aG docker $USER
newgrp docker

#if permisson error, give permission
sudo chmod 666 /var/run/docker.sock

