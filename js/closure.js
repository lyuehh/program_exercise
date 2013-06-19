function aa() {
  var val = 0;
  return {
    add: function() {
      val++;
      return this;
    },
    get: function() {
      return val;
    }
  };
}

var d = aa();
d.add();
d.add();
console.log(d.get());

var c = aa();
c.add();
console.log(c.get());
