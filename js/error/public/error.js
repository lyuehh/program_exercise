var init = function() {

  function throw1() {
    throw 'throw 1';
  }

  function throw2() {
    throw new Error('throw 2');
  }
  window.aa();
  //throw2();
};

var logError = function(info) {
  var img = new Image();
  img.src = '/log?info=' + encodeURIComponent(info);
};

try {
  init();
} catch(e) {
  logError(e.message);
}
