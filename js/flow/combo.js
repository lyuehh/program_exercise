var fs = require('fs');

function Combo(callback) {
  this.callback = callback;
  this.items = 0;
  this.results = [];
}

Combo.prototype = {
  add: function () {
    var self = this,
    id = this.items;
    this.items++;
    return function () {
      self.check(id, arguments);
    };
  },
  check: function (id, args) {
    this.results[id] = Array.prototype.slice.call(args);
    this.items--;
    if (this.items === 0) {
      this.callback.apply(this, this.results);
    }
  }
};

// Make a Combo object.
var both = new Combo(function (db_result, file_contents) {
  // Do something
});
function people() {}
// Fire off the database query
people.find({name: "Tim", age: 27}, both.add());
// Fire off the file read
fs.readFile('famous_quotes.txt', both.add());
