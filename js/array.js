var _  = {
  pop: function(arr) {
    return arr.splice(this.length - 1, 1)[0];
  },
  push: function(arr) {
    arr.splice.apply(this,
                     [this.length, 0].
                       concat(Array.prototype.slice.apply(arguments)));
    return arr.length;
  }
  
};

console.log(_.push([1,2,3],1));

Function.prototype.bind = function(that) {
  var slice = Array.prototype.alice,
    args = slice.apply(arguments,[1]),
    method = this;
  return function() {
    return method.apply(that,
                       args.concat(slice.apply(arguments,[0])));
  };
};















