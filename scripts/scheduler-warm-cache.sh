#!/bin/sh

# This script is used to warm the Grav cache using a sitemap URL.
# Usage: ./scripts/scheduler-warm-cache.sh <grav root> <sitemap url>

grav_root=$1
sitemap_url=$2

# Check if grav_root is provided
if [ -z "$grav_root" ]; then
    echo "Usage: ./scripts/scheduler-warm-cache.sh <grav root> <sitemap url>"
    exit 1
fi

# Check if sitemap_url is provided
if [ -z "$sitemap_url" ]; then
    echo "Usage: ./scripts/scheduler-warm-cache.sh <grav root> <sitemap url>"
    exit 1
fi

# Check if the grav_root directory exists
if [ ! -d "$grav_root" ]; then
    echo "Grav root directory does not exist: $grav_root"
    exit 1
fi

# Check if warm-cache plugin is installed
if [ ! -d "$grav_root/user/plugins/warm-cache" ]; then
    echo "warm-cache plugin is not installed. Please install it first."
    exit 1
fi

# Change to the Grav root directory, with the warm-cache plugin installed
cd "$grav_root" || exit 1

# Warm the cache using the sitemap URL
bin/plugin warm-cache warm "$sitemap_url"
