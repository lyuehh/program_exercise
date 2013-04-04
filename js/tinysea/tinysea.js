(function() {

	var REQUIRE_RE = /(?:^|[^.$])\brequire\s*\(\s*(["'])([^"'\s\)]+)\1\s*\)/g;

	var util = {};

	util.isString = function(val) {
		return toString.call(val) === '[object String]';
	};

	util.isFunction = function(val) {
		return toString.call(val) === '[object Function]';
	};

	util.isRegExp = function(val) {
		return toString.call(val) === '[object RegExp]';
	};

	util.isObject = function(val) {
		return val === Object(val);
	};

	util.isArray = Array.isArray ||
	function(val) {
		return toString.call(val) === '[object Array]';
	};

	util.removeComments = function(code) {
		return code.replace(/^\s*\/\*[\s\S]*?\*\/\s*$/mg, '').replace(/^\s*\/\/.*$/mg, ''); // line comments
	};

	util.parseDependencies = function(code) {
		var ret = [],
			match;

		code = this.removeComments(code);
		REQUIRE_RE.lastIndex = 0;

		while((match = REQUIRE_RE.exec(code))) {
			if(match[2]) {
				ret.push(match[2]);
			}
		}
		return util.unique(ret);
	};

	var tinysea = {};
	tinysea.cache = [];

	tinysea.define = function(id, deps, factory) {
		var argsLength = arguments.length;

		// define(factory)
		if(argsLength === 1) {
			factory = id;
			id = undefined;
		}
		// define(id || deps, factory)
		else if(argsLength === 2) {
			factory = deps;
			deps = undefined;

			// define(deps, factory)
			if(util.isArray(id)) {
				deps = id;
				id = undefined;
			}
		}

		// Parses dependencies.
		if(!util.isArray(deps) && util.isFunction(factory)) {
			deps = util.parseDependencies(factory.toString());
		}

		var meta = {
			id: id,
			dependencies: deps,
			factory: factory
		};
		tinysea.cache.push(meta);
		factory(this.require,[],module);
		//console.log(factory.toString());
		console.log(meta);
	};
	tinysea.require = function(id) {

		debugger
		var doc = document,
			script = document.createElement('script');
		script.type = 'text/javascript';
		script.src = id;
		var head = doc.getElementsByTagName("head")[0];
		script.onload = script.onreadystatechange = function(_, isAbort) {
			if(isAbort || !script.readyState || /loaded|complete/.test(script.readyState)) {
				script.onload = script.onreadystatechange = null;
				if(head && script.parentNode) {
					head.removeChild(script);
				}
				script = undefined;
			}
		};
		head.insertBefore(script, head.firstChild);
		console.log(this.cache);
		//return this.cache[]
	};
	tinysea.use = function (id) {
		this.require(id);
		console.log(id);
	};

	window.tinysea = tinysea;
	window.define = tinysea.define;
	window.require = tinysea.require;
})();