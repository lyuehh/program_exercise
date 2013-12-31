var User = {
  count: 1,

  getCount: function() {
    return this.count;
  }
};

console.log(User.getCount());

var func = User.getCount;
console.log(func());

var func2 = User.getCount.bind(User);
console.log(func2());

Function.prototype.bind = Function.prototype.bind || function (context) {
    var that = this;
    return function() {
        that.apply(context, arguments);
    };
};
