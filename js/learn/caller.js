/* global console */

function outer() {
    inner();
}

function inner() {
    console.log(inner.caller);
}
outer();

function inner2() {
    console.log(arguments.callee.caller);
}
outer();
