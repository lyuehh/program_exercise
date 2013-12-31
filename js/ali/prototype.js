function Foo() {}

// Foo.prototype 是Object的一个实例
console.log(Foo.prototype.__proto__ === Object.prototype);
console.log(Foo.prototype.constructor === Foo);
var f1 = new Foo();

// f1是Foo的一个实例
console.log(f1.__proto__ == Foo.prototype);
console.log(f1.__proto__.constructor === Foo);
