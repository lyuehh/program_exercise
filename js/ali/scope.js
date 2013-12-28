console.log('1:');
(function() {
    if (true) {
        var a = 'a';
    }
    console.log(a);
    if (false) {
        var b = 'b';
    }
    console.log(b);
})();

console.log('2:');
(function(){
    var a = '1';
    function f1() {
        console.log(a);
        var a;
    }
    f1();
})();

