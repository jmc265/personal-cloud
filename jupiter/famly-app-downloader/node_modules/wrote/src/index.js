const wrote = require('./wrote')
const ensurePath = require('./ensure-path')
const write = require('./write')
const erase = require('./erase')
const read = require('./read')
const readDir = require('./read-dir')

wrote.ensurePath = ensurePath
wrote.write = write
wrote.erase = erase
wrote.read = read
wrote.readDir = readDir

module.exports = wrote
