var del = function(ids) {
    if (ids.length === 0) {
        console.log('done..');
    } else {
        console.log('sending: ' + ids[0]);
        ids.splice(0, 1);
        del(ids);
    }
};

var ids = [1,2,3,4,5,6,7,8,9,10];

setTimeout(function () {
    del(ids);
}, 500);
