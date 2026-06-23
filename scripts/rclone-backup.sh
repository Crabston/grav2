#!/bin/sh

# This script is used to backup the Grav Backup files using rClone.
# Usage: ./scripts/rclone-backup.sh <remote path>

cd "$(dirname "$0")/.." || exit 1
grav_root=$(pwd)
remotePath=$1


# Check if rClone remote path is provided
if [ -z "$remotePath" ]; then
    echo "no remote path provided"
    echo "Usage: ./scripts/rclone-backup.sh <remote path>"
    exit 1
fi

# Check if the remotePath argument is valid
rclone ls "$remotePath" > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Invalid remote path: $remotePath"
    exit 1
fi

# Backup directory to remotePath location
rclone sync "$grav_root/backup" "$remotePath" --exclude ".*" --progress

# Check if the rClone command was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully."
else
    echo "Backup failed."
    exit 1
fi
