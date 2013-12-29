
function fun1() {
    var a = 1;
    return function() {
        return a++;
    };
}

var add1 = fun1();
console.log(add1());
console.log(add1());
console.log(add1());
