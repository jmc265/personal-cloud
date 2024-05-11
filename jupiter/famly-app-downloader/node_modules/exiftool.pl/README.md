# node-exiftool.pl
A distribution of _exiftool_ perl executable with lib. Current version is 10.53.

[![npm version](https://badge.fury.io/js/exiftool.pl.svg)](https://badge.fury.io/js/exiftool.pl)
[![Build Status](https://travis-ci.org/Sobesednik/node-exiftool.pl.svg?branch=master)](https://travis-ci.org/Sobesednik/node-exiftool.pl)

You might also be interested in [dist-exiftool](https://www.npmjs.com/package/dist-exiftool)
which will install an appropriate version of exiftool depending on the platform, and
[exiftool.exe](https://www.npmjs.com/package/exiftool.exe) for Windows.

## Usage
The module exports a path to the exiftool Perl executable.

```js
const exec = require('child_process').execFile;
const exiftool = require('exiftool.pl');

execFile(exiftool, ['-j', 'image.jpg'], (error, stdout, stderr) => {
	if (error) {
		console.error(`exec error: ${error}`);
		return;
	}
	console.log(`stdout: ${stdout}`);
	console.log(`stderr: ${stderr}`);
});
```

## Links
[exiftool](http://www.sno.phy.queensu.ca/~phil/exiftool/)

[sourceforge](https://sourceforge.net/projects/exiftool/)

[cpan](http://search.cpan.org/~exiftool/)

## License
Artistic License 2.0
