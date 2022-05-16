#!/bin/bash
set -ex

bash ${PERSONAL_CLOUD_DIR}/backup/backupLocal.sh
bash ${PERSONAL_CLOUD_DIR}/backup/backupCloud.sh
