function add(a, b) {
  return a + b;
}

add(1, 2);    // 3
add(1, 3);    // 4
add(1, 10);   // 11
add(1, 9000); // 9001

function add(a, b) {
  return a + b;
}

var value = 1;

add(value, 2);    // 3
add(value, 3);    // 4
add(value, 10);   // 11
add(value, 9000); // 9001

// More general function.
function add(a, b) {
  return a + b;
}

add(1, 2);  // 3
add(10, 3); // 13

// More specific functions.
function addOne(b) {
  return add(1, b);
}

addOne(2);  // 3
addOne(3);  // 4

function addTen(b) {
  return add(10, b);
}

addTen(2);  // 12
addTen(3);  // 13

// More general function.
function add(a, b) {
  return a + b;
}

add(1, 2);  // 3
add(10, 3); // 13

// More specific function generator.
function makeAdder(a) {
  return function(b) {
    return a + b;
  };
}

// More specific functions.
var addOne = makeAdder(1);
addOne(2);  // 3
addOne(3);  // 4

var addTen = makeAdder(10);
addTen(2);  // 12
addTen(3);  // 13

// Relatively flexible, more specific function generator.
function bindFirstArg(fn, a) {
  return function(b) {
    return fn(a, b);
  };
}

// More general functions.
function add(a, b) {
  return a + b;
}

add(1, 2);           // 3

function multiply(a, b) {
  return a * b;
}

multiply(10, 2);     // 20

// More specific functions.
var addOne = bindFirstArg(add, 1);
addOne(2);           // 3
addOne(3);           // 4
addOne(10);          // 11
addOne(9000);        // 9001

var multiplyByTen = bindFirstArg(multiply, 10);
multiplyByTen(2);    // 20
multiplyByTen(3);    // 30
multiplyByTen(10);   // 100
multiplyByTen(9000); // 90000

function partial(fn) {
  var slice = Array.prototype.slice;
  var args = slice.call(arguments, 1);

  return function() {
    return fn.apply(this, args.concat(slice.call(arguments, 0)));
  };
}

function addAllThings() {
  var sum = 0;
  for(var i=0; i<arguments.length; i++) {
    sum += arguments[i];
  }
  return sum;
}


var addOne = partial(addAllThings, 1);
console.log(addOne(2));
console.log(addOne(4, 6));

