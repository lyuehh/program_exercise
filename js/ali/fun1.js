function aa() {
    var b = c = 1;
}
aa();
console.log(c);

myName = "global";
function foo() {
    console.log(myName);
    var myName = "local";
    console.log(myName);
}

foo();

if (!("a" in this)) {
    var a = 1;
}

console.log(a);

function test() {
    console.log("1");
}

test();

function test() {
    console.log("2");
}

test();

var a = 6;
setTimeout(function () {
    console.log(a);
    a = 666;
}, 1000);
a = 66;

console.log(undefined > 0);
console.log(undefined < 0);
console.log(undefined <= 0);
console.log(undefined >= 0);
console.log(undefined == 0);
console.log(undefined === 0);

console.log('-------');
console.log(null > 0);
console.log(null < 0);
console.log(null <= 0);
console.log(null >= 0);
console.log(null == 0);
console.log(null === 0);
var a1 = {
    toString: function() {
        return this;
    },
    valueOf: function() {
        return this;
    }
};
console.log(a1.toString());
// console.log(-a1); //TypeError
// console.log(new String(a1)); //TypeError
