#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Please provide a domain name and an email address."
 else

    # Generate SSL certificate using certbot
    add-apt-repository ppa:certbot/certbot
    apt-get update
    apt-get install certbot

    certbot certonly --standalone -d "$1" -d www."$1" --agree-tos \
    --no-bootstrap --manual-public-ip-logging-ok --preferred-challenges dns-01 \
    -m  "$2"  \
    --server https://acme-v02.api.letsencrypt.org/directory

fi
