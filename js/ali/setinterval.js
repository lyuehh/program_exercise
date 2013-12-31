function foo() {
    // 将会被调用
    console.log('aa');
}

function bar() {
    function foo() {
        // 不会被调用
        console.log('bb');
    }
    // setTimeout('foo()', 1000); // ERROR
}
bar();

function foo() {
    console.log('cc');
}

var i;
for (i=0; i<10; i++) {
    (function(e) {
        setTimeout(function() {
            console.log(e);
        }, e * 500);
    })(i);
}

for (i=0; i<10; i++) {
    setTimeout((function(e) {
        return function() {
            console.log(e);
        };
    })(i), i * 500);
}
