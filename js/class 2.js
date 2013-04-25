var Animal = function() {};
Animal.prototype.breath = function(){
	console.log("breath");
};

var Dog = function(){};

Dog.prototype = new Animal();

Dog.prototype.wag = function() {
	console.log("wag tail");
};

var dog = new Dog();
dog.wag();
dog.breath();


var Class = function(parent){
	var klass = function() {
		this.init.apply(this,arguments);
	};
	
	if(parent) {
		var subclass = function() {};
		subclass.prototype = parent.prototype;
		klass.prototype = new subclass;
	}
	
	klass.prototype.init = function(){};
	
	klass.fn = klass.prototype;
	klass.fn.parent = klass;
	klass._super_ = klass.__proto__;
	
	klass.extend = function(obj){
		var extended = obj.extended;
		for(var i in obj) {
			klass[i] = obj[i];
		}
		if(extended) extended(klass);
	};
	klass.include = function(obj) {
		var included = obj.included;
		for(var i in obj) {
			klass.fn[i] = obj[i];
		}
		if(included) included(klass);
	};
	
	klass.proxy = function() {
		var self = this;
		return(function() {
			return func.apply(self,arguments);
		});
	};
	klass.fn.proxy = klass.proxy;
	return klass;
}

var Button = new Class();
Button.include({
	init: function(element) {
		this.element = jQuery(element);
		this.element.click(this.proxy(this.click));
		//with bind
		//this.element.click(this.click.bind(this));
	},
	click: function() {}
});

if(!Function.prototype.bind) {
	Function.prototype.bind = function(obj) {
		var slice = [].slice,
			args = slice.call(arguments,1),
			self = this,
			nop = function() {},
			bound = function() {
				return self.apply(this instanceof nop ? this : (obj || {}),
					args.concat(slice.call(arguments)));
			};
		nop.prototype = self.prototype;
		bound.prototype = new nop();
		return bound;
	};
}

//Private Functions
var Person = function() {};

(function() {
	var findById = function() {};
	Persion.find = function(id) {
		if(typeof id == 'integer') {
			return findById(id);
		}
	};
})();
//Export to window
(function(exports) {
	var foo = "bar";
	
	exports.foo = foo;
})(window);

//Delegating events
list.addEventListener('click',funtion(e) {
	if(e.currentTarget.tagName == "li") {
		/**/
		return false;
	}
},false)

//Custom Events
$(".class").bind("foo.widget",function(event,number){
	console.log(number);
});
$(".class").trigger("foo.widget",5);

//Events
jQuery.fn.tabs = function(control){
var element = $(this);
	control = $(control);
	
	element.delegate("li","click",function(){
		var tabName = $(this).attr("data-tab");
		element.trigger("change.tabs",tabName);
	});
	
	element.bind("change.tabs",function(e,tabName){
		element.find("li").removeClass("active");
		element.find(">[data-tab='" + tabName + "']").addClass("active");
	});
	
	element.bind("change.tabs",function(e,tabName){
		control.find(">[data-tab]").removeClass("active");
		control.find(">[data-tab='" + tabName + "']").addClass("active");
	});
	
	var firstName = element.find("li:first").attr("data-tab");
	element.trigger("change.tabs",firstName );
};

//use
$("ul#tabs").tabs("#tabsContent");
//$("#tab").trigger("change.tabs","users");

// and 
$("#tabs").bind("change.tabs",function(e,tabName){
	window.location.hash = tabName;
});
$(window).bind("hashchange",function(){
	var tabName = window.location.hash.slice(1);
	$("#tabs").trigger("change.tabs",tabName);
});
//Publish/Subscribe
var PubSub = {
	subscribe: function(ev,callback) {
		var calls = this._callbacks || (this._callbacks = {});
		(this._callbacks[ev] || (this._callbacks[ev] = [])).push(callback);
		return this;
	},
	publish: function() {
		var args = Array.prototype.slice.call(arguments,0);
		var ev = args.shift();
		
		var list,calls,i,l;
		if(!(calls = this._callbacks)) return this;
		if(!(list = this._callbacks[ev])) return this;
		
		for(i = 0,l = list.length;i<l;i++) {
			list[i].apply(this,args);
		}
		return this;
	}
};
PubSub.subscribe("wem",function() {
	alert("wem!");
});
PubSub.publish("wem");

//$.subscribe
(function($) {
	var o = $({});
	$.subscribe = function() {
		o.bind.apply(o,arguments);
	};
	$.unsubscribe = function() {
		o.unbind.apply(o,arguments);
	};
	$.publish = function() {
		o.trigger.apply(o,arguments);
	};
})(jQuery);

$.subscribe("/some/topic",function(event,a,b,c) {
	console.log(event.type,a+b+c);
});
$.publish("/some/topic","a","b","c");

//Object.create
if(typeof Object.create != "function") {
	Object.create = function(o) {
		function F(){};
		F.prototype = o;
		return new F();
	}
}

//Model
var Model = {
	inherited: function() {},
	created: function() {},
	
	prototype: {
		init: function() {}
	},
	
	create: function() {
		var object = Object.create(this);
		object.parent = this;
		object.prototype = object.fn = Object.create(this.prototype);
		
		object.created();
		this.inherited(object);
		return object;
	},
	
	init: function() {
		var instance = Object.create(this.prototype);
		instance.parent = this;
		instance.init.apply(instance,arguments);
		return instance;
	},
	
	//extend
	extend: function(o) {
		var extended = o.extended;
		jQuery.extend(this,o);
		if(extended) extend(this);
	},
	//include
	include: function(o) {
		var included = o.included;
		jQuery.extend(this.prototype,o);
		if(included) included(this);
	}
};

var Assert = Model.create();
var User = Model.create();
var user = User.init();

//Add object properties
jQuery.extend(Model,{
	find: function(){}
});

//Add instance properties
jQuery.extend(Model.prototype,{
	init: function(atts) {
		if(atts) this.load(atts);
	},
	load: function(attributes) {
		for(var name in attributes) {
			this[name] = attributes[name];
		}
	}
});

//with extend & include are in Model
//then before will be changed to this
Model.extend({
	find: function() {}
});
Model.include({
	init: function(atts) {
		if(atts) this.load(atts);
	},
	load: function(attributes) {
		for(var name in attributes) {
			this[name] = attributes[name];
		}
	}
});
// sample
var asset = Asset.init({name: "foo.png"});

// An object of saved asserts
Model.records = {};
Model.include({
	newRecord: true,
	create: function() {
		this.newRecord = false;
		this.parent.records[this.id] = this;
	},
	destroy: function() {
		delete this.parent.records[this.id];
	}
});
Model.include({
	update: function() {
		this.parent.records[this.id] = this;
	}
});
Model.include({
	save: function() {
		this.newRecord ? this.create() : this.update();
	}
});
Model.extend({
	find: function(id) {
		return this.records[id] || throw("Unknown record");
	}
});
var asset = Asset.init();
asset.name = "same, same";
asset.id = 1;
asset.save();

var asset2 = Asset.init();
asset2.name = "but different";
asset2.id = 2;
asset2.save();

assertEqual(Asset.find(1).name,"same, same");
asset2.destroy();

// math.guid
Math.guid = function() {
	return 'xxxxxxxx-xxxx-4xxxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g,function(c) {
		var r = Math.random()*16|0,v = c == 'x' ? r : (r&0x3 | 0x8);
		return v.toString(16);
	}).toUpperCase();
};

(function($) {
	var mod = {};
	mod.load = function(){
		$($.proxy(func,this));
	};
	mod.load(function(){
		this.view = $("#view");
	});
	mod.assetsClick = function(e) {
		// Process click
	};
	mod.load(function() {
		this.view.find(".assets").click(
			$.proxy(this.assetsClick,this)
		);
	});
})();

(function($,exports) {
	var mod = function(includes) {
		if(includes) this.include(includes);
	};
	mod.fn = mod.prototype;
	
	mod.fn.proxy = function(func) {
		return $.proxy(func,this);
	};
	
	mod.fn.load = function(func) {
		$(this.proxy(func));
	};
	mod.fn.include = function   (ob) {
        $.extend(this,ob);
    };
    exports.Controller = mod;
})(jQuery,window);

// example
(function($,Controller) {
    var mod = New Controller;
    mod.toggleClass = function(e) {
        this.view.toggleClass("over",e.data);
    };
    mod.load(function() {
        this.view = $("#view");
        this.view.mouseover(this.proxy(this.toggleClass),true);
        this.view.mouseout(this.proxy(this.toggleClass),true);
    });
})(jQuery,Controller);

Controller.fn.unload = function(func) {
    jQuery(window).bind("unload",this.proxy(func));
};
var mod = new Controller;
mod.include(StateMachine);

(function($) {
        var mod = {};
        mod.create = function(includes) {
            var 
        }
})(jQuery);


















