const assert = require('assert')
const Writable = require('stream').Writable
const wrote = require('../')

const testString = 'hello world'
const buffer = Buffer.from(testString)
const allRawData = []
const ws = new Writable({
    write: (chunk, encoding, next) => {
        allRawData.push(chunk)
        next()
    },
})
wrote.write(ws, buffer)
    .then(() => {
        console.log(allRawData.map(d => String(d)))
        assert.deepEqual(allRawData, [
            buffer,
        ])
    })
    .catch(console.error)
