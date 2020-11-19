#!/usr/bin/env sh
echo "deploying..."

git pull \
    && RELEASE=true make \
    && echo "deployed"
