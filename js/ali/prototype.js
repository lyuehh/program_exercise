/*
function Foo() {}
// Foo.prototype 是Object的一个实例
console.log(Foo.prototype.__proto__ === Object.prototype);
console.log(Foo.prototype.constructor === Foo);
var f1 = new Foo();

// f1是Foo的一个实例
console.log(f1.__proto__ == Foo.prototype);
console.log(f1.__proto__.constructor === Foo);

console.log(getPrototypeChain(new String('a')));
*/

function getPrototypeChain(object) {
    var ret = [];
    while (object = object.__proto__) {
        ret.push(object);
    }
    ret.push(null);
    return ret;
}

function A() {}
function B() {}

B.prototype = new A();

var a1 = new A();
var b1 = new B();

console.log('1:');
console.log(A.prototype.constructor === A);
console.log(a1.__proto__ === A.prototype);
console.log(a1.__proto__.constructor === A);
console.log(a1.__proto__.__proto__ === Object.prototype);
console.log(a1.__proto__.__proto__.constructor === Object);
console.log(a1.__proto__.__proto__.constructor.prototype === Object.prototype);

console.log('2:');
console.log(B.prototype.__proto__ === A.prototype);
console.log(B.prototype.__proto__.constructor === A);
console.log(b1.__proto__ === B.prototype);
console.log(b1.__proto__.__proto__ === A.prototype);
console.log(b1.__proto__.__proto__.constructor === A);
console.log(b1.__proto__.__proto__.__proto__ === Object.prototype);
console.log(b1.__proto__.__proto__.__proto__.__prototype == null);

console.log('3:');
console.log(a1 instanceof A);
console.log(b1 instanceof B);
console.log(b1 instanceof A);
console.log(b1 instanceof Object);

console.log('4:');
console.log(B.prototype.constructor === A);
console.log(B.prototype.constructor);
B.prototype.constructor = B;
getPrototypeChain(b1).forEach(function(i) {
    console.log(i);
});
