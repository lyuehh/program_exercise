function repeat(fn, time, wait) {
    return function(s) {
        for(var i=0; i<time; i++) {
            (function(i){
                setTimeout(function() {
                    fn(s);
                }, i * wait);
            })(i);
        }
    };
}

var log = repeat(console.log, 10, 1000);

log('123');
