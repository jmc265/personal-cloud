import { exec } from "child_process";
import * as fs from "fs";
import { promisify } from "util";
// @ts-ignore
import * as exiftool from "node-exiftool";
// @ts-ignore
import exiftoolBin from "dist-exiftool";

const SQL_PASSWORD = process.env.SQL_PASSWORD;
const PHOTO_BASE_DIR = `${process.env.PRIMARY_STORAGE}/media/home/`

async function executeSql(sql: string): Promise<string> {
    const dockerCommand = `docker exec mariadb mariadb --user root -p${SQL_PASSWORD} -D photoprism -N -t -e "${sql}"`;
    try {
        const cmdResponse = await promisify(exec)(dockerCommand);
        if (cmdResponse.stderr) {
            throw cmdResponse.stderr;
        }
        return cmdResponse.stdout;
    } catch (e) {
        console.error(`Error in executeSql. CMD: ${dockerCommand}. Error: ${e}`);
        throw e;
    }
}

async function getImageDescriptionUpdates(): Promise<{fileName: string, photoDescription: string}[]> {
    const sql = `SELECT files.file_name, photos.photo_description FROM photos JOIN files ON files.photo_id = photos.id WHERE photos.description_src='manual';`
    const sqlResponse: string = await executeSql(sql);
    return sqlResponse.split("\n")
        .filter(line => !line.startsWith("+--"))
        .filter(line => line.trim().length > 0)
        .map(line => {
            const values = line.split("|");
            return {
                fileName: values[1].trim(),
                photoDescription: values[2].trim()
            }
        });
}

async function updateFileExifData(fileName: string, photoDescription: string) {
    const fileNameOnDisk = fileName.replace("photos/", PHOTO_BASE_DIR);
    try {
        // Check file exists and is writeable
        await promisify(fs.access)(fileNameOnDisk, fs.constants.F_OK | fs.constants.W_OK);
        // Alter exif data
        const ep = new exiftool.ExiftoolProcess(exiftoolBin);
        await ep.open();
        const exif = await ep.readMetadata(fileNameOnDisk);
        console.log(exif);
    } catch (err: any) {
        console.error(`${fileNameOnDisk} ${err.code === 'ENOENT' ? 'does not exist' : 'is read-only'}`);
        throw err;
    }
}

async function main() {
    const pendingUpdates = await getImageDescriptionUpdates();
    await Promise.all(pendingUpdates.map(({fileName, photoDescription}) => updateFileExifData(fileName, photoDescription)));
}

main();
