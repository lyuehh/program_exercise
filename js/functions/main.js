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

function partialRight(fn /*, args... */) {
  var slice = Array.prototype.slice;
  var args = slice.call(arguments, 1);

  return function() {
    return fn.apply(this, slice.call(arguments, 0).concat(args));
  };
}

function wedgie(a, b) {
  return a + ' gives ' + b + ' a wedgie.';
}

var joeGivesWedgie = partial(wedgie, 'Joe');
console.log(joeGivesWedgie('Ron'));
console.log(joeGivesWedgie('Bob'));

var joeReceivesWedgie = partialRight(wedgie, 'Joe');
console.log(joeReceivesWedgie("Ron"));
console.log(joeReceivesWedgie('Bob'));

var partialAny = (function() {
  var slice = Array.prototype.slice;

  function partialAny(fn /*, args... */) {
    var orig = slice.call(arguments, 1);

    return function() {
      var partial = slice.call(arguments, 0);
      console.log('---');
      console.log(orig);
      console.log(partial);
      console.log('---');
      var args = [];

      for(var i=0; i<orig.length; i++) {
        args[i] = orig[i] === partialAny._ ? partial.shift() : orig[i];
      }

      return fn.apply(this, args.concat(partial));
      //return fn.apply(this, args);
    };
  }

  partialAny._ = {};
  return partialAny;
})();

function hex(r, g, b) {
  return '#' + r + g + b;
}

console.log(hex('11', '22', '33'));

var __ = partialAny._;

var redMax = partialAny(hex, 'ff', __, __);
console.log(redMax('11', '22'));

var greenMax = partialAny(hex, __, 'ff');
console.log(greenMax('33', '44'));

var blueMax = partialAny(hex, __, __, 'ff');
console.log(blueMax('55', '66'));

var magentMax = partialAny(hex, 'ff', __, 'ff');
console.log(magentMax('77'));

function curry(fn, n) {
  if(typeof n !== 'number') {
    n = fn.length;
  }

  function getCurriedFn(prev) {
    return function(arg) {
      var args = prev.concat(arg);
      if(args.length < n) {
        return getCurriedFn(args);
      } else {
        return fn.apply(this, args);
      }
    };
  }

  return getCurriedFn([]);
}
console.log('-------');

var i = 0;
function a(arg1, arg2, arg3) {
  return ++i + ': ' + arg1 + ', ' + arg2 + ', ' + arg3;
}

console.log(a('x', 'y', 'z')); // 1:
console.log(a('x', 'y')); // 2:
console.log(a('x')); // 3:
console.log(a()); // 4:

var b = curry(a);
console.log(b()); // a not invoked, return a function
console.log(b('x')); // a not invoked, return a function
console.log(b('x')('y')); // a not invoked, return a function
console.log(b('x')('y')('z')); // a invoked, log x y z // 5:

console.log(b('x')('y')());    // "6: x, y, undefined"
console.log(b('x')()());       // "7: x, undefined, undefined"
console.log(b()('y')());       // "8: undefined, y, undefined"
console.log(b()()('z'));       // "9: undefined, undefined, z"
console.log(b()()());          // "10: undefined, undefined, undefined"

var c = b('x');
console.log(c());
console.log(c('y'));
console.log(c('y')('z')); // 11
console.log(c('y')()); // 12
console.log(c()('z')); // 13
console.log(c()()); // 14

var d = c('y');
console.log(d('z')); // 15
console.log(d()); // 16

var e = d('z');
console.log(e); // 17

function add(a, b, c) {
  var sum = a + b + c;
  return a + ' + ' + b + ' + ' + c + ' = ' + sum;
}

var addOnePartial = partial(add, 1);
console.log(addOnePartial(2,3));
console.log(addOnePartial(2));

var addOneCurried = curry(add)(1);
console.log(addOneCurried(2)(3));


function frankenCurry(fn, n) {
  if(typeof n !== 'number') {
    n = fn.length;
  }

  function getFrankenCurriedFn(prev) {
    return function() {
      var args = prev.concat(Array.prototype.slice.call(arguments, 0));
      if(args.length < n) {
        return getFrankenCurriedFn(args);
      } else {
        return fn.apply(this, args);
      }
    };
  }

  return getFrankenCurriedFn([]);
}

var c = frankenCurry(a);
console.log(c());              // `a` not invoked, curried function returned
console.log(c('x'));           // `a` not invoked, curried function returned
console.log(c('x')('y'));      // `a` not invoked, curried function returned
console.log(c('x')('y')('z')); // "7: x, y, z"
console.log(c('x')('y')());    // `a` not invoked, curried function returned
console.log(c('x')()());       // `a` not invoked, curried function returned
console.log(c()('y')());       // `a` not invoked, curried function returned
console.log(c()()('z'));       // `a` not invoked, curried function returned
console.log(c()()());          // `a` not invoked, curried function returned
console.log(c('x')('y', 'z')); // "8: x, y, z"
console.log(c('x', 'y')('z')); // "9: x, y, z"
console.log(c('x', 'y', 'z')); // "10: x, y, z"

function add(a, b, c) {
  var sum = a + b + c;
  return a + ' + ' + b + ' + ' + c + ' = ' + sum;
}

console.log(frankenCurry(add)(1)(2)(3));             // "1 + 2 + 3 = 6"
console.log(frankenCurry(add)(1, 2)(3));             // "1 + 2 + 3 = 6"
console.log(frankenCurry(add)(1, 2, 3));             // "1 + 2 + 3 = 6"
console.log(frankenCurry(add)(1)(2, 3));             // "1 + 2 + 3 = 6"
console.log(frankenCurry(add)(1)()(2)()(3));         // "1 + 2 + 3 = 6"
console.log(frankenCurry(add)()(1)()()(2)()()()(3)); // "1 + 2 + 3 = 6"
console.log(frankenCurry(add)()()()()()(1)()()()()()(2)()()()()()(3)); // "1 + 2 + 3 = 6"


var prop = 9001;
var obj = {
  prop: 1,
  add: function(a, b) {
    var sum = this.prop + a + b;
    return this.prop + ' + ' + a + ' + ' + b + ' = ' + sum;
  }
};

// When invoked this way, `this` inside `add` is `obj`
console.log(obj.add(2, 3));             // "1 + 2 + 3 = 6"

var badAdd = obj.add;
console.log(badAdd(2, 3));              // "9001 + 2 + 3 = 9006" // in node, this is not like this;

console.log(badAdd.call(obj, 4, 5));    // "1 + 4 + 5 = 10"
console.log(badAdd.apply(obj, [6, 7])); // "1 + 6 + 7 = 14"

var goodAdd = obj.add.bind(obj);
console.log(goodAdd(8, 9));             // "1 + 8 + 9 = 18"

var goodAddEvenMore = obj.add.bind(obj, 10);
console.log(goodAddEvenMore(11));       // "1 + 10 + 11 = 22"

// Note that only a reference to the `this` object itself gets locked in,
obj.prop = 99;
console.log(goodAdd(5, 6));             // "99 + 5 + 6 = 110"
console.log(goodAddEvenMore(7));        // "99 + 10 + 7 = 116"

var maxArray = Function.prototype.apply.bind(Math.max, null);
console.log(maxArray([1,23,4]));
