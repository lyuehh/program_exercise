// 1
var x = 10;
var foo = {
  x: 20,
  bar: function () {
    var x = 30;
    return this.x;

  }
};

console.log(
  foo.bar(),
  (foo.bar)(),
  (foo.bar = foo.bar)(),
  (foo.bar, foo.bar)()
);

// 2
function f(x, y) {
  x = 10;
  console.log(
    arguments[0],
    arguments[1]
  );
}
f();

// 3
console.log('3:');
var
  b = 10,
  c = (
    20,
    function (x) { return x + 100},
    function () { return arguments[0]}
  );

// a = b + c;
// a = b + c({x: 10}).x;
a = b + c
({x: 10}).x
console.log(a);

// 4
console.log('4:');
console.log(1..z);


// 5
console.log('5:');

({
  x: 10,
  foo: function () {
    function bar() {
      console.log(x);
      console.log(y);
      console.log(this.x);
    }
    with (this) {
      var x = 20;
      var y = 30;
      bar.call(this);
    }
  }
}).foo();
