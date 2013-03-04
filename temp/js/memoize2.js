function fib(n) {
  if(n < 2) {
    return n;
  } else {
    return fib(n-1) + fib(n-2);
  }
}

function memoize (func) {
  var memo = {};
  return function() {
    var arg = arguments[0];
    if(memo.hasOwnProperty(arg)) {
      return memo[arg];
    } else {
      memo[arg] = func.apply(this, arguments);
      return memo[arg];
    }
  };
}


var fib2 = memoize(fib);

console.time('2');
console.log(fib2(40));
console.timeEnd('2');

console.time('2');
console.log(fib2(40));
console.timeEnd('2');

