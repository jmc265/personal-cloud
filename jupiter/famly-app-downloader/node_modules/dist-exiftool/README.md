# dist-exiftool
A distribution of _exiftool_. Depending on the platform, it will install
either [exiftool.pl](https://www.npmjs.com/package/exiftool.pl) or
[exiftool.exe](https://www.npmjs.com/package/exiftool.exe) module.
Current version is 10.53.

[![npm version](https://badge.fury.io/js/dist-exiftool.svg)](https://badge.fury.io/js/dist-exiftool)
[![Build Status](https://travis-ci.org/Sobesednik/dist-exiftool.svg?branch=master)](https://travis-ci.org/Sobesednik/dist-exiftool)
[![Build status](https://ci.appveyor.com/api/projects/status/7vc08npcgna2xgjt/branch/master?svg=true)](https://ci.appveyor.com/project/zavr-1/dist-exiftool/branch/master)

## Usage
The module exports a path to the exiftool executable.

```js
const execFile = require('child_process').execFile;
const exiftool = require('dist-exiftool');

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
