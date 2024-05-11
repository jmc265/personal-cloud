const fs = require('fs')
const os = require('os')
const path = require('path')
const TEMP_DIR = os.tmpdir()

function openFileForWrite(filepath) {
    return new Promise((resolve, reject) => {
        const ws = fs.createWriteStream(filepath, {
            flags: 'w',
            defaultEncoding: 'utf8',
            fd: null,
            mode: 0o666,
            autoClose: true,
        })
        ws.once('open', () => resolve(ws))
        ws.once('error', reject)
    })
}

function getTempFile() {
    const rnd = Math.ceil(Math.random() * 100000)
    const tempFile = path.join(TEMP_DIR, `wrote-${rnd}.data`)
    return tempFile
}

/**
 * Open the file for writing and create a write stream.
 * @param {string} ffile path to the file
 * @returns {Promise<Writable>} A promise with the stream
 */
function wrote(file) {
    const _file = (typeof file).toLowerCase() === 'string' ?
        file : getTempFile()
    return openFileForWrite(_file)
}

module.exports = wrote
