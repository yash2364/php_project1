#!/bin/bash

# Database credentials
MYSQL_USER="ci_user"
MYSQL_PASSWORD="${MYSQL_PASSWORD}"  # Correct environment variable
MYSQL_HOST="192.168.0.103"
MYSQL_PORT="3306"
MYSQL_DB="php_ecom"

# Find the latest backup file
LATEST_BACKUP=$(ls -t backups/php_ecom_backup_*.sql 2>/dev/null | head -n 1)

# Check if a backup file exists
if [[ -z "$LATEST_BACKUP" ]]; then
    echo "❌ No backup files found!"
    exit 1
fi

# Check if MySQL password is set
if [[ -z "$MYSQL_PASSWORD" ]]; then
    echo "❌ Error: MySQL password is not set!"
    exit 1
fi

# Restore the database from the latest backup
mysql -h "$MYSQL_HOST" -P "$MYSQL_PORT" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DB" < "$LATEST_BACKUP"

# Verify if restore was successful
if [[ $? -eq 0 ]]; then
    echo "✅ Database restored successfully from $LATEST_BACKUP"
else
    echo "❌ Database restore failed!"
    exit 1
fi

exit 0
