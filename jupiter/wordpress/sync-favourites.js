#!/bin/node
const { execSync } = require("child_process");
const fs = require('fs');
const path = require('path');

const SQL_PASSWORD = process.env.SQL_PASSWORD;
const DOCKER_APP_DATA = process.env.DOCKER_APP_DATA;
const PRIMARY_STORAGE = process.env.PRIMARY_STORAGE;
const PHOTO_BASE_DIR = `${process.env.PRIMARY_STORAGE}/media/home`
const PHOTO_SIDECAR_BASE_DIR = `${DOCKER_APP_DATA}/photoprism/sidecar/photos`;
const UPLOAD_BASE_DIR = `${DOCKER_APP_DATA}/wordpress/html/wp-content/uploads`;
const LAST_SYNC_FILE = `${UPLOAD_BASE_DIR}/.last_sync`;

let alreadySyncedFiles = [];
try {
    alreadySyncedFiles = fs.readFileSync(LAST_SYNC_FILE).toString().split("\n");
} catch (e) {

}

// Get all faves
const sql = `SELECT file_name FROM files JOIN photos on files.photo_id = photos.id WHERE photos.photo_favorite = '1';`;
const dockerCommand = `docker exec mariadb mariadb --user root -p${SQL_PASSWORD} -D photoprism -N -t -e "${sql}"`;
const cmdResponse = execSync(dockerCommand);
const sqlResponse = cmdResponse.toString();
const files = sqlResponse.split("\n")
        .filter(line => !line.startsWith("+--"))
        .map(line => line.split('|')[1])
        .filter(file => file != undefined)
        .map(file => file.trim())
        .map(file => file.replace('photos/', ''))
        .map(file => path.parse(file))
        .filter(file => file.ext !== ".ARW");

// Import files
for (const file of files) {
    console.log(`Importing ${file.base}`);
    if (alreadySyncedFiles.includes(file.base)) {
        console.warn('    Already imported')
        continue;
    }
    const originalFilePath = `${PHOTO_BASE_DIR}/${file.dir}/${file.base}`;
    const sidecarFilePath = `${PHOTO_SIDECAR_BASE_DIR}/${file.dir}/${file.base}`;
    
    let importFile;
    if (fs.existsSync(originalFilePath)) {
        importFile = originalFilePath;
    } else if (fs.existsSync(sidecarFilePath)) {
        importFile = sidecarFilePath;
    } else {
        console.error(`    ${file.dir}/${file.base} does not exist`);
        continue;
    }

    try {
        const importMediaCommand = `docker run --rm -v ${DOCKER_APP_DATA}/wordpress/html:/var/www/html -v ${PRIMARY_STORAGE}/media/home:/${PRIMARY_STORAGE}/media/home:ro -v ${PHOTO_SIDECAR_BASE_DIR}:${PHOTO_SIDECAR_BASE_DIR}:ro --env=WORDPRESS_DB_HOST=wordpress-db --env=WORDPRESS_DB_USER=wordpress --env=WORDPRESS_DB_PASSWORD=${SQL_PASSWORD} --env=WORDPRESS_DB_NAME=wordpress --network=wordpress_default wordpress:cli media import '${importFile}'`;
        const cmdResponse = execSync(importMediaCommand);
        const cmdResponseString = cmdResponse.toString();
        if (cmdResponseString.includes('Success: Imported 1 of 1 items.')) {
            fs.appendFileSync(LAST_SYNC_FILE, file.base + '\n');
            console.log(`    Successfully imported`);
        } else {
            throw new Error(`Docker exec response doesn't notify of success \n ${cmdResponseString}`);
        }
    } catch (e) {
        console.error(`    Error importing file from ${importFile}`, e);
    }
}
