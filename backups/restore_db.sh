#!/bin/bash

# Ensure the script is executable
chmod +x "$0"

# Load GitHub Secrets
DB_USER="${MYSQL_USER}"
DB_PASS="${MYSQL_PASS}"
DB_HOST="${MYSQL_HOST}"
DB_NAME="${MYSQL_DB}"
BACKUP_DIR="backups"

# Find the latest backup file
LATEST_BACKUP=$(ls -t $BACKUP_DIR/php_ecom_backup_*.sql | head -n 1)

# Check if backup file exists
if [ -z "$LATEST_BACKUP" ]; then
    echo "❌ No backup file found!"
    exit 1
fi

# Restore database
mysql -u "$DB_USER" -p"$DB_PASS" -h "$DB_HOST" "$DB_NAME" < "$LATEST_BACKUP"

# Verify restore success
if [ $? -eq 0 ]; then
    echo "✅ Restore successful from $LATEST_BACKUP"
else
    echo "❌ Restore failed!"
    exit 1
fi
