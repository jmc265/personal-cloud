# Borg

Used to create snapshots of a source directory. The snapshots are pruned 

[Borg docker image](https://github.com/pschiffe/docker-borg)
[Borg Commands](https://borgbackup.readthedocs.io/en/stable/usage/general.html)

## List all backups in the repo:

```shell
BORG_REPO_DIR="${PRIMARY_BACKUP_STORAGE}/backups/borg"
docker run \
  --rm \
  -e BORG_REPO=/borg/repo \
  -e BORG_PASSPHRASE=$BORG_REPO_PASSWORD \
  -e BORG_PARAMS='list' \
  -v ${DOCKER_APP_DATA}/borg/config:/root \
  -v $BORG_REPO_DIR:/borg/repo \
  --name borg-backup \
  pschiffe/borg
```

## List all files in a backup:

```shell
BORG_REPO_DIR="${PRIMARY_BACKUP_STORAGE}/backups/borg"
ARCHIVE_NAME="43bd2f53a177_2022-06-09"
docker run \
  --rm \
  -e BORG_REPO=/borg/repo \
  -e BORG_PASSPHRASE=$BORG_REPO_PASSWORD \
  -e BORG_PARAMS="list /borg/repo::${ARCHIVE_NAME}" \
  -v ${DOCKER_APP_DATA}/borg/config:/root \
  -v $BORG_REPO_DIR:/borg/repo \
  --name borg-backup \
  pschiffe/borg
```

## Extract a backup:

```shell
BORG_REPO_DIR="${PRIMARY_BACKUP_STORAGE}/backups/borg"
EXTRACT_DEST="${PRIMARY_BACKUP_STORAGE}/backups/restore"
ARCHIVE_NAME="43bd2f53a177_2022-06-09"
docker run \
  --rm \
  -e BORG_REPO=/borg/repo \
  -e ARCHIVE=$ARCHIVE_NAME \
  -e BORG_PASSPHRASE=$BORG_REPO_PASSWORD \
  -e EXTRACT_TO=/borg/restore \
  -v ${DOCKER_APP_DATA}/borg/config:/root \
  -v $EXTRACT_DEST:/borg/restore \
  -v $BORG_REPO_DIR:/borg/repo \
  --name borg-backup \
  pschiffe/borg
```

## Extract a single file from backup:

```shell
BORG_REPO_DIR="${PRIMARY_BACKUP_STORAGE}/backups/borg"
EXTRACT_DEST="${PRIMARY_BACKUP_STORAGE}/backups/restore"
ARCHIVE_NAME="43bd2f53a177_2022-06-09"
FILE_NAME="borg/src/primary/workspace/personal-cloud/jupiter/home-tracker/cal.ics"
docker run \
  --rm \
  -e BORG_REPO=/borg/repo \
  -e ARCHIVE=$ARCHIVE_NAME \
  -e BORG_PASSPHRASE=$BORG_REPO_PASSWORD \
  -e EXTRACT_TO=/borg/restore \
  -e EXTRACT_WHAT=$FILE_NAME \
  -v ${DOCKER_APP_DATA}/borg/config:/root \
  -v $EXTRACT_DEST:/borg/restore \
  -v $BORG_REPO_DIR:/borg/repo \
  --name borg-backup \
  pschiffe/borg
```

## Export the repo key:
```shell
BORG_REPO_DIR="${PRIMARY_BACKUP_STORAGE}/backups/borg"
docker run \
  --rm \
  -e BORG_REPO=/borg/repo \
  -e BORG_PASSPHRASE=$BORG_REPO_PASSWORD \
  -e BORG_PARAMS='key export /borg/repo /borg/keyexport/borg_exported_key' \
  -v ${DOCKER_APP_DATA}/borg/config:/root \
  -v $BORG_REPO_DIR:/borg/repo \
  -v $(pwd):/borg/keyexport \
  --name borg-backup \
  pschiffe/borg
sudo cat ./borg_exported_key
```

## Break the lock
```shell
BORG_REPO_DIR="${PRIMARY_BACKUP_STORAGE}/backups/borg"
docker run \
  --rm \
  -e BORG_REPO=/borg/repo \
  -e BORG_PASSPHRASE=$BORG_REPO_PASSWORD \
  -e BORG_PARAMS='break-lock' \
  -v ${DOCKER_APP_DATA}/borg/config:/root \
  -v $BORG_REPO_DIR:/borg/repo \
  --name borg-backup \
  pschiffe/borg
```

# Rclone

Used to send the Borg snapshots to a cloud provider

## Create config:

```shell
docker run -it --rm -v ${PRIMARY_STORAGE}/docker/rclone/config:/config/rclone rclone/rclone config

az ad sp create-for-rbac --name "<name>" \
      --role "Storage Blob Data Owner" \
      --scopes "/subscriptions/<subscription>/resourceGroups/<resource-group>/providers/Microsoft.Storage/storageAccounts/<storage-account>/blobServices/default/containers/<container>" \
      > azure-principal.json
```