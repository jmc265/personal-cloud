"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.getAllFavouritePhotosForMonth = void 0;
const child_process_1 = require("child_process");
const path_1 = __importDefault(require("path"));
const fs_1 = __importDefault(require("fs"));
const SQL_PASSWORD = process.env.SQL_PASSWORD;
const DOCKER_APP_DATA = process.env.DOCKER_APP_DATA;
const PHOTO_BASE_DIR = `${process.env.PRIMARY_STORAGE}/media/home`;
const PHOTO_SIDECAR_BASE_DIR = `${DOCKER_APP_DATA}/photoprism/sidecar/photos`;
function getFilePath(file) {
    const originalFilePath = `${PHOTO_BASE_DIR}/${file.dir}/${file.base}`;
    const sidecarFilePath = `${PHOTO_SIDECAR_BASE_DIR}/${file.dir}/${file.base}`;
    if (fs_1.default.existsSync(originalFilePath)) {
        return originalFilePath;
    }
    else if (fs_1.default.existsSync(sidecarFilePath)) {
        return sidecarFilePath;
    }
}
function getAllFavouritePhotosForMonth(date) {
    // Get all faves
    const sql = `SELECT file_name FROM files JOIN photos on files.photo_id = photos.id WHERE photos.photo_favorite = '1' AND YEAR(taken_at) = ${date.getFullYear()} AND MONTH(taken_at) = ${date.getMonth() + 1};`;
    const dockerCommand = `docker exec mariadb mariadb --user root -p${SQL_PASSWORD} -D photoprism -N -t -e "${sql}"`;
    const cmdResponse = (0, child_process_1.execSync)(dockerCommand);
    const sqlResponse = cmdResponse.toString();
    const files = sqlResponse
        .split("\n")
        .filter((line) => !line.startsWith("+--"))
        .map((line) => line.split("|")[1])
        .filter((file) => file != undefined)
        .map((file) => file.trim())
        .map((file) => file.replace("photos/", ""))
        .map((file) => path_1.default.parse(file))
        .filter((file) => file.ext !== ".ARW")
        .filter((file) => file.ext !== ".pp3")
        .filter((file) => !file.base.endsWith('.mp4.jpg'))
        .filter((file) => !file.base.endsWith('_original'))
        .filter((file) => !file.base.endsWith('.ARW.xmp'))
        .map((file) => getFilePath(file))
        .filter(Boolean);
    return files;
}
exports.getAllFavouritePhotosForMonth = getAllFavouritePhotosForMonth;
