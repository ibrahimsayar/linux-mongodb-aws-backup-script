#!/bin/bash
set -e

# Set variables
date=$(date '+%Y-%m-%d')
backupDir=/home/linux-mongodb-aws-backup-script/mongo-backups/

# Authenticate to MongoDB
export MONGODB_USERNAME=mongodbDatabaseUser
export MONGODB_PASSWORD=mongodbDatabasePassword
export MONGODB_DATABASE=mongodbDatabase
export S3_BUCKET_NAME=s3://bucket-name

# Delete old backup files
echo "Deleting old backup files..."
find $backupDir -name "*.tar.gz" -type f -delete

# Backup database
echo "Backing up database..."
mongodump --authenticationDatabase admin -u $MONGODB_USERNAME -p $MONGODB_PASSWORD --db $mongodbDatabase --out $backupDir$date

# Compress backup directory
echo "Compressing backup directory..."
cd $backupDir
tar -czvf $date.tar.gz $date/

# Upload backup to S3
echo "Uploading backup to S3..."
aws s3 cp $backupDir/$date.tar.gz $S3_BUCKET_NAME/$date.tar.gz

# Delete backup folder
echo "Deleting backup folder"
rm -rf $backupDir$date