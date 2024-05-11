const recursive = {
    subdirectory: {
        'file.data': 'this is a file with some data\n',
        'file2.data': 'this is another file with some other data\n',
    },
    'test.data': 'hello world\n',
}

const normal = {
    'test.data': 'hello world\n',
}

module.exports = {
    normal,
    recursive,
}
