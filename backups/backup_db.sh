#!/bin/bash

# Database credentials
MYSQL_USER="ci_user"
MYSQL_PASSWORD="${MYSQL_PASSWORD}"  # Correct environment variable
MYSQL_HOST="192.168.0.107"
MYSQL_PORT="3306"
MYSQL_DB="php_ecom"

# Backup directory and filename
BACKUP_DIR="backups"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="$BACKUP_DIR/php_ecom_backup_$TIMESTAMP.sql"

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# Check if MySQL password is set
if [[ -z "$MYSQL_PASSWORD" ]]; then
    echo "❌ Error: MySQL password is not set!"
    exit 1
fi

# Run mysqldump with correct password syntax
mysqldump -h "$MYSQL_HOST" -P "$MYSQL_PORT" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DB" > "$BACKUP_FILE"

# Verify if backup was successful
if [ $? -eq 0 ]; then
    echo "✅ Backup successful: $BACKUP_FILE"
else
    echo "❌ Backup failed!"
    exit 1
fi

# Keep only the last 5 backups, delete older ones
ls -t "$BACKUP_DIR"/php_ecom_backup_*.sql | tail -n +6 | xargs rm -f 2>/dev/null

exit 0
