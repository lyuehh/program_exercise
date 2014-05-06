// before

function show1(type) {
	// something need to be done...
	var ver;
	if (type === "aa") {
		ver = 'aa';
		console.log('type is aa');
		// other staff...
	} else if (type === 'bb') {
		console.log('type is bb');
		ver = 'bb';
		// other staff...
	}
	console.log(ver);
	//...
}

show1('aa');
show1('bb')

console.log();

// after

function show2(type, cb) {
	// something need to be done
	console.log('type is ' + type);
	cb(type);
}

show2('aa', function(t) {
	console.log(t);
})
show2('bb', function(t) {
	console.log(t);
})
