#!/bin/sh

# This script is used to install Grav and configure it with Doppler secrets.

# Install Grav
bin/grav install

# Configure Doppler via doppler.yaml config
cp user/doppler.yaml doppler.yaml
doppler setup --no-interactive

# Parse secrets into the .grav.env file
doppler secrets --json | python3 ./scripts/secrets-parser.py

# Remove copied doppler.yaml file
rm doppler.yaml
