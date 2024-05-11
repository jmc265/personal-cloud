/**
 * Created by alykoshin on 06.03.16.
 */

'use strict';

var path = require('path');
var child_process = require('child_process');
var exec = child_process.exec;

var mainPkg = require(path.join(process.cwd(), 'package.json')); // relatively to current directory
var thisPkg = require('../package.json');                        // relatively to current module

var logPrefix = '* ['+thisPkg.name+'] ';


var checkInstalled = function(moduleName) {
  try {
    require.resolve(moduleName);
  } catch(e) {
    return false;
  }
  return true;
};


var runCmd = function(cmd, cb) {
  cb = (typeof cb === 'function') ? cb : function() {}; // Sanitize callback
  console.log(logPrefix + cmd);

  var child = exec(cmd, function (error, stdout, stderr) {
    if (error) {
      console.log('' + error);
      cb(error, stderr);
    }
    if (stderr) {
      console.log('' + stderr);
    }
    if (stdout) {
      console.log('' + stdout);
    }
    cb(null, stdout);
  });
};


var npmExec = function(command, params, cb) {
  var cmd = 'npm ' + command + ' ' + params.join(' ');
  runCmd(cmd, cb);
};

var npmExecInstall = function(modules, cb) {
  cb = (typeof cb === 'function') ? cb : function() {}; // Sanitize callback
  npmExec('install', modules, function(err, msg) {
    if (err) {
      console.error(logPrefix+'Error installing packages:', err, msg);
      return cb(err);
    }
    return cb(null, msg);
  });
};


/*
var npmModuleInstall = function(modules, cb) {
  cb = (typeof cb === 'function') ? cb : function() {}; // Sanitize callback

  // Require npm only
  var npm = require('npm');

  npm.on('log', function (msg) {
    console.log(msg);
  });

  npm.load(
    /!*myConfigObject,*!/
    function(err) {
      if (err) {
        console.error(logPrefix+'Unable to load npm', err);
        return cb(err);
      }

      console.log(logPrefix+'Installing packages: ' + modules.join(', '));
      npm.commands.install(modules, function(err, msg) {
        if (err) {
          console.error(logPrefix+'Error installing packages:', err, msg);
          return cb(err);
        }
        //console.log(logPrefix+msg);
        return cb(null, msg);
      });
    }
  );
};
*/


var install = function(cb) {
  cb = (typeof cb === 'function') ? cb : function() {}; // Sanitize callback
  //console.log(logPrefix+'Starting ...');

  console.log(logPrefix+'process.cwd(): '+process.cwd()+' __dirname: '+__dirname);

  //console.log(logPrefix+'Checking platform...');
  var platform = process.platform;

  //console.log(logPrefix+'Checking modules list...');
  var config = mainPkg.config && mainPkg.config.platformDependentModules;
  var modules = config && config[platform]; // 'darwin', 'freebsd', 'linux', 'sunos' or 'win32'
  modules = typeof modules === 'string' ? [modules] : modules;

  if (!modules || modules.length === 0) {
    console.warn(logPrefix+'No packages to install, skipping.');
    return cb(null);
  }

  //if (checkInstalled('npm')) {
  //  console.warn(logPrefix+'Trying to use installed npm module');
  //  npmModuleInstall(modules, cb);
  //} else {
  //  console.warn(logPrefix+'Trying to run npm executable');

    npmExecInstall(modules, cb);

  //}

};


module.exports = {
  install: install
};
