#!/bin/bash

# Configurations
DB_NAME="php_ecom"
DB_USER="pma"
DB_PASS="Y@sh23647966"
BACKUP_DIR="backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.sql"

# Ensure backup directory exists
mkdir -p $BACKUP_DIR

# Export the database
mysqldump -u$DB_USER -p$DB_PASS $DB_NAME > $BACKUP_FILE

# Verify backup success
if [ $? -eq 0 ]; then
    echo "Database backup successful: $BACKUP_FILE"
else
    echo "Database backup failed!"
    exit 1
fi
