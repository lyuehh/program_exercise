console.log('1:');
(function() {
    var a = [1,2,3,4];
    console.log(a.length);
    a.length = 2;
    console.log(a);
    a.length = 4;
    console.log(a);
})();

console.log('2:');
(function() {
    var b = [1,2,3];
    b[5] = 10;
    console.log(b.length);
    console.log(b);
})();

console.log('3:');
console.log(Object.prototype.toString.call([1,2,3]));
console.log(Array.isArray([1,2,3])); // only after es5
