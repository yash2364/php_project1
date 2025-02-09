#!/bin/bash

# Load environment variables
MYSQL_USER="pma"
MYSQL_PASSWORD="${MYSQL_PASSWORD}"
MYSQL_HOST="127.0.0.1"
MYSQL_DB="php_ecom"
BACKUP_DIR="backups"

echo "🔄 Starting database restore..."

# Find the latest backup file
LATEST_BACKUP=$(ls -t $BACKUP_DIR/db_backup_*.sql | head -n 1)

if [ -z "$LATEST_BACKUP" ]; then
  echo "❌ No backup file found!"
  exit 1
fi

echo "📂 Restoring from: $LATEST_BACKUP"

# Restore the database
mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST $MYSQL_DB < $LATEST_BACKUP

if [ $? -eq 0 ]; then
  echo "✅ Database restored successfully!"
else
  echo "❌ Restore failed!"
  exit 1
fi
