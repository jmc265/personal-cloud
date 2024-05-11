const assert = require('assert')
const readDir = require('../../src/read-dir')
const context = require('../context/WroteContext')
const expected = require('../fixtures/expected/read-dir')

const readDirTestSuite = {
    context,
    'should read a directory': (ctx) => {
        return readDir(ctx.FIXTURES_TEST_DIR)
            .then((res) => {
                assert.deepEqual(res, expected.normal)
            })
    },
    'should read a directory recursively': (ctx) => {
        return readDir(ctx.FIXTURES_TEST_DIR, true)
            .then((res) => {
                assert.deepEqual(res, expected.recursive)
            })
    },
    'should reject promise if directory is not found': () => {
        const dirname = `${Math.floor(Math.random() * 1e5)}.data`
        return readDir(dirname)
            .then(() => {
                throw new Error('should have thrown an error')
            }, (err) => {
                if (!/ENOENT/.test(err.message)) {
                    throw err
                }
            })
    },
    'should reject promise if not a directory': (ctx) => {
        return ctx.createTempFileWithData()
            .then(() => {
                return readDir(ctx.tempFile)
            })
            .then(() => {
                throw new Error('should have thrown an error')
            }, (err) => {
                if (!/ENOTDIR/.test(err.message)) {
                    throw err
                }
            })
    },
    'should throw if path is not a string': () => {
        return readDir()
            .then(() => {
                throw new Error('should have thrown an error')
            }, (err) => {
                if (!/path must be a string/.test(err.message)) {
                    throw err
                }
            })
    },
}

module.exports = readDirTestSuite
