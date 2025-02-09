#!/bin/bash

# Ensure the script is executable
chmod +x "$0"

# Load GitHub Secrets (provided as environment variables in GitHub Actions)
DB_USER="${MYSQL_USER}"
DB_PASS="${MYSQL_PASS}"
DB_HOST="${MYSQL_HOST}"
DB_NAME="${MYSQL_DB}"
BACKUP_DIR="backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/php_ecom_backup_$TIMESTAMP.sql"

# Create backup directory if not exists
mkdir -p "$BACKUP_DIR"

# Perform backup
mysqldump -u "$DB_USER" -p"$DB_PASS" -h "$DB_HOST" "$DB_NAME" > "$BACKUP_FILE"

# Verify backup success
if [ $? -eq 0 ]; then
    echo "✅ Backup successful: $BACKUP_FILE"
else
    echo "❌ Backup failed!"
    exit 1
fi
