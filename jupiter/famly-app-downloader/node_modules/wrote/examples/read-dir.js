const wrote = require('../')
const path = require('path')

const dirPath = path.join(__dirname, 'directory')

wrote.readDir(dirPath)
    .then((res) => {
        console.log(res)
        // { 'fileA.txt': 'fileA\n',
        //   'fileB.txt': 'fileB\n',
        //   'fileC.txt': 'fileC\n' }
    })
    .catch(console.error)


wrote.readDir(dirPath, true)
    .then((res) => {
        console.log(res)
        // { 'fileA.txt': 'fileA\n',
        //   'fileB.txt': 'fileB\n',
        //   'fileC.txt': 'fileC\n',
        //   subdirectory:
        //    { 'subdirFileA.txt': 'subdirFileA\n',
        //      'subdirFileB.txt': 'subdirFileB\n' } }
    })
    .catch(console.error)
