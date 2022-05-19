#!/bin/bash
set -ex
# Before first sync: create a file a $LAST_SYNC_FILE location: `touch -d @0 $LAST_SYNC_FILE`

SRC_DIR=$PRIMARY_STORAGE/media/sync/
DEST_DIR=$PRIMARY_STORAGE/media/home/Unsorted
LAST_SYNC_FILE=$DEST_DIR/.last_sync

# Find all files modified/created after the last sync time
NEW_FILES=$(find $SRC_DIR -type f -newer $LAST_SYNC_FILE -exec realpath --relative-to=$SRC_DIR {} \;)

# Append date and list of files to the last sync file for logging
echo $(date) >> $LAST_SYNC_FILE
echo "$NEW_FILES" >> $LAST_SYNC_FILE

# Copy over the files that were modified/created
rsync -ahrv --update --files-from=<( printf "%s\0" ${NEW_FILES[@]} ) --from0 $SRC_DIR $DEST_DIR
