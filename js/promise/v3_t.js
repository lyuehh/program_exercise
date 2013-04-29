f1()
.then(function () {
    console.log(arguments)
    return f2();
})
.then(function () {
    f3();
})
.then(f4)
.then(f5)
.then(f6)
.then(f7)
.then([f8, f9, f10])
.then(f11, function () {
    console.log("fail");
})


function f1() {
    var promise = new Promise();
    setTimeout(function () {
       
        console.log(1);
        promise.resolve("from f1");
    }, 1500)
    
    return promise;
}

function f2() {
    var promise = new Promise();
    setTimeout(function () {
       
        console.log(2);
        promise.resolve();
    }, 2500)
    
    return promise;
}

function f3() {
    var promise = new Promise();
    setTimeout(function () {
       
        console.log(3);
        promise.resolve();
    }, 1500)
    
    return promise;
    
}

function f4() {
    var promise = new Promise();
    setTimeout(function () {
       
        console.log(4);
        promise.resolve();
    }, 1500)
    
    return promise;
}
function f5() {
    var promise = new Promise();
    setTimeout(function () {
       
        console.log(5);
        promise.resolve();
    }, 1500)
    
    return promise;
}

function f6() {
    console.log(6);
}
function f7() {
    var promise = new Promise();
    setTimeout(function () {
       
        console.log(7);
        promise.resolve();
    }, 1500)
    
    return promise;
}

function f8() {
    var promise = new Promise();
    setTimeout(function () {
       
        console.log(8);
        promise.resolve();
    }, 1500)
    
    return promise;
}

function f9() {
    var promise = new Promise();
    setTimeout(function () {
       
        console.log(9);
        promise.resolve();
    }, 5500)
    
    return promise;
}

function f10() {
    var promise = new Promise();
    setTimeout(function () {
       
        console.log(10);
        promise.reject();
    }, 1500)
    
    return promise;
}

function f11() {
    var promise = new Promise();
    setTimeout(function () {
       
        console.log(11);
        promise.resolve();
    }, 1500)
    
    return promise;
}