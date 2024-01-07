#!/bin/bash
set -e

# Set variables
SCRIPT_DIR="/home/linux-mongodb-aws-backup-script"
CRONTAB_FILE="/var/spool/cron/crontabs/root"

# Generate crontab command
CRONTAB_COMMAND="0 5 * * * bash $SCRIPT_DIR/mongodb-aws-backup-script.sh 1> $SCRIPT_DIR/log.txt 2> $SCRIPT_DIR/error.txt"

# Set crontab command to crontab
echo "$CRONTAB_COMMAND" >> "$CRONTAB_FILE"

# Create backup foldor
mkdir $SCRIPT_DIR/mongo-backups

# Message
echo "Uploading backup to S3..."
echo "Added crontab command.."