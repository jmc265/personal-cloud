'use strict'

const assert = require('assert')
const Writable = require('stream').Writable
const wrote = require('../../src/index')
const WroteContext = require('../context/WroteContext')

const wroteTestSuite = {
    context: WroteContext,
    'should be a function': () => {
        assert(typeof wrote === 'function')
    },
    'should return a promise': () => {
        const res = wrote()
        assert(res instanceof Promise)
        return res.catch(() => {})
    },
    'should resolve with a write stream': () => {
        const res = wrote()
            .then((ws) => {
                assert(ws instanceof Writable)
            })
        return res
    },
    'should open specified file': (ctx) => {
        const file = ctx.tempFile
        return wrote(file)
            .then((ws) => {
                assert.equal(ws.path, file)
                assert(ws instanceof Writable && ws.writable)
            })
    },
    'should be able to stop stream': (ctx) => {
        const file = ctx.tempFile
        return wrote(file)
            .then((ws) => {
                const promise = new Promise((resolve, reject) => {
                    ws.once('close', () => resolve(ws))
                    ws.once('error', reject)
                    ws.close()
                })
                return promise
            })
    },
}


module.exports = {
    wroteTestSuite,
}
