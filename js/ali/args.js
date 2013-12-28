
console.log('1:---');
(function() {
    var o1 = {
        name: 'a1'
    };
    var o2 = o1;
    o2.name = 'o2';
    console.log(o1.name);
})();


console.log('2:---');
(function() {
    var o1 = {
        name: 'a1'
    };
    var o2 = o1;
    o2.name = 'o2';
    o2 = {name: 'o3'};
    console.log(o1.name);
    console.log(o2.name);
})();

console.log('3:---');
(function() {

    function add(n) {
        n += 10;
        return n;
    }
    var a = 10;
    var b = add(a);
    console.log(a);
    console.log(b);
})();

console.log('4:---');
(function() {

    function setName(o) {
        o.name = '123';
    }
    var a = {};
    a.name = '456';
    setName(a);
    console.log(a.name);
})();

console.log('5:---');
(function() {

    function setName(o) {
        o.name = '123';
        o = {};
        o.name = 'aaa';
    }
    var a = {};
    a.name = '456';
    setName(a);
    console.log(a.name);
})();

