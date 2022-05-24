#!/bin/bash
set -ex

bash ${PERSONAL_CLOUD_DIR}/jupiter/backup/backupLocal.sh
bash ${PERSONAL_CLOUD_DIR}/jupiter/backup/backupCloud.sh
