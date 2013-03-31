function f1(n) {
  if(n===0) {
    return 1;
  } else {
    return n * f1(n-1);
  }
}

function f2(n) {
  var a = 1;
  while(n > 0) {
    a = a * n;
    n--;
  }
  return a;
}

function f3(a, n) {
  if(n === 0) {
    return a;
  } else {
    return f2(a*n, n-1);
  }
}

function f4(n) {
  return (n <= 0) ? 1 : n * f4(n-1);
}

console.log(f1(20));
console.log(f2(20));
console.log(f3(1, 20));
console.log(f4(20));
