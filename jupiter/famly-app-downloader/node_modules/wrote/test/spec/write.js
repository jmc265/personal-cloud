const Readable = require('stream').Readable
const Writable = require('stream').Writable
const assert = require('assert')
const Catchment = require('catchment')
const write = require('../../src/write')

function createWs(nextArg) {
    const allData = []
    const allRawData = []
    const ws = new Writable({
        write: (chunk, encoding, next) => {
            allData.push(String(chunk))
            allRawData.push(chunk)
            next(nextArg)
        },
    })
    return { ws, allData, allRawData }
}

const writeTestSuite = {
    'should write a string to the stream': () => {
        const testString = 'hello world'
        const ws = createWs()
        return write(ws.ws, testString)
            .then(() => {
                assert.deepEqual(ws.allData, [
                    testString,
                ])
                assert(!ws.writable)
            })
    },
    'should pipe a readable to the stream': () => {
        const testString = 'hello world'
        const ws = createWs()
        const rs = new Readable({
            read: () => {
                rs.push(testString)
                rs.push(null)
            },
        })
        return write(ws.ws, rs)
            .then((res) => {
                assert.deepEqual(ws.allData, [
                    testString,
                ])
                assert(res._writableState.ended)
                assert.strictEqual(res, ws.ws)
            })
    },
    'should reject when reabable is not readable': () => {
        const testString = 'hello world'
        const ws = createWs()
        const rs = new Readable({
            read: () => {
                rs.push(testString)
                rs.push(null)
            },
        })
        const catchment = new Catchment()
        rs.pipe(catchment)
        return catchment.promise
            .then(() => {
                return write(ws.ws, rs)
            })
            .then(() => {
                throw new Error('Should have been rejected')
            }, (err) => {
                if (!/Stream is not readable/.test(err.message)) {
                    throw err
                }
            })
    },
    'should reject with an error when readable throws': () => {
        const ws = createWs()
        const error = new Error('test-error')
        const rs = new Readable({
            read() {
                process.nextTick(() => this.emit('error', error))
                return
            },
        })
        return write(ws.ws, rs)
            .then(() => {
                throw new Error('Should have been rejected')
            }, (err) => {
                assert.strictEqual(err, error)
            })
    },
    'should reject when writable throws': () => {
        const testString = 'hello world'
        const error = new Error('test-error')
        const ws = createWs(error)
        const rs = new Readable({
            read: () => {
                rs.push(testString)
                rs.push(null)
            },
        })
        return write(ws.ws, rs)
            .then(() => {
                throw new Error('Should have been rejected')
            }, (err) => {
                assert.strictEqual(err, error)
            })
    },
    'should write nothing when null given': () => {
        const ws = createWs()
        return write(ws.ws, null)
            .then(() => {
                assert.deepEqual(ws.allData, [])
                assert(!ws.writable)
            })
    },
    'should write buffer': () => {
        const testString = 'hello world'
        const buffer = Buffer.from(testString)
        const ws = createWs()
        return write(ws.ws, buffer)
            .then(() => {
                assert.deepEqual(ws.allRawData, [
                    buffer,
                ])
                assert(!ws.writable)
            })
    },
    'should reject if writable is not Writable': () => {
        return write('string')
            .then(() => {
                throw new Error('Should have been rejected')
            }, (err) => {
                if (!/Writable stream expected/.test(err.message)) {
                    throw err
                }
            })
    },
}

module.exports = writeTestSuite
