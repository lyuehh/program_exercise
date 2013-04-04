var tiny_store = require('../lib/tiny-store.js');

/*
  ======== A Handy Little Nodeunit Reference ========
  https://github.com/caolan/nodeunit

  Test methods:
    test.expect(numAssertions)
    test.done()
  Test assertions:
    test.ok(value, [message])
    test.equal(actual, expected, [message])
    test.notEqual(actual, expected, [message])
    test.deepEqual(actual, expected, [message])
    test.notDeepEqual(actual, expected, [message])
    test.strictEqual(actual, expected, [message])
    test.notStrictEqual(actual, expected, [message])
    test.throws(block, [error], [message])
    test.doesNotThrow(block, [error], [message])
    test.ifError(value)
*/

exports['store'] = {
  setUp: function(done) {
    store = new tiny_store();
    done();
  },
  'set': function(test) {
    test.expect(1);
    // tests here
    store.set('a','a');
    test.equal(store.get('a'), 'a', 'should equal a');
    test.done();
  },
  'get': function(test) {
    test.expect(2);
    store.set('a', {"a": "aaa"});
    test.equal(store.get('a').a, 'aaa', 'should equal');
    store.set('arr', [1,2,3]);
    test.equal(store.get('arr').length, 3,'should equal');
    test.done();
  }
};
