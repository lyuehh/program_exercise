function adder(n) {
    return function(a) {
        return n + a;
    };
}
var adder2 = adder(2);
console.log(adder2(3));

var adder3 = adder(3);
console.log(adder3(2));
