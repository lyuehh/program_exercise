/* global console */

var a = [0, 1, 5, 10, 15, 5];
console.log(a);
console.log(a.sort());

function compare(a, b)  {
    return a - b;
}

function compare2(a, b)  {
    return b - a;
}

console.log(a.sort(compare));
console.log(a.sort(compare2));
