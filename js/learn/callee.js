/* global console */
// 'use strict';

function factor(num) {
    if (num <= 1) {
        return 1;
    } else {
        return num * factor(num - 1);
    }
}

console.log(factor(10));

function factor1(num) {
    if (num <= 1) {
        return 1;
    } else {
        return num * arguments.callee(num - 1);
    }
}
console.log(factor1(10));
