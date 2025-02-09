#!/bin/bash

# Load environment variables
MYSQL_USER="root"
MYSQL_PASSWORD="${MYSQL_PASSWORD}"
MYSQL_HOST="127.0.0.1"
MYSQL_DB="php_ecom"
BACKUP_DIR="backups"
BACKUP_FILE="$BACKUP_DIR/db_backup_$(date +%Y%m%d_%H%M%S).sql"

echo "🔄 Starting database backup..."

# Ensure backup directory exists
mkdir -p $BACKUP_DIR

# Run mysqldump
mysqldump -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST $MYSQL_DB > $BACKUP_FILE

# Check if backup succeeded
if [ $? -eq 0 ]; then
  echo "✅ Backup successful: $BACKUP_FILE"
else
  echo "❌ Backup failed!"
  exit 1
fi

# Optional: Delete backups older than 7 days
find $BACKUP_DIR -type f -name "db_backup_*.sql" -mtime +7 -exec rm {} \;
