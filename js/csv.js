var _ = require('underscore');
var fs = require('fs');

var d = fs.readdirSync('.');
// console.log(d);
d = _.filter(d, function(i) {
	return i.indexOf('json') !== -1;
});
// console.log(d);

var o = 'all.csv';
var header = 'id,date,red1,red2,red3,red4,red5,red6,blue';
fs.writeFileSync(o, header);
var str = header + "\n";

_.each(d, function(i) {
	var fi = require('./' + i);
	_.each(fi, function(fii) {
		var r = fii.red.split(' ');
		var r1 = r[0];
		var r2 = r[1];
		var r3 = r[2];
		var r4 = r[3];
		var r5 = r[4];
		var r6 = r[5];
		str = str + fii.id + ',' + fii.date + ',' + r1 +
			',' + r2 + ',' + r3 + ',' + r4 + ',' + r5 + ',' + r6 + ',' + fii.blue + '\n';
		// console.log(fii.red);
	});
	// str = 
	// console.log(fi);
});
fs.writeFileSync('a.csv', str);
