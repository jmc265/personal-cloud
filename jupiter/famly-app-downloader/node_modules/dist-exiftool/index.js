module.exports = process.platform === 'win32' ? require('exiftool.exe') : require('exiftool.pl');
