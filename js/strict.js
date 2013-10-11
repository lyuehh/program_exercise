(function() {
    'use strict';

    var a = 1;
    // delete a; // Error

    var b = 0999;
    //var c = 0123; // Error

    var d = {get a() {}};
    //d.a = 1; // Error

    //with({}); // Error

    //e = 1; // Error

    {
        var f = function() {};
        //function ff() {} // Error
    }

    console.log(this); // undefined, not global

    //var g = {a: 1, a: 2}; // Error

    var h = 1, i = 1;
    eval('var h = 2');
    var global = new Function("return this")();
    global.eval('var i = 2');
    console.log(h); // 1
    console.log(i); // 1 ?

    function j() {
        //return arguments.callee; // Error, caller, callee can not be used
    }
    j();
})();
