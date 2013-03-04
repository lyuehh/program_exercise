function add(x, y) {
  return x + y;
}
function mul(x, y) {
  return x * y;
}
function applyf(fn) {
  return function(x) {
    return function(y) {
      return fn(x, y);
    };
  };
}

var addf = applyf(add);
console.log(addf(4)(3));
console.log(applyf(mul)(3)(4));
