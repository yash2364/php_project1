#!/bin/bash

# Ensure the script is executable
chmod +x "$0"

# Database credentials
DB_USER="pma"
DB_PASS="Y@sh23647966"  # 🔹 Directly using the password
DB_HOST="192.168.92.110"
DB_NAME="php_ecom"
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
