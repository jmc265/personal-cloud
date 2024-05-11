[![npm version](https://badge.fury.io/js/platform-dependent-modules.svg)](http://badge.fury.io/js/platform-dependent-modules)
[![Build Status](https://travis-ci.org/alykoshin/platform-dependent-modules.svg)](https://travis-ci.org/alykoshin/platform-dependent-modules)
[![Coverage Status](https://coveralls.io/repos/alykoshin/platform-dependent-modules/badge.svg?branch=master&service=github)](https://coveralls.io/github/alykoshin/platform-dependent-modules?branch=master)
[![Code Climate](https://codeclimate.com/github/alykoshin/platform-dependent-modules/badges/gpa.svg)](https://codeclimate.com/github/alykoshin/platform-dependent-modules)
[![Inch CI](https://inch-ci.org/github/alykoshin/platform-dependent-modules.svg?branch=master)](https://inch-ci.org/github/alykoshin/platform-dependent-modules)

[![Dependency Status](https://david-dm.org/alykoshin/platform-dependent-modules/status.svg)](https://david-dm.org/alykoshin/platform-dependent-modules#info=dependencies)
[![devDependency Status](https://david-dm.org/alykoshin/platform-dependent-modules/dev-status.svg)](https://david-dm.org/alykoshin/platform-dependent-modules#info=devDependencies)


# platform-dependent-modules

Platform dependent modules installation.
Allows to conditionally specify modules depending on current computer platform (Windows, Linux etc).

If some module is conditionally used depending on current computer platform, it anyway must be listed in `package.json`.
`npm install` will fail if the platform is marked as unsupported for it.

To prevent installation failure, you may define which modules for which platforms to be installed.

Installation of platform-dependent modules is run on `postinstall` trigger.

## Troubleshooting
 
Sometimes after `platform-dependent-modules` version update command `npm install` may fail with following message: 

### 1

Windows:

```
'platform-dependent-modules' is not recognized as an internal or external command, operable program or batch file.
```

### 2

Linux: 

```
sh: 1: platform-dependent-modules: Permission denied
```

In both cases it is needed to reinstall `platform-specific-modules` manually. Remove it and install again, then rerun `npm install`  

```
npm r platform-dependent-modules
npm i platform-dependent-modules
npm i
```

If you getting error for some of the modules configured using 'platform-dependent-modules', like in example below `winston-winlog2`:

```
    Error: Cannot find module 'winston-winlog2'
```



##
Please, be aware that if you run `npm install` on one machine and copied project files with `node_modules` subdirectory to another computer with different platform, you'll need to install each module uses this package manually by `npm install <module>` or by full reinstall (removing `node_modules` and running `npm install`)


If you have different needs regarding the functionality, please add a [feature request](https://github.com/alykoshin/platform-dependent-modules/issues).


## Installation

```sh
npm install --save platform-dependent-modules
```

## Usage

Add to `config` section of `package.json` following text:

```json
{
  ...
  "config": {
    "platformDependentModules": {
      "linux": [
        "empty-module"
      ],
      "win32": [
        "empty-module"
      ],
      "darwin": [
        "empty-module"
      ],
      "freebsd": [
        "empty-module"
      ],
      "sunos": [
        "empty-module"
      ]
    }
  ...
}
```

Or (more live examples):

```json
{
  ...
  "config": {
    "platformDependentModules": {
      "win32": [
        "msnodesqlv8@^0.1.35"
      ]
    }
  }
  ...
}
```

You may also add platform-dependent module to `optionalDependencies`:

```json
{
  ...
  "optionalDependencies": {
    "winston-winlog2": "^1.0.1"
  },
  "config": {
    "platformDependentModules": {
      "win32": [
        "winston-winlog2@^1.0.1"
      ]
    }
  }
  ...
}  
```

Add to `config` section of `package.json` following text:

```json
{
  ...
  "scripts": {
    "_postinstall": "node ./node_modules/platform-dependent-modules/cli.js",
    "postinstall": "npm run _postinstall",
  }
  ...
}
```

Now run only this script: 

```
npm run _postinstall
```

Or during `postinstall` phase of `install`:

```
npm install
```

To run the example (Linux) 

```sh
$ ./examples/example.sh 
* [platform-dependent-modules] Installing packages: empty-module
platform-dependent-modules@0.0.2 /home/alykoshin/sync/al-projects/dev/npm/platform-dependent-modules
└── empty-module@0.0.2  extraneous

* [platform-dependent-modules] empty-module@0.0.2,/home/alykoshin/sync/al-projects/dev/npm/platform-dependent-modules/node_modules/empty-module
* [platform-dependent-modules] Installation success

```

To run the example (Windows) 

```cmd
> ./examples/example.cmd 
```

## Credits
[Alexander](https://github.com/alykoshin/)


# Links to package pages:

[github.com](https://github.com/alykoshin/platform-dependent-modules) &nbsp; [npmjs.com](https://www.npmjs.com/package/platform-dependent-modules) &nbsp; [travis-ci.org](https://travis-ci.org/alykoshin/platform-dependent-modules) &nbsp; [coveralls.io](https://coveralls.io/github/alykoshin/platform-dependent-modules) &nbsp; [inch-ci.org](https://inch-ci.org/github/alykoshin/platform-dependent-modules)


## License

MIT
