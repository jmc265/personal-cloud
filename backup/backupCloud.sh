#!/bin/bash
set -ex

# Environments
BORG_REPO_DIR="${SECONDARY_STORAGE}/backups/borg"
RCLONE_DEST="azure:jcx-jupiter-backup"

do_backup() {
    # Rclone repo to cloud
    docker run \
        --rm \
        -v $BORG_REPO_DIR:/backup:ro \
        -v $DOCKER_APP_DATA/rclone/config:/config/rclone:ro \
        -v $DOCKER_APP_DATA/rclone/logs:/logs \
        --name rclone-azure-sync \
        rclone/rclone \
        sync /backup $RCLONE_DEST --stats 0 -v 2>&1 \
        --links
}

echo "BackupCloud.sh - start" >> ${PERSONAL_CLOUD_DIR}/backup-log
# Start Healthcheck
curl -m 30 --retry 5 http://${LOCAL_DOMAIN}:9320/ping/7RCO56bYw4AsO0AxcmencA/nightly-backup-azure/start

echo "BackupCloud.sh - start do_backup" >> ${PERSONAL_CLOUD_DIR}/backup-log
# Do backup
BACKUP_OUTPUT=$(do_backup 2>&1)

echo "BackupCloud.sh - end do_backup" >> ${PERSONAL_CLOUD_DIR}/backup-log

# Complete HealthCheck
curl -fsS -m 30 --retry 10 --retry-delay 60 --data-raw "$BACKUP_OUTPUT" http://${LOCAL_DOMAIN}:9320/ping/7RCO56bYw4AsO0AxcmencA/nightly-backup-azure/$?

echo "BackupCloud.sh - end" >> ${PERSONAL_CLOUD_DIR}/backup-log