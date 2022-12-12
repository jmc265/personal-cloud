#!/bin/node
const fs = require('fs');
const path = require('path');

const srcFolder = `${process.env.PRIMARY_STORAGE}/media/sync`;
const destFolderParent = `${process.env.PRIMARY_STORAGE}/media/home`;
const destFolderUnsorted = `${destFolderParent}/Unsorted`;

function *walkSync(dir) {
  const files = fs.readdirSync(dir, { withFileTypes: true });
  for (const file of files) {
    if (file.isDirectory()) {
      yield* walkSync(path.join(dir, file.name));
    } else {
      yield { dir, file: file.name };
    }
  }
}

const srcFiles = [...walkSync(srcFolder)].filter((srcFile) => !srcFile.file.startsWith('.'));
const destFiles = [...walkSync(destFolderParent)];
const missingFiles = srcFiles.filter((srcFile) => !destFiles.some((destFile) => destFile.file === srcFile.file));

missingFiles.forEach((missingFile) => 
    fs.copyFile(`${missingFile.dir}/${missingFile.file}`, 
            `${destFolderUnsorted}/${missingFile.file}`,
            (err) => {
                if (err) {
                    console.error(err);
                } else {
                    console.log(`Copied ${missingFile.file}`);
                }
            }));

console.log("Finished");
