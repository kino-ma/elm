#!/bin/bash

set -e

echo "deploying..."

git pull
docker-compose up --build

echo "deployed"
