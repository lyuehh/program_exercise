var fs = require('fs');
var _ = require('underscore');

var shuoshuo = [];

for (var i=1; i<=15; i++) {
    var json = require('./' + i + '.json');
    var msglist = json.msglist;
    _.each(msglist, function(i) {
        var c = i.content;
        var t = i.created_time;
        var s = {
            content: c,
            time: t
        };
        shuoshuo.push(s);
    });
}

console.log(JSON.stringify(shuoshuo, null, 2));