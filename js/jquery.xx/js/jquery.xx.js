+function($) {
    'use strict';

    // constructor
    function Abc(element, options) {
        this.$body = $('body');
        this.$el = $(element);
        this.options = $.extend({}, Abc.DEFAULTS, options);

        this.fun1();
        this.fun2();
    }

    // default options
    Abc.DEFAULTS = {
        x1: '000'
    };
    window.Abc = Abc;


    Abc.prototype.fun1 = function() {
        // todo
        console.log('fun1....');
    }

    Abc.prototype.fun2 = function() {
        // todo
        console.log('fun2....');
    }


    // to jquery plugin
    $.fn.abc = function(option) {
        return this.each(function () {
            var $this = $(this),
                data = $this.data('abc'),
                options = typeof option == 'object' && option
            if (!data) $this.data('abc', (data = new Abc(this, options)))
                if (typeof option == 'string') data[option]()
        })
    }
    $.fn.abc.Constructor = Abc;

}(jQuery)

// test
// $('.xx').abc({
//     'x1': 'xx1',
//     'x2': 'xx2'
// });
