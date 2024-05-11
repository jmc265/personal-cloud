'use strict'
const assert = require('assert')
const Catchment = require('catchment')
const fs = require('fs')
const makePromise = require('makepromise')
const os = require('os')
const path = require('path')
const spawnCommand = require('spawncommand')
const wrote = require('../../src/')

const FIXTURES_DIR = path.join(__dirname, '../fixtures/')
const FIXTURES_TEST_DIR = path.join(FIXTURES_DIR, 'directory')

const TEST_NAME = `wrote-test-${Math.floor(Math.random() * 1e5)}.data`
const createTempFilePath = () => {
    return path.join(os.tmpdir(), TEST_NAME)
}

function assertFileDoesNotExist(filepath) {
    return makePromise(fs.stat, filepath)
        .then(() => {
            throw new Error('should have been rejected')
        }, (err) => {
            assert(/^ENOENT: no such file or directory/.test(err.message))
        })
}

function assertFileExists(filepath) {
    return makePromise(fs.stat, filepath)
}

function assertCanWriteFile(filePath) {
    const testData = `some-test-data-${Date.now()}`
    return wrote(filePath)
        .then((ws) => {
            return wrote.write(ws, testData)
        })
        .then(() => {
            const rs = fs.createReadStream(filePath)
            const catchment = new Catchment()
            rs.pipe(catchment)
            return catchment.promise
        })
        .then((res) => {
            assert.equal(res, testData)
        })
}

const TEMP_DIR = path.join(__dirname, '../temp')
const TEST_DIR_NAME = '_tests'
const TEST_DIR_NOX_NAME = 'no-execute'
const TEMP_TEST_DIR = path.join(TEMP_DIR, TEST_DIR_NAME)
const TEMP_NOX_DIR = path.join(TEMP_DIR, TEST_DIR_NOX_NAME)

function WroteContext() {
    Object.assign(this, {
        TEST_NAME,
        TEST_DATA: 'some test data for temp file',
    })
    let tempFileWs
    Object.defineProperties(this, {
        tempFile: {
            get: () => {
                return this._tempFile || createTempFilePath()
            },
        },
        createTempFileWithData: {
            value: () => {
                const tempFile = createTempFilePath()
                return wrote(tempFile)
                    .then((ws) => {
                        tempFileWs = ws
                        return wrote.write(ws, this.TEST_DATA)
                    })
                    .then(() => {
                        this._tempFile = tempFile
                    })
            },
        },
        assertFileDoesNotExist: {
            get: () => assertFileDoesNotExist,
        },
        assertFileExists: {
            get: () => assertFileExists,
        },
        assertCanWriteFile: {
            get: () => assertCanWriteFile,
        },
        TEMP_DIR: {
            get: () => TEMP_DIR,
        },
        FIXTURES_TEST_DIR: {
            get: () => FIXTURES_TEST_DIR,
        },
        READ_DIR: {
            get: () => TEMP_DIR,
        },
        TEMP_TEST_DIR: {
            get: () => {
                if (!this._TEMP_TEST_DIR) {
                    throw new Error('Temp dir was not created')
                }
                return this._TEMP_TEST_DIR
            },
        },
        TEMP_NOX_DIR: {
            get: () => {
                if (!this._TEMP_NOX_DIR) {
                    throw new Error('Call makeNoExecutableDirectory to access this property first')
                }
                return this._TEMP_NOX_DIR
            },
        },
        makeNoExecutableDirectory: {
            value: () => {
                if (this._TEMP_NOX_DIR) {
                    return Promise.reject(new Error('No executable directory already created'))
                }
                return makePromise(fs.mkdir, [TEMP_NOX_DIR, 0o666])
                    .then(() => {
                        this._TEMP_NOX_DIR = TEMP_NOX_DIR
                    })
                    .catch((err) => {
                        if (/EEXIST/.test(err.message)) {
                            throw new Error('WroteContext: Could not make no executable '
                                + 'directory: it already exists')
                        }
                    })
            },
        },
        _destroy: { value: () => {
            const promises = []
            if (this._TEMP_TEST_DIR) {
                const pc = spawnCommand('rm', ['-rf', this._TEMP_TEST_DIR])
                promises.push(pc.promise)
            }
            if (this._TEMP_NOX_DIR) {
                const pc2 = spawnCommand('rm', ['-rf', this._TEMP_NOX_DIR])
                promises.push(pc2.promise)
            }
            if (tempFileWs) {
                const promise = wrote.erase(tempFileWs)
                promises.push(promise)
            }
            // remove temp file
            return Promise.all(promises)
        }},
    })

    // always make temp dir available
    const pc = spawnCommand('rm', ['-rf', TEMP_TEST_DIR])
    return pc.promise
        .then(() => {
            return makePromise(fs.mkdir, [TEMP_TEST_DIR, 0o777])
        })
        .then(() => {
            this._TEMP_TEST_DIR = TEMP_TEST_DIR
        })
        .catch((err) => {
            if (/EEXIST/.test(err.message)) {
                throw new Error('WroteContext: Could not make temp test '
                    + 'directory: it already exists')
            }
            throw err
        })
}

module.exports = WroteContext
