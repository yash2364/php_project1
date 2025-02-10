#!/bin/bash

echo "🔄 Starting database backup..."

# Environment Variables
MYSQL_USER="ci_user"
MYSQL_PASSWORD="${MYSQL_PASSWORD}"
MYSQL_HOST="192.168.92.110"
MYSQL_PORT="3306"
MYSQL_DB="php_ecom"
BACKUP_DIR="backups"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="${BACKUP_DIR}/php_ecom_backup_${TIMESTAMP}.sql"

# Ensure backup directory exists
mkdir -p ${BACKUP_DIR}

# Run backup
mysqldump -h ${MYSQL_HOST} -P ${MYSQL_PORT} -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DB} > ${BACKUP_FILE}

# Check success
if [ $? -eq 0 ]; then
    echo "✅ Backup successful: ${BACKUP_FILE}"
else
    echo "❌ Backup failed!"
    exit 1
fi
