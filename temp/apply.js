var a = ["123","abc"];

console.log(a);

var log = function() {
  console.log.apply(console, arguments);
};
log(a);
