#!/bin/bash

MYSQL_USER="ci_user"
MYSQL_PASSWORD="${MYSQL_PASSWORD}"
MYSQL_HOST="192.168.29.245"
MYSQL_PORT="3306"
MYSQL_DB="php_ecom"

LATEST_BACKUP=$(ls -t backups/php_ecom_backup_*.sql | head -n 1)

if [ -z "$LATEST_BACKUP" ]; then
    echo "❌ No backup files found!"
    exit 1
fi

mysql -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER --password="$MYSQL_PASSWORD" $MYSQL_DB < $LATEST_BACKUP

if [ $? -eq 0 ]; then
    echo "✅ Database restored successfully from $LATEST_BACKUP"
else
    echo "❌ Database restore failed!"
    exit 1
fi
