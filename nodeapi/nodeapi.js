#! /usr/bin/env node

var http = require('http');
var baseUrl = 'http://nodejs.org/api/';
var param = process.argv[2];
var mod;
var method;
var apiUrl;

console.log(param);
if(param.indexOf('.') !== -1) {
  mod = param.split('.')[0];
  method = param.split('.')[1];
} else {
  mod = param;
}

console.log('mod: ' + mod);
console.log('method: ' + method);

apiUrl = baseUrl + mod + '.json';
console.log(apiUrl);

http.get(apiUrl, function(res) {
  res.setEncoding('utf8');
  var data = '';
  res.on('data', function(chunk) {
    data += chunk;
  });
  res.on('end', function(d) {
    var info = JSON.parse(data);
    console.log(info);
    var modules = info.modules[0];
    var methodObj;
    modules.methods.forEach(function(i) {
      if(new RegExp(method, 'ig').test(i.name)) {
        methodObj = i;
      }
    });
    if(methodObj) {
      console.log(methodObj.desc);
    } else {
      console.log("No api found for: " + mod + '.' + method);
    }
  });
}).on('error', function(e) {
  console.log('Error: ' + e.message);
});
