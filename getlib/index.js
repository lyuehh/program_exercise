var fs = require('fs');
var http = require('http');
var _ = require('underscore');
var request = require('request');
var argv = require('optimist').argv;
var mkdirp = require('mkdirp');
var sys = require('sys');

console.log(argv._);
var args = argv._;

if(args[0] === 'info') {
  info(args[1] || '');
} else if(args[0] === 'list') {
  list(args[1] || '');
} else if(args[0] === 'download') {
  download(args[1] || '', args[2] || '');
}

// make a dir in ~/.libs 


function getLibDir() {
  var dir = process.env.HOME + '/.libs';
  mkdirp.sync(dir);
  return dir;
}
function getPath(name) {
  return './libs/' + name + ".json";
}

function getConf(name) {
  return require(getPath(name));
}

function info(name) {
  if(fs.existsSync(getPath(name))) {
    var lib = getConf(name);
    console.log('Name: ' + lib.name);
    console.log('Url: ' + lib.url);
    console.log('Git: ' + lib.git);
    console.log('Versions: ' + Object.keys(lib.versions));
  } else {
    console.log('no ' + name + ' info found !!!');
  }
}

function list(name) {
  if(fs.existsSync(getPath(name))) {
    var lib = getConf(name);
    console.log(name + ':');
    console.log('versions: ' + _.keys(lib.versions));
  } else {
    console.log('no ' + name + ' found !!!');
  }
}

function download(name, version) {

  console.log(name + ' ' + version);
  var path = getPath(name);
  var conf = getConf(name);
  if(_.include(_.keys(conf.versions), version)) {
    var url = conf.versions[version];
    var fileCacheDir = getLibDir() + '/' + name;
    var fileCache = fileCacheDir + '/' + name + '-' + version + '.js';

    console.log(fileCacheDir);
    console.log(fileCache);

    mkdirp(getLibDir() + '/' + name, function(err) {
      if(err) console.err(err);
      else {
        console.log('~/.libs/' + name + ' dir created !!!');
        if(fs.existsSync(fileCache)) {
          console.log('exists in ~/.libs/' + name + '/');

        } else {
          console.log('downloading...');
          request(url.dev).pipe(fs.createWriteStream(fileCache));
        }
      }
    });
  } else {
    console.log('no version ' + version + ' found !!!');
  }
}

