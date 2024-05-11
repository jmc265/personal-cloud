const assert = require('assert')
const context = require('../context/WroteContext')
const read = require('../../src/read')

const readTestSuite = {
    context,
    'should read a file': (ctx) => {
        return ctx.createTempFileWithData()
            .then(() => {
                return read(ctx.tempFile)
            })
            .then((res) => {
                assert.equal(res, ctx.TEST_DATA)
            })
    },
    'should reject if file not found': () => {
        const filename = `${Math.floor(Math.random() * 1e5)}.data`
        return read(filename)
            .then(() => {
                throw new Error('should have been rejected with ENOENT')
            }, (err) => {
                if (/ENOENT/.test(err.message)) {
                    assert(err.message.indexOf(filename) !== -1)
                }
            })
    },
    'should reject if path is not a string': () => {
        return read()
            .then(() => {
                throw new Error('should have been rejected')
            }, (err) => {
                assert(err.message.indexOf('path must be a string') !== -1)
            })
    },
}

module.exports = readTestSuite
