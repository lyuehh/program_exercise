#!/usr/bin/env node
var qs = require('querystring');
var arg = process.argv[2];
console.log(qs.parse(arg));
