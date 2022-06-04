#!/bin/bash
# Environment variables
DATA_SRC_DIR=${PRIMARY_STORAGE}
DOCKER_SRC_DIR=${DOCKER_APP_DATA}
BORG_DEST_DIR="${PRIMARY_BACKUP_STORAGE}/backups/borg"
RCLONE_DEST="azure:jcx-jupiter-backup"

do_backup() {
    set -ex

    # Do Borg backup with prune
    # Add `--list --filter=AMEC` to COMPRESSION to see files
    # -e BORG_SKIP_CHECK=true \
    docker run \
        --rm \
        -e BORG_REPO=/borg/repo \
        -e BORG_PASSPHRASE=$BORG_REPO_PASSWORD \
        -e BACKUP_DIRS=/borg/src \
        -e EXCLUDE='*/.deleted;*/lost+found;*/downloads' \
        -e COMPRESSION="lz4" \
        -e PRUNE=1 \
        -e KEEP_DAILY=7 \
        -e KEEP_WEEKLY=4 \
        -e KEEP_MONTHLY=6 \
        -v ${DOCKER_APP_DATA}/borg/config:/root \
        -v $BORG_DEST_DIR:/borg/repo \
        -v $DATA_SRC_DIR:/borg/src/primary:ro \
        -v $DOCKER_SRC_DIR:/borg/src/docker:ro \
        --name borg-local-create \
        pschiffe/borg

    # Rclone repo to cloud
    docker run \
        --rm \
        -v $BORG_DEST_DIR:/backup:ro \
        -v $DOCKER_APP_DATA/rclone/config:/config/rclone:ro \
        -v $DOCKER_APP_DATA/rclone/logs:/logs \
        --name rclone-azure-sync \
        rclone/rclone \
        sync /backup $RCLONE_DEST --stats 0 -v 2>&1 \
        --links
}

# Start Healthcheck
curl -m 30 --retry 5 https://${HEALTHCHECKS_URL}/nightly-backup/start

# Stop all running docker containers
pushd ${PERSONAL_CLOUD_DIR}/jupiter
./stop-all.sh

# Do backup
BACKUP_OUTPUT=$(do_backup 2>&1)
BACKUP_EXIT_CODE=$?

# Restart all docker containers
./start-all.sh
popd

# Complete HealthCheck
curl -fsS -m 30 --retry 10 --retry-delay 60 --data-raw "$BACKUP_OUTPUT" https://${HEALTHCHECKS_URL}/nightly-backup/$BACKUP_EXIT_CODE
