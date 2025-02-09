#!/bin/bash

echo "🔄 Starting database restore..."

# Environment Variables
MYSQL_USER="root"
MYSQL_PASSWORD="${MYSQL_PASSWORD}"
MYSQL_HOST="127.0.0.1"
MYSQL_DB="php_ecom"
BACKUP_DIR="backups"

# Find the latest backup
LATEST_BACKUP=$(ls -t ${BACKUP_DIR}/php_ecom_backup_*.sql | head -1)

if [ -z "$LATEST_BACKUP" ]; then
    echo "❌ No backup file found!"
    exit 1
fi

# Restore database
mysql -h ${MYSQL_HOST} -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DB} < ${LATEST_BACKUP}

# Check success
if [ $? -eq 0 ]; then
    echo "✅ Restore successful from: ${LATEST_BACKUP}"
else
    echo "❌ Restore failed!"
    exit 1
fi
