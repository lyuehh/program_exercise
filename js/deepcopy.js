var copy = function (p) {
  var c = {};
  for(var i in p) {
    c[i] = p[i];
  }
  c.__super__ = p;
  return c;
};

var deepCopy = function (p, c) {
  c = c || {};
  for(var i in p) {
    if(p.hasOwnProperty(i)) {
      if(typeof p[i] === 'object') {
        c[i] = (p[i].constructor === Array ? [] : {});
        deepCopy(p[i], c[i]);
      } else {
        c[i] = p[i];
      }
    }
  }
  return c;
};


var a = {
  "a": "a",
  "b": [1,2,3],
  "c": {"x": 1}
};
// a.prototype指向Object.prototype, 而Object.prototype指向的是null
//a.prototype.d = [1]; //报错，a.prototype 为undefined
a.prototype = {"d": 1};

var aa = copy(a);
console.log(a.b); // 123
console.log(a.d); // 123
console.log(aa.d);
aa.b = [4,5,6];
aa.c = '111';
console.log(a.b); // 123,没有被修改
console.log(aa);
//console.log(aa);  // object

function A(name) {
  this.name = name;
}
A.prototype.a = [1,2,3];

var a1 = new A('a');
var b1 = copy(a1);
b1.name = 'b';

console.log(b1.name + ' ' + b1.a); // b 1,2,3
console.log(a1.name + ' ' + a1.a); // a 1,2,3

b1.prototype = A.prototype;
b1.prototype.a = [4,5,6];

console.log(b1.name + ' ' + b1.a); // b 4,5,6
console.log(a1.name + ' ' + a1.a); // b 4,5,6


var deepC = function (p, c) {
  c = c || {};
  for(var i in p) {
    if(p.hasOwnProperty(i)) {
      if (typeof p[i] === 'object') {
        c[i] = (p[i].constructor === Array ? [] : {});
        deepC(p[i], c[i]);
      } else {
        c[i] = p[i];
      }
    }
  }
};
