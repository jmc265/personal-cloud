#!/bin/bash
set -ex

echo "Backup.sh - start" >> ${PERSONAL_CLOUD_DIR}/backup-log
echo "Backup.sh - start local" >> ${PERSONAL_CLOUD_DIR}/backup-log
bash ${PERSONAL_CLOUD_DIR}/backup/backupLocal.sh
echo "Backup.sh - end local" >> ${PERSONAL_CLOUD_DIR}/backup-log
echo "Backup.sh - start cloud" >> ${PERSONAL_CLOUD_DIR}/backup-log
bash ${PERSONAL_CLOUD_DIR}/backup/backupCloud.sh
echo "Backup.sh - end cloud" >> ${PERSONAL_CLOUD_DIR}/backup-log
