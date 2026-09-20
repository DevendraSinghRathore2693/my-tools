#!/bin/bash

####################
#This is Jenkins installation files
#Author: Devendra
#Date: 20th Sept 2026
###################

set -x
set -e
set -o pipefail

#install Java
sudo apt update
sudo apt install default-jdk

#install Jenkins

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

#update packages
sudo apt update

#install Jenkins
sudo apt install jenkins

