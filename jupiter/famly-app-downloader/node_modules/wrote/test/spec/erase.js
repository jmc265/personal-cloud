'use strict'

const assert = require('assert')
const makePromise = require('makepromise')
const erase = require('../../src/erase')
const wrote = require('../../src/wrote')
const WroteContext = require('../context/WroteContext')

const eraseTestSuite = {
    context: WroteContext,
    'should erase passed file': (ctx) => {
        const file = ctx.tempFile
        return wrote(file)
            .then((ws) => {
                return erase(ws)
            })
            .then((ws) => {
                assert(ws.closed) // if node 6+, assert writable == false
                assert.equal(ws.path, file)
            })
            .then(() => ctx.assertFileDoesNotExist(file))
    },
    'should erase temp file': (ctx) => {
        let file
        let writeStream

        return wrote()
            .then((ws) => {
                writeStream = ws
                file = writeStream.path
                return erase(writeStream)
            })
            .then(() => {
                assert(writeStream.closed)
                assert.equal(writeStream.path, file)
            })
            .then(() => ctx.assertFileDoesNotExist(file))
    },
    'should erase file even if stream is closed': (ctx) => {
        const file = ctx.tempFile
        let writeStream
        return wrote(file)
            .then((ws) => {
                writeStream = ws
                return makePromise(writeStream.end.bind(writeStream))
            })
            .then(() => {
                assert(writeStream.closed)
                assert.equal(writeStream.path, file)
            })
            .then(() => ctx.assertFileExists(file))
            .then(() => erase(writeStream))
            .then(() => ctx.assertFileDoesNotExist(file))
    },
}

module.exports = eraseTestSuite
