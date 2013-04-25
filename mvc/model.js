/* (function($) {
    var mod = {};
    mod.load = function(func) {
        $($.proxy(func,this));
    };
    mod.load(function() {
        this.view = $("#view");
    });
    mod.assetsClick = function () {
        alert("hi,it works..");
    };
    mod.load(function() {
        debugger
        this.view.find(".assets").click($).proxy(this.assetsClick,this));
    });
})(jQuery);
*/
/*
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
    mod.fn.include = function(ob) {
        $.extend(this,ob);
    };

    exports.Controller = mod;
})(jQuery,window);
(function($,Controller) {
    var mod = new Controller;
    mod.toggleClass = function(e) {
        this.view.toggleClass("over");
    };
    mod.load(function() {
        this.view = $("#view");
        this.view.mouseover(this.proxy(this.toggleClass));
        this.view.mouseout(this.proxy(this.toggleClass));
    });
})(jQuery,Controller);
*/

var exports = this;
(function($,exports) {
    var mod = {};
    mod.create = function(includes) {
        var result = function() {
            this.init.apply(this,arguments);
        };
        result.fn = result.prototype;
        result.fn.init = function() {};
        
        result.proxy = function(func) { return $.proxy(func,this);};
        result.fn.proxy = result.proxy;

        result.include = function(ob) { $.extend(this.fn,ob);};
        result.extend = function(ob) { $.extend(this,ob);};
        if(includes) result.include(includes);

        return result;
    };
    exports.Controller = mod;
})(jQuery,window);
/*
$(function($) {
    var ToggleView = Controller.create({
        init: function(view) {
            this.view = $(view);
            this.view.mouseover(this.proxy(this.toggleClass));
            this.view.mouseout(this.proxy(this.toggleClass));
        },
        toggleClass: function(e) {
            this.view.toggleClass("over");
        }
    });
    new ToggleView("#view");
});
*/
/*
var exports = this;
$(function($) {
    exports.SearchView = Controller.create({
        elements: {
            "input[type=search]": "searchInput",
            "form": "searchForm"
        },
        init: function(element) {
            this.el = $(element);
            this.resreshElements();
            this.searchForm.submit(this.proxy(this.search));
        },
        search: search() {
            console.log("Searching:",this.searchInput.val());
        },

        // Private
        $: function(selector) {
            return $(selector,this.el);
        },
        resreshElements: function() {
            for(var key in this.elements) {
                this[this.elements[key]] = this.$(key);
            }
        }
    });
    new SearchView("#users");
});
*/
$(function($) {
    exports.SearchView = Controller.create({
        elements: {
            "input[type=search]": "searchInput",
            "form": "searchForm"
        },
        events: {
            "submit form": "search"
        },
        init: function(element) {
            this.el = $(element);
            this.resreshElements();
            this.delegateEvents();
            //this.searchForm.submit(this.proxy(this.search));
        },
        search: function(e) {
            alert("Searching:"+this.searchInput.val());
            return false;
        },

        // Private
        $: function(selector) {
            return $(selector,this.el);
        },
        resreshElements: function() {
            for(var key in this.elements) {
                this[this.elements[key]] = this.$(key);
            }
        },
        eventSplitter: /^(\w+)\s*(.*)$/,
        delegateEvents: function() {
            for(var key in this.events) {
                var methodName = this.events[key];
                var method = this.proxy(this[methodName]);

                var match = key.match(this.eventSplitter);
                var eventName = match[1],selector = match[2];

                if (selector === '') {
                    this.el.bind(eventName,method);
                } else {
                    this.el.delegate(selector,eventName,method);
                }
            }
        }
    });
    new SearchView("#users");
});
