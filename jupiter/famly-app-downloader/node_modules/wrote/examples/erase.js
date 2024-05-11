const Writable = require('stream').Writable
const path = require('path')
const wrote = require('../')

const HOME_DIR = require('os').homedir()

const file = path.join(HOME_DIR, `wrote-${Math.floor(Math.random() * 1e5)}.data`)

wrote(file)
    .then((ws) => {
        console.log(ws instanceof Writable) // true
        console.log(ws.writable) // true
        console.log(ws.path) // ~/wrote-35558.data
        return wrote.erase(ws)
    })
    .then((ws) => {
        console.log(ws.path) // ~/wrote-35558.data, but no longer exists
        console.log(ws.writable) // false
    })
    .catch(console.error)
