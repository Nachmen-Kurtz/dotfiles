#!/bin/bash

# This Script makes a copy/backup for all data at the "FreshRSS" container.
# It copies data from "/var/www/FreshRSS" directory to the local host computer,
# in the path: "$HOME/Developer/docker/FreshRSS/Backups" with a name based on the current date.

# Create a destination directory for logs
LOG_DIR="$HOME/System/Logs/FreshRSS"
mkdir -p "$LOG_DIR"

# Date for saving the backup
DATE=$(date +%Y-%m-%d)
LOG_FILE="$LOG_DIR/backup.log"

# Check if the container "FreshRSS" is running
if [ -z "$(docker ps -q -f name=freshrss)" ]; then
    echo "[$(date)] Container 'FreshRSS' is not running." >> "$LOG_FILE"
    exit 1
fi

# Create a temporary directory for the backup
TEMP_DIR=$(mktemp -d)

# Copy files from the container to the temporary directory
if ! docker cp freshrss:/var/www/FreshRSS "$TEMP_DIR"; then
    echo "[$(date)] Failed to copy files from container." >> "$LOG_FILE"
    exit 1
fi

# Compress the copied files into a tar.gz archive
TAR_FILE="$HOME/Developer/docker/FreshRSS/Backups/FreshRSS_$DATE.tar.gz"
tar -czf "$TAR_FILE" -C "$TEMP_DIR" .

# Log the successful backup and compression
echo "[$(date)] Backup completed successfully to $TAR_FILE." >> "$LOG_FILE"

# Clean up the temporary directory
rm -rf "$TEMP_DIR"
