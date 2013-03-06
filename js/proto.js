function Foo() {
  this.kind = 'foo'
}

var foo = new Foo();
console.log(foo.__proto__ === Foo.prototype);
console.log(Foo.prototype);
