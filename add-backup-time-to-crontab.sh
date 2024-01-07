#!/bin/bash
set -e

# Set variables
SCRIPT_DIR="/home"
CRONTAB_FILE="/var/spool/cron/crontabs/root"

# Generate crontab command
CRONTAB_COMMAND="0 5 * * * bash/$SCRIPT_DIR/mongodb-aws-backup-script.sh 1> /home/mongo-backups/log.txt 2> /home/mongo-backups/error.txt"

# Set crontab command to crontab
echo "$CRONTAB_COMMAND" >> "$CRONTAB_FILE"

# Message
echo "Uploading backup to S3..."
echo "Added crontab command.."