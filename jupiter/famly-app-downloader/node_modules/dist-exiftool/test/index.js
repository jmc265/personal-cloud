const path = require('path')
const execFile = require('child_process').execFile
const assert = require('assert')
const exiftool = require('../index')

function exec(file, args) {
    return new Promise((resolve, reject) => {
        execFile(file, args, (err, stdout, stderr) => {
            if (err) return reject(err)
            return resolve({ stdout, stderr })
        })
    })
}

module.exports = {
    'should export a path to current executable': () => {
        if (process.platform === 'win32') {
            const exePath = path.join(__dirname, '../node_modules/exiftool.exe/vendor/exiftool.exe')
            assert.equal(exiftool, exePath)
        } else {
            const plPath = path.join(__dirname, '../node_modules/exiftool.pl/vendor/exiftool')
            assert.equal(exiftool, plPath)
        }
    },
    'should be able to run the executable': () => {
        const stdoutData = 'test-out'
        const stderrData = 'test-err'
        const args = ['-echo', stdoutData, '-echo2', stderrData]
        return exec(exiftool, args)
            .then((res) => {
                assert.equal(res.stdout.trim(), stdoutData)
                assert.equal(res.stderr.trim(), stderrData)
            })
    },
    'should have version 10.53': () => {
        return exec(exiftool, ['-ver'])
            .then((res) => {
                assert.equal(res.stdout.trim(), '10.53')
            })
    },
}
