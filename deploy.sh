#!/bin/bash

set -e

echo "deploying..."

git pull
docker-compose up
cp dist/* pages
echo "deployed"
