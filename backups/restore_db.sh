#!/bin/bash

# Environment Variables
MYSQL_USER="pma"
MYSQL_PASS="${MYSQL_PASS}"
MYSQL_HOST="192.168.92.110"
MYSQL_DB="php_ecom"
BACKUP_DIR="backups"

# Find the latest backup file
LATEST_BACKUP=$(ls -t $BACKUP_DIR/db_backup_*.sql | head -n 1)

if [ -z "$LATEST_BACKUP" ]; then
    echo "❌ No backup file found!"
    exit 1
fi

# Restore the database
echo "🔄 Restoring database from: $LATEST_BACKUP..."
mysql -u$MYSQL_USER -p$MYSQL_PASS -h$MYSQL_HOST $MYSQL_DB < $LATEST_BACKUP

if [ $? -eq 0 ]; then
    echo "✅ Database restore successful!"
else
    echo "❌ Restore failed!"
    exit 1
fi
