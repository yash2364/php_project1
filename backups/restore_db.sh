#!/bin/bash

# MySQL Credentials
DB_NAME="php_ecom"
DB_USER="yash"
DB_PASS="Y@sh236479666965"
LATEST_BACKUP=$(ls -t backups/*.sql | head -1)

# Restore the latest backup
mysql -u$DB_USER -p$DB_PASS $DB_NAME < $LATEST_BACKUP

# Verify restore success
if [ $? -eq 0 ]; then
    echo "✅ Database restored successfully from $LATEST_BACKUP"
else
    echo "❌ Database restore failed!"
    exit 1
fi
