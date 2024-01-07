# linux-mongodb-aws-backup-script
A simple Bash script automating MongoDB backup and upload to AWS S3.

## Requirements
- Linux

## Before Install
#### Variables that need to be changed
#### add-backup-time-to-crontab.sh
```bash
# The root user may vary on your server, so you may need to write your own user in the 'root' section.
# You can find out which user you are with the 'whoami' command.
# Before
CRONTAB_FILE="/var/spool/cron/crontabs/root"
# After
CRONTAB_FILE="/var/spool/cron/crontabs/ubuntu"

# The script is defined to run at 5 am. If you want to change it, you must make your definition.
# Before
WORKING_TIME="0 5 * * *"

# After (Every Minutes)
WORKING_TIME="* * * * *"
```

#### mongodb-aws-backup-script.sh
```bash
# You must define mongodb username, password and database information in this section.
export MONGODB_USERNAME=mongodbDatabaseUser
export MONGODB_PASSWORD=mongodbDatabasePassword
export MONGODB_DATABASE=mongodbDatabase

# You must define aws bucket name
export S3_BUCKET_NAME=s3://bucket-name
```


## Install
```bash
# Go directory
cd /home

# Clone repository
git clone https://github.com/ibrahimsayar/linux-mongodb-aws-backup-script.git

# Go script directory
cd linux-mongodb-aws-backup-script

# If you have completed the steps and variables required 'Before Install' installation, you can run it.
# Run crontab command
bash add-backup-time-to-crontab.sh

# Congratulations, that's all you need to do
```

### What you need to know before installing the script

- <a href="https://help.ubuntu.com/community/Beginners/BashScripting" target="_blank">bash script</a>
- <a href="https://www.mongodb.com/docs/database-tools/mongodump/" target="_blank">mongodump</a>
- <a href="https://askubuntu.com/questions/2368/how-do-i-set-up-a-cron-job" target="_blank">crontab</a>
- <a href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/creating-buckets-s3.html" target="_blank">Amazon Simple Storage Service (S3)
  </a>
