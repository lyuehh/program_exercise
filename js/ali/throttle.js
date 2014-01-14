
function throttle(fn, context, arg) {
    if (fn.tid) {
        clearTimeout(fn.tid);
    }
    fn.tid = setTimeout(function() {
        fn.call(context, arg);
    }, 1000);
}

function print(i) {
    console.log(i);
}


for (var i=0; i<10; i++) {
    // throttle(print, this, i);
}

console.log(console.log);
