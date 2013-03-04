function fib(n) {
  return fib_iter(1, 0, n);
}

function fib_iter(a, b, count) {
  if(count === 0) {
    return b;
  } else {
    return fib_iter(a + b, a, count - 1);
  }
}

function fib2(n) {
  if(n < 1) {
    return n;
  } else {
    return fib2(n-1) + fib2(n-2);
  }
}

console.time('1');
console.log(fib2(40)); // 这个为什么是负的....
console.timeEnd('1');

console.time('2');
console.log(fib(40));
console.timeEnd('2');
