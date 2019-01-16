#!/usr/bin/env bash

# Update yum
yum -y update

# Dev Tools Installation
yum install -y epel-release
yum install -y git python-pip java-1.8.0-openjdk-devel unzip

# Docker installation
yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce
usermod -a -G docker vagrant
systemctl start docker

# Run Jenkins BlueOcean Container
docker run \
  -u root \
  --rm \
  -d \
  -p 8080:8080 \
  -p 50000:50000 \
  -v /var/jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkinsci/blueocean

# Install ngrok
curl -s https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -L -o ngrok.zip
unzip -o ngrok.zip -d /usr/local/bin/
rm ngrok.zip

# Install Node 10.15.0 using NVM as the vagrant user
su - vagrant << 'EOF' 
curl -s -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 10.15.0
EOF
