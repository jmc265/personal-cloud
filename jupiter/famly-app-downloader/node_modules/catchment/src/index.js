'use strict'

const Writable = require('stream').Writable

function joinBufferData(array) {
    return array.join('')
}

class Catchment extends Writable {
    constructor(options) {
        super(options)
        this._caughtData = []
        this._promise = new Promise((resolve, reject) => {
            this.on('finish', () => {
                const data = joinBufferData(this._caughtData)
                resolve(data)
            })
            this.on('error', reject)
        })
    }
    _write(chunk, encoding, callback) {
        this._caughtData.push(chunk)
        callback()
    }
    get promise() {
        return this._promise
    }
}

module.exports = Catchment
