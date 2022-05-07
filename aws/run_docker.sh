#!/bin/bash

# Clone website-factory repository & run docker-compose
git clone https://github.com/code4romania/website-factory.git
cd website-factory
docker-compose up -d
