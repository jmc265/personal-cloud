#!/usr/bin/env node

'use strict';


var main = require('./');
var thisPkg = require('./package.json');
var logPrefix = '* ['+thisPkg.name+'] ';


main.install(function(err) {
  if (err) {
    console.log(logPrefix + 'Installation error');
    process.exit(-1);
  }
  //console.log(logPrefix + 'Installation finished');
  process.exit(0);
});

