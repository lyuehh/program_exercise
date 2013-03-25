var should = require('should');
var binsearch = require('../algr/binsearch').binsearch;

describe('algr: binsearch', function() {
  it('a1', function() {
    var a1 = [1,2,3,4,5,6,7,8];
    binsearch(a1, 3).should.equal(2);
    binsearch(a1, 2).should.equal(1);
    binsearch(a1, 5).should.equal(4);
    binsearch(a1, 8).should.equal(7);
  });
});

