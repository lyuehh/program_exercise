var level = require('level');
var _ = require('underscore');
var db = level('./tangshi.db');
var tangshi = require('./tangshi');

_.each(tangshi, function(value, key) {
    if (key === '') key = 'unknown';
    db.put(key, JSON.stringify(value), function(err) {
        if (err) return console.log('err: %s, key: %s', err, key);
    });
});
