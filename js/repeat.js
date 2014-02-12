function repeat(fn, time, wait) {
    return function(s) {
        var args = Array.prototype.slice.call(arguments);
        for(var i=0; i<time; i++) {
            // (function(i){ // 这个立即调用不是必须的
                setTimeout(function() {
                    fn.apply(null, args);
                    // console.log(i); // 如果不立即调用, 那么这里的i 一直是10
                }, i * wait); // 这里的i会循环
            // })(i);
        }
    };
}

var log = repeat(console.log, 10, 1000);

log('123');
