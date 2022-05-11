#!/bin/bash
set -ex

bash ${HOME_SERVER_DIR}/backup/backupLocal.sh
bash ${HOME_SERVER_DIR}/backup/backupCloud.sh
