alert('aa');
$.dialog.alert('bb');

function cc(a, b) {
    alert('haha');
}

function dd(a, b) {
    $.dialog.alert('haha');
}

function add(x, y) {
    return x + y;
    debugger;
}

var sub = function(x, y) {
    return x - y;
    debugger;
};

console.log(add(3, 4));
console.log(sub(9, 3));

function xx(a) {}
console.log('1')

var str = (age < 1) ? "baby" :
    (age < 5) ? "toddler" :
    (age < 18) ? "child": "adult";