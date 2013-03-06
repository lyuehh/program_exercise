function Promise() {
  this.thens = [];
}

Promise.prototype = {
  resolve: function() {
    var t = this.thens.shift(), n;
    n = t.apply(null, arguments);
    if(n instanceof Promise) {
      n.thens = this.thens;
    }
  },
  then: function (n) {
    this.thens.push(n);
    return this;
  }
};
