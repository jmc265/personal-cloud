import { exec } from "child_process";
import * as fs from "fs";
import { promisify } from "util";
// @ts-ignore
import * as exiftool from "node-exiftool";
// @ts-ignore
import exiftoolBin from "dist-exiftool";

const SQL_PASSWORD = process.env.SQL_PASSWORD;
const PHOTO_BASE_DIR = `${process.env.PRIMARY_STORAGE}/media/home/`

interface Photo {
    filePath: string;
    description: string;
    isFavourite: boolean;
    faces: string[];
}

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

async function getImageDescriptionUpdates(): Promise<Photo[]> {
    const sql = `SELECT files.file_name, photos.photo_description, photos.photo_favorite FROM photos JOIN files ON files.photo_id = photos.id WHERE (photos.description_src='manual' OR photos.photo_favorite=1) AND files.file_root = '/' AND files.file_missing = 0;`
    const sqlResponse: string = await executeSql(sql);
    return sqlResponse.split("\n")
        .filter(line => !line.startsWith("+--"))
        .filter(line => line.trim().length > 0)
        .map(line => {
            const values = line.split("|");
            return {
                filePath: values[1].trim().replace("photos/", PHOTO_BASE_DIR),
                description: values[2].trim(),
                isFavourite: values[3].trim() === "1",
                faces: []
            }
        });
}

async function updateFileExifData(photo: Photo) {
    let ep;
    try {
        // Check file exists and is writeable
        await promisify(fs.access)(photo.filePath, fs.constants.F_OK | fs.constants.W_OK);

        // Alter exif data
        ep = new exiftool.ExiftoolProcess(exiftoolBin);
        await ep.open();
        let exifUpdates: any = {};
        if (photo.description && photo.description.length > 0) {
            exifUpdates.ImageDescription = photo.description;
        }
        if (photo.isFavourite) {
            exifUpdates.Rating = 5;
        }
        if (photo.faces && photo.faces.length > 0) {
            exifUpdates.PersonInImage = photo.faces;
        }

        const res = await ep.writeMetadata(photo.filePath, exifUpdates, ['preserve']);

        // Check for success
        // Yes, "res.error" contains the success message...
        if (!(<string>res.error).includes("1 image files updated")) {
            throw res.error;
        }
        console.log(`Updated ${photo.filePath} with ${JSON.stringify(exifUpdates)}`);
    } catch (err: any) {
        if (err.code) {
            console.error(`Error in updateFileExifData. File: ${photo.filePath} ${err.code === 'ENOENT' ? 'does not exist' : 'is read-only'}`);
        } else {
            console.error(`Error in updateFileExifData. File: ${photo.filePath}. Error: ${err}`);
        }
        throw err;
    } finally {
        if (ep && ep.isOpen) {
            await ep.close();
        }
    }
}

async function main() {
    const pendingUpdates = await getImageDescriptionUpdates();
    for (const photoUpdate of pendingUpdates) {
        await updateFileExifData(photoUpdate);
    }
}

main();
