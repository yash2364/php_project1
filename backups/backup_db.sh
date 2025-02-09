#!/bin/bash

# Environment Variables
MYSQL_USER="pma"
MYSQL_PASS="${MYSQL_PASS}"
MYSQL_HOST= 127.0.0.1
MYSQL_DB="php_ecom"
BACKUP_DIR="backups"
BACKUP_FILE="$BACKUP_DIR/db_backup_$(date +'%Y-%m-%d_%H-%M-%S').sql"

# Create backup directory if not exists
mkdir -p $BACKUP_DIR

# Perform MySQL backup
echo "🔄 Starting database backup..."
mysqldump -u$MYSQL_USER -p$MYSQL_PASS -h$MYSQL_HOST $MYSQL_DB > $BACKUP_FILE

if [ $? -eq 0 ]; then
    echo "✅ Backup successful: $BACKUP_FILE"
else
    echo "❌ Backup failed!"
    exit 1
fi
