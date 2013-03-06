Function.prototype.bind_a = function() {
  var method = this,
    slice = Array.prototype.slice,
    args = slice.apply(arguments),
    obj = args.shift();

  return function() {
    var arg = slice.apply(arguments);
    return method.apply(obj,args.concat(arg));
  };
};

var x = function(a,b) {
  return this.value + a + b;
};

var y = x.bind_a({value: 123},'111');
console.log(y('a'));

Function.prototype.bind_b = function() {
  var method = this,
    slice = Array.prototype.slice,
    args = slice.apply(arguments),
    obj = args.shift();

  return function() {
    var arg = slice.apply(arguments);
    return method.apply(obj,args.concat(arg));
  };
};

Function.prototype.method = function(name, func) {
  this.prototype[name] = func;
  return this;
};
