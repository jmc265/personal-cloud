import { exec } from "child_process";

const SQL_PASSWORD = process.env.SQL_PASSWORD;

async function executeSql(sql: string): Promise<any> {
    const dockerCommand = `docker exec mariadb mariadb --user root -p${SQL_PASSWORD} -D photoprism -N -t -e "${sql}"`;
    return new Promise((resolve, reject) => {
        exec(dockerCommand, (error, stdout, stderr) => {
            if (error) {
                reject(error);
            } else if (stderr) {
                reject(stderr);
            } else {
                resolve(stdout);
            }
        });
    });
}

async function getImageDescriptionUpdates(): Promise<{file_name: string, photo_description: string}[]> {
    const sql = `SELECT files.file_name, photos.photo_description FROM photos JOIN files ON files.photo_id = photos.id WHERE photos.description_src='manual';`
    const sqlResponse: string = await executeSql(sql);
    return sqlResponse.split("\n")
        .filter(line => !line.startsWith("+--"))
        .map(line => {
console.log(line);
            const values = line.split("|");
            return {
                file_name: values[1],
                photo_description: values[2]
            }   
        });
}

async function main() {
    const res = await getImageDescriptionUpdates();
    console.log(res);
}

main();
