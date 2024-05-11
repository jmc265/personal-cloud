const wrote = require('../src/')
const tempPath = 'path/to/temp/file.data'
const path = require('path')

wrote.ensurePath(tempPath)
    .then((res) => {
        console.log(res) // path/to/temp/file.data, path/to/temp is created in your cwd
    })
    .then(() => {
        const absolutePath = path.join(process.cwd(), tempPath)
        return wrote.ensurePath(absolutePath)
    })
    .then((res) => {
        console.log(res) // ~/path/to/temp/file.data, using previously created path
    })

