#!/bin/bash

# Load MySQL credentials from environment variables
MYSQL_USER="ci_user"
MYSQL_PASSWORD="${MYSQL_PASSWORD}"  # Secret from GitHub Actions
MYSQL_HOST="192.168.29.245"
MYSQL_PORT="3306"
MYSQL_DB="php_ecom"

# Backup directory and timestamped file
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

# Perform the backup
echo "🔄 Starting database backup..."
mysqldump -h "$MYSQL_HOST" -P "$MYSQL_PORT" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DB" > "$BACKUP_FILE"

# Verify backup success
if [ $? -eq 0 ]; then
    echo "✅ Backup successful: $BACKUP_FILE"
else
    echo "❌ Backup failed!"
    exit 1
fi

# Keep the last 5 backups and delete older ones
echo "🧹 Cleaning up old backups..."
ls -t "$BACKUP_DIR"/php_ecom_backup_*.sql | tail -n +6 | xargs rm -f 2>/dev/null

echo "✅ Backup process completed successfully!"
exit 0
