function add() {
    var a = 1;
    return function() {
        return a++;
    };
}
var add1 = add();
console.log(add1());
console.log(add1());

var i;
for (i=0; i<10; i++) {
    (function(index) {
        setTimeout(function() {
            console.log(index);
        }, 500 * index);
    })(i);
}

for (i=0; i<10; i++) {
    setTimeout((function(e) {
        return function() {
            console.log(e);
        };
    })(i), 500 * i);
}

function fun1(arguments) {
    console.log('---');
    console.log(arguments.length);
    console.log(arguments);
}

fun1(1,2,3);

var a = {
    toString: function() {
        return this;
    },
    valueOf: function() {
        return this;
    }
};
console.log(1 > a);


