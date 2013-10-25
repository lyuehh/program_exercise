/* global console */

var str = "hello world";

console.log("str: " + str);
console.log();

console.log("slice(3): " + str.slice(3));
console.log("substring(3): " + str.substring(3));
console.log("substr(3): " + str.substr(3));
console.log();
console.log("slice(3,7): " + str.slice(3, 7));
console.log("substring(3, 7): " + str.substring(3, 7));
console.log("substr(3, 7): " + str.substr(3, 7));

console.log();
console.log("slice(-3): " + str.slice(-3));
console.log("substring(-3): " + str.substring(-3));
console.log("substr(-3): " + str.substr(-3));
console.log();
console.log("slice(3, -4): " + str.slice(3, -4));
console.log("substring(3, -4): " + str.substring(3, -4));
console.log("substr(3, -4): " + str.substr(3, -4));


