#!/bin/bash

sudo apt-get update

# Install snap store, certbot
sudo snap install snap-store
sudo snap install certbot

# Install Docker via snap store
sudo snap install docker
sudo addgroup --system docker
sudo adduser $USER docker
newgrp docker
sudo snap disable docker
sudo snap enable docker

# Install Docker Compose
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.4.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

# Clone website-factory repository & run docker-compose
git clone https://github.com/code4romania/website-factory.git
cd website-factory
docker-compose up -d

# Generate SSL certificate using certbot
add-apt-repository ppa:certbot/certbot
apt-get update
apt-get install certbot

certbot certonly --standalone -d "$1" -d www."$1" --agree-tos \
--no-bootstrap --manual-public-ip-logging-ok --preferred-challenges dns-01 \
-m  "$2"  \
--server https://acme-v02.api.letsencrypt.org/directory
