function asyncTask() {
    var promise = Promise(), itv;
    setTimeout(function () {
        clearInterval(itv);
        promise.resolve();
    }, 3500)
    
    itv = setInterval(function () {
        promise.notify();
    }, 100)
    return promise;
}
function asyncTask2(aa) {
    alert(aa)
}

Promise(asyncTask)
.then(function () {
    console.log("finish");
}, null, function () {
    console.log("hanlding");
}).then(function () {
    return asyncTask2(111);
});

        //Promise(true).then(asyncTask).done(function () {
        //    console.log("finish");
        //}).progress(function () {
        //    console.log("hanlding");
        //})

        //Promise(true).then(asyncTask).then(function () {
        //    console.log("finish");
        //}, null, function () {
        //    console.log("hanlding");
        //});