'use strict'
const fs = require('fs')
const makePromise = require('makepromise')
const path = require('path')
const read = require('./read')

function lstatFiles(dirPath, dirContent) {
    const readFiles = dirContent.map((fileOrDir) => {
        const newPath = path.join(dirPath, fileOrDir)
        return makePromise(fs.lstat, newPath)
            .then((lstat) => {
                return {
                    lstat,
                    path: newPath,
                    relativePath: fileOrDir,
                }
            })
    })
    return Promise.all(readFiles)
}

/**
 * Filter lstat results, taking only files if recursive is false.
 * @param {lstat[]} files An array with lstat results
 * @param {boolean} [recursive = false] Whether recursive mode is on
 * @returns {lstat[]} Filtered array.
 */
function filterFiles(files, recursive) {
    return files.filter((file) => {
        return recursive ? true : file.lstat.isFile()
    })
}

/**
 * Read a directory, and return contents of contained files.
 * @param {string} dirPath Path to the directory
 * @param {boolean} [recursive=false] Whether to read found folders as well
 * @returns {Promise<object>} An object reflecting directory structure, e.g.,
 * { dir: subdir: { 'fileA.txt': 'foo', 'fileB.js': 'bar' }, 'fileC.jpg': 'baz' }
 */
function readDir(dirPath, recursive) {
    return makePromise(fs.readdir, [dirPath])
        .then((res) => {
            return lstatFiles(dirPath, res)
        })
        .then((lstatRes) => {
            const filteredFiles = filterFiles(lstatRes, recursive)
            const promises = filteredFiles.map((file) => {
                let promise
                if (file.lstat.isDirectory()) {
                    promise = readDir(file.path, recursive)
                } else if (file.lstat.isFile()) {
                    promise = read(file.path)
                }
                return promise
                    .then((res) => {
                        return { file: file.relativePath, data: res }
                    })
            })
            return Promise.all(promises)
        })
        .then((res) => {
            return res.reduce((acc, current) => {
                return Object.assign({}, acc, { [current.file]: current.data })
            }, {})
        })
}

module.exports = readDir
