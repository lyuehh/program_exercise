function* GenA(){
    console.log('from GenA, first.');
    yield 1;
    console.log('from GenA, second.');
    var value3 = yield 2;
    console.log('from GenA, third.',value3);
    return 3;
}

var a = new GenA();

function delay(time) {
  return function(fn) {
    setTimeout(function() {
      fn()
    }, time)
  }
}

