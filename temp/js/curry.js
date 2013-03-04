function add_1(x, y) {
  return x + y;
}

console.log(add_1(1,2));

function add(x, y) {
  var oldx = x, oldy = y;
  if(typeof y === 'undefined') {
    return function(newy) {
      return oldx + newy;
    };
  }
  return x + y;
}

console.log(add(1,2));
console.log(add(1)(2));
