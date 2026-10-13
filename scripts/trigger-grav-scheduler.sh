#!/bin/sh

# This script is used to trigger the Grav scheduler via cron, when cron cannot run the PHP CLI directly.
# Usage: /path/to/grav/scripts/trigger-grav-scheduler.sh

# Change to the Grav root directory
cd "$(dirname "$0")/.."

# Run the Grav scheduler
php bin/grav scheduler

# Output the last run time for cron with TZ
echo "last run @ $(date +'%d-%m-%Y %H:%M:%S %:z')"
