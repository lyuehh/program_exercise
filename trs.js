#!/usr/bin/env node

var http = require('http');
var child_process = require('child_process');

var agent='Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7'
var refer = 'http://translate.google.cn/';
// url='http://translate.google.cn/translate_a/t?client=t&hl=zh-CN&sl=en&tl=zh-CN&ie=UTF-8&oe=UTF-&text='
//var url='http://translate.google.cn/translate_a/t?client=t&hl=zh-CN&sl=en&tl=zh-CN&ie=UTF-8&oe=UTF-&text='
var word = process.argv[2];
var firstChar = word[0].charCodeAt(0);
var sl, tl;
if(firstChar >= 65 && firstChar <= 122) {
  sl = 'en';
  tl = 'zh-CN';
} else {
  sl = 'zh-CN';
  tl = 'en';
}
var url='http://translate.google.cn/translate_a/t?client=t&hl=zh-CN&sl='
  + sl + '&tl=' + tl + '&text='
  + encodeURIComponent(word);

// var url='http://translate.google.cn/translate_a/t?client=t&hl=zh-CN&sl='
//   + sl + '&tl=' + tl + '&ie=UTF-8&oe=UTF-8&text='
//   + encodeURIComponent(word) + "&multires=1&oc=4&prev=btn&ssel=3&tsel=3&sc=1";

console.log(word);
console.log(url);

var cmd = "curl -i --user-agent '[" + agent + "]' -e " + refer + " " + url;
console.log(cmd);
var awk = child_process.exec(cmd);
awk.stdout.on('data', function(data) {
  console.log(data);
});
