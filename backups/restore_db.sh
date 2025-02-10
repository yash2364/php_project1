name: Database Backup & Restore

on:
  schedule:
    - cron: '0 */3 * * *'  # Runs every 3 hours
  workflow_dispatch:  # Allows manual execution

jobs:
  backup_restore:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v3

      - name: Set Executable Permissions
        run: chmod +x backups/backup_db.sh backups/restore_db.sh

      - name: Check MySQL Status
        env:
          MYSQL_HOST: "192.168.92.110"
          MYSQL_PORT: "3306"
          MYSQL_USER: "ci_user"
          MYSQL_PASSWORD: "${{ secrets.MYSQL_PASSWORD }}"
        run: mysqladmin ping -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER --password="$MYSQL_PASSWORD" || exit 1

      - name: Run Backup Script
        env:
          MYSQL_USER: "ci_user"
          MYSQL_PASSWORD: "${{ secrets.MYSQL_PASSWORD }}"
          MYSQL_HOST: "192.168.92.110"
          MYSQL_PORT: "3306"
          MYSQL_DB: "php_ecom"
        run: bash backups/backup_db.sh

      - name: Commit and Push Backup
        run: |
          git config --global user.name "github-actions"
          git config --global user.email "github-actions@github.com"
          git add backups/
          git commit -m "🔄 Database backup: $(date)"
          git push

      - name: Run Restore Script (Optional)
        if: github.event_name == 'workflow_dispatch'
        env:
          MYSQL_USER: "ci_user"
          MYSQL_PASSWORD: "${{ secrets.MYSQL_PASSWORD }}"
          MYSQL_HOST: "192.168.92.110"
          MYSQL_PORT: "3306"
          MYSQL_DB: "php_ecom"
        run: bash backups/restore_db.sh

# Backup script: backups/backup_db.sh
#!/bin/bash

echo "🔄 Starting database backup..."

# Environment Variables
MYSQL_USER="ci_user"
MYSQL_PASSWORD="${MYSQL_PASSWORD}"
MYSQL_HOST="192.168.92.110"
MYSQL_DB="php_ecom"
BACKUP_DIR="backups"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="${BACKUP_DIR}/php_ecom_backup_${TIMESTAMP}.sql"

# Ensure backup directory exists
mkdir -p ${BACKUP_DIR}

# Run backup
mysqldump -h ${MYSQL_HOST} -P 3306 -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DB} > ${BACKUP_FILE}

# Check success
if [ $? -eq 0 ]; then
    echo "✅ Backup successful: ${BACKUP_FILE}"
else
    echo "❌ Backup failed!"
    exit 1
fi

# Restore script: backups/restore_db.sh
#!/bin/bash

echo "🔄 Starting database restore..."

# Environment Variables
MYSQL_USER="ci_user"
MYSQL_PASSWORD="${MYSQL_PASSWORD}"
MYSQL_HOST="192.168.92.110"
MYSQL_DB="php_ecom"
BACKUP_DIR="backups"

# Find the latest backup
LATEST_BACKUP=$(ls -t ${BACKUP_DIR}/php_ecom_backup_*.sql | head -1)

if [ -z "$LATEST_BACKUP" ]; then
    echo "❌ No backup file found!"
    exit 1
fi

# Restore database
mysql -h ${MYSQL_HOST} -P 3306 -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DB} < ${LATEST_BACKUP}

# Check success
if [ $? -eq 0 ]; then
    echo "✅ Restore successful from: ${LATEST_BACKUP}"
else
    echo "❌ Restore failed!"
    exit 1
fi
