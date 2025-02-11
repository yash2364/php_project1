#!/bin/bash

MYSQL_USER="ci_user"
MYSQL_PASSWORD="${MYSQL_PASSWORD}"
MYSQL_HOST="192.168.29.245"
MYSQL_PORT="3306"
MYSQL_DB="php_ecom"

BACKUP_DIR="backups"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="$BACKUP_DIR/php_ecom_backup_$TIMESTAMP.sql"

mkdir -p $BACKUP_DIR

mysqldump -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER --password="$MYSQL_PASSWORD" $MYSQL_DB > $BACKUP_FILE

if [ $? -eq 0 ]; then
    echo "✅ Backup successful: $BACKUP_FILE"
else
    echo "❌ Backup failed!"
    exit 1
fi

ls -t $BACKUP_DIR/php_ecom_backup_*.sql | tail -n +6 | xargs rm -f
