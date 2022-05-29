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

./install-compose.sh
