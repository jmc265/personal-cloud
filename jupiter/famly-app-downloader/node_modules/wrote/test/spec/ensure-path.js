const assert = require('assert')
const path = require('path')
const ensurePath = require('../../src/ensure-path')
const context = require('../context/WroteContext')

const ensurePathTestSuite = {
    context,
    'should create a path to the file': (ctx) => {
        const tempPath = path.join(ctx.TEMP_TEST_DIR, 'path/to/temp/file.data')
        return ensurePath(tempPath)
            .then((res) => {
                assert.equal(res, tempPath)
                return ctx.assertCanWriteFile(tempPath)
            })
    },
    'should reject when trying to create a path where cannot': (ctx) => {
        return ctx.makeNoExecutableDirectory()
            .then(() => {
                const tempPath = path.join(ctx.TEMP_NOX_DIR, 'path/to/temp/file.data')
                return ensurePath(tempPath)
            })
            .then(() => {
                throw new Error('should have thrown an error')
            })
            .catch((err) => {
                if(!/EACCES/.test(err.message)) {
                    throw err
                }
            })
    },
    'should not throw an error when dir already exists': (ctx) => {
        const tempPath = path.join(ctx.TEMP_TEST_DIR, 'file.data')
        return ensurePath(tempPath)
            .then((res) => {
                assert.equal(res, tempPath)
                return ctx.assertCanWriteFile(tempPath)
            })
    },
}

module.exports = ensurePathTestSuite
