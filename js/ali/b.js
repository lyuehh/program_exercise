var foo = 1;
function main(){
    console.log(foo);
    var foo = 2;
    console.log(this.foo);
    this.foo = 3;
}
var m1 = main();

var m2 = new main();

console.log(m1);
console.log(m2);

function New(f) {
    var n = {'__proto__': f.prototype};
    return function() {
        f.apply(n, arguments);
        return n;
    };
}

function main2() {
    console.log(foo);
    var foo = 2;
    console.log(this.foo);
    this.foo = 3;

    var n = {'__proto__': main.prototype};
    n.foo = 3;
    return n;
}
console.log('--------------------');

function test() {
    var a = 1;
    setTimeout(function() {
        console.log(a);
        a = 3;
    }, 1000);
    a = 2;
    setTimeout(function() {
        console.log(a);
        a = 4;
    }, 3000);
}

test();
console.log(0);

var bySecLetter = function(x, y) {
    if (typeof x === 'string' && typeof y === 'string') {
        var a = x.slice(1),
        b = y.slice(1);
        if (a > b) return 1;
        else if (a < b) return -1;
    }
    return 0;
};

var a = ["abd","cba","ba"];
console.log(a.sort(bySecLetter));

var sortb = function(x, y) {
    x = x.slice(1);
    y = y.slice(1);
    return x > y;
};
console.log(a.sort(sortb));
