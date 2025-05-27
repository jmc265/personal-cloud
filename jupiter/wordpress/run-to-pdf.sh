#!/bin/bash

docker run -i --init --cap-add=SYS_ADMIN -v ${PRIMARY_STORAGE}/media/our-story:/home/pptruser/output --rm ghcr.io/puppeteer/puppeteer:latest node -e "$(cat ${PERSONAL_CLOUD_DIR}/jupiter/wordpress/to-pdf.js)"