function fib(n) {
  if(n < 2) {
    return n;
  } else {
    return fib(n-1) + fib(n-2);
  }
}

function memoize(func) {
  var memo = {};
  return function() {
    var arg = arguments[0];
    console.log(arguments);
    console.log(memo);
    console.log(arg);
    if(memo.hasOwnProperty(arg)) {
      console.log('arg: ' + arg);
    } else {
      memo[arg] = func.apply(this, arguments);
    }
    return memo[arg];
  };
}

var fib2 = memoize(fib);

console.time('1');
console.log(fib2(10));
console.timeEnd('1');

