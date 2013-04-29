function f1() {
    var promise = new Promise();
    setTimeout(function () {
     
        alert(1);
        promise.resolve();
    }, 1500)

    return promise;
}

function f2() {
    var promise = new Promise();
    setTimeout(function () {

        alert(2);
        promise.resolve();
    }, 1500)

    return promise;
}

function f3() {
    var promise = new Promise();
    setTimeout(function () {

        alert(3);
        promise.resolve();
    }, 1500)

    return promise;

}

function f4() {
    alert(4);
}

f1().then(f2).then(f3).then(f4)