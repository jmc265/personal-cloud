#!/bin/bash
set -ex

# Environments
SRC_DIR=${PRIMARY_STORAGE}
RCLONE_DEST_DIR="${SECONDARY_STORAGE}/backups/rclone"
BORG_DEST_DIR="${SECONDARY_STORAGE}/backups/borg"

do_backup() {
    set -ex
    pushd ${PERSONAL_CLOUD_DIR}

    # Stop all running docker containers
    ./stop-all.sh

    # Copy over files from ext2 to ext
    # Can add `-v` to sync command, but then $BACKOUT_OUTPUT is too large and curl errors with "argument list too long"
    docker run \
        --rm \
        -v $SRC_DIR:/src:ro \
        -v $RCLONE_DEST_DIR:/dest \
        -v $DOCKER_APP_DATA/rclone/config:/config/rclone:ro \
        -v $DOCKER_APP_DATA/rclone/logs:/logs \
        --name rclone-local-sync \
        rclone/rclone \
        sync /src /dest --stats 0 --exclude "/downloads/**" 2>&1 \
        --links

    # Restart all docker containers
    ./start-all.sh

    # Do Borg backup with prune
    # Add `--list --filter=AMEC` to COMPRESSION to see files
    # -e BORG_SKIP_CHECK=true \
    docker run \
        --rm \
        -e BORG_REPO=/borg/repo \
        -e BORG_PASSPHRASE=$BORG_REPO_PASSWORD \
        -e BACKUP_DIRS=/borg/data \
        -e EXCLUDE='*/.deleted;*/lost+found;*/downloads' \
        -e COMPRESSION="lz4" \
        -e PRUNE=1 \
        -e KEEP_DAILY=7 \
        -e KEEP_WEEKLY=4 \
        -e KEEP_MONTHLY=6 \
        -v ${DOCKER_APP_DATA}/borg/config:/root \
        -v $BORG_DEST_DIR:/borg/repo \
        -v $RCLONE_DEST_DIR:/borg/data:ro \
        --name borg-local-create \
        pschiffe/borg

    popd
}

# Start Healthcheck
curl -m 10 --retry 5 http://${LOCAL_DOMAIN}:9320/ping/7RCO56bYw4AsO0AxcmencA/nightly-backup-local/start

# Do backup
BACKUP_OUTPUT=$(do_backup 2>&1)

# Complete HealthCheck
curl -fsS -m 10 --retry 10 --retry-delay 60 --data-raw "$BACKUP_OUTPUT" http://${LOCAL_DOMAIN}:9320/ping/7RCO56bYw4AsO0AxcmencA/nightly-backup-local/$?
