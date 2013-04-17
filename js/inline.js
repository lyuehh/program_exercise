function square(x) {
  return x * x;
}
function f(x) {
  var sum = 0;
  for (var i = 0; i < x; i++) {
    sum += square(i);
  }
  return sum;
}

//console.log(f(20));

for (var i = 0, l = 10000; i < l; i ++) {
  f(1e4);
}

// function f2(x) {
//   var sum = 0;
//   for (var i = 0; i < x; i++) {
//     sum += i * i;
//   }
//   return sum;
// }
