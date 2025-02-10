#!/bin/bash

# Set MySQL credentials
MYSQL_USER="ci_user"
MYSQL_PASSWORD="${MYSQL_PASSWORD}"
MYSQL_HOST="192.168.92.110"
MYSQL_PORT="3306"
MYSQL_DB="php_ecom"

# Backup directory
BACKUP_DIR="backups"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="$BACKUP_DIR/php_ecom_backup_$TIMESTAMP.sql"

# Ensure the backup directory exists
mkdir -p $BACKUP_DIR

# Perform database backup
mysqldump -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER --password="$MYSQL_PASSWORD" $MYSQL_DB > $BACKUP_FILE

# Verify backup success
if [ $? -eq 0 ]; then
    echo "✅ Backup successful: $BACKUP_FILE"
else
    echo "❌ Backup failed!"
    exit 1
fi

# Keep only the last 5 backups to avoid excess storage
ls -t $BACKUP_DIR/php_ecom_backup_*.sql | tail -n +6 | xargs rm -f
