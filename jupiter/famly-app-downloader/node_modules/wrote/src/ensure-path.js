const fs = require('fs')
const makePromise = require('makepromise')
const path = require('path')

/**
 * Make sure that a file can be created by making all directories to which it belongs
 * @param {string} filePath Path to the file
 * @resolves {filePath} Resolves with given filepath
 * @rejects {Error} Rejects when a first folder in the path is non-executable
 */
function ensurePath(filePath) {
    const dirname = path.dirname(filePath)
    return make(dirname)
        .then(() => {
            return filePath
        })
        .catch((err) => {
            if (/EEXIST/.test(err.message) && err.message.indexOf(dirname) != -1) {
                return filePath
            }
            throw err
        })
}

/**
 * Recursive promise-based mkdir.
 * @param {string} dir Path to the directory to be created
 */
function make(dir) {
    return makeDir(dir)
        .catch((err) => {
            if (/ENOENT/.test(err.message)) {
                const parentDir = path.dirname(dir)
                return make(parentDir)
                    .then(() => {
                        return make(dir)
                    })
            }
            throw err
        })
}

/**
 * Promisified fs.mkdir
 * @param {string} dir directory name
 * @resolves {string} created directory name
 */
function makeDir(dir) {
    return makePromise(fs.mkdir, dir, dir)
}

module.exports = ensurePath
