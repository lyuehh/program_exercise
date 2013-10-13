function swap(a, b) {
  var temp = a;
  a = b;
  b = a;
}

var x = 1, y = 2;
swap(x, y);
console.log(x);
