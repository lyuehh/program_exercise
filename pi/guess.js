var code = require('./all_code');
var _ = require('underscore');

var random_num_arr = [];
var code_arr = [];
_.each(_.range(5), function() {
  var random_num = parseInt(Math.random() * 100, 10);
  if(random_num < 10) {
    random_num = ('00' + random_num).slice(-2);
  }
  random_num_arr.push(random_num);
  code_arr.push(code[random_num]);
});
var num_str = random_num_arr.join('');
console.log(num_str);

var code_str = code_arr.join('');
//console.log(code_str);

process.stdin.resume();
process.stdin.setEncoding('utf8');
process.stdin.on('data', function(chunk) {
  if(chunk === (code_str + '\n')) {
    console.log('succ');
    process.exit(0);
  } else {
    console.log('err');
  }
});
process.stdin.on('end', function() {
  process.stdout.write('end');
});
