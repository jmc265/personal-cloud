const assert = require('assert')
const ensurePath = require('../../src/ensure-path')
const erase = require('../../src/erase')
const wrote = require('../../src/index')
const read = require('../../src/read')
const readDir = require('../../src/read-dir')
const write = require('../../src/write')
const api = require('../../')

const apiTestSuite = {
    '0.1.0 should export wrote': () => {
        assert.strictEqual(api, wrote)
    },
    '0.2.0 should export erase': () => {
        assert.strictEqual(api.erase, erase)
    },
    '0.3.0 should export write': () => {
        assert.strictEqual(api.write, write)
    },
    '0.4.0 should export ensurePath': () => {
        assert.strictEqual(api.ensurePath, ensurePath)
    },
    '0.5.0 should export read': () => {
        assert.strictEqual(api.read, read)
    },
    '0.6.0 should export readDir': () => {
        assert.strictEqual(api.readDir, readDir)
    },
}

module.exports = apiTestSuite
