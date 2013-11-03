(function() {
    'use strict';

    // 6.3.1 prototype chaining
    // bad: if the super object's attribute is ref, like array, then it share in all sub object.
    // bad: you can't pass arguments into the supertype constructer when sub type instance is being created.
    (function() {
        function SuperType() {
            this.property = true;
        }
        SuperType.prototype.getSuperValue = function() {
            return this.property;
        };
        function SubType() {
            this.subproperty = false;
        }
        SubType.prototype = new SuperType();
        SubType.prototype.getSubValue = function() {
            return this.subproperty;
        };
        var instance = new SubType();
        console.log(instance.getSuperValue());
        console.log(instance.getSubValue());

        // instanceof
        console.log(instance instanceof SubType);
        console.log(instance instanceof SuperType);
        console.log(instance instanceof Object);

        // isPrototypeOf
        console.log(Object.prototype.isPrototypeOf(instance));
        console.log(SubType.prototype.isPrototypeOf(instance));
        console.log(SuperType.prototype.isPrototypeOf(instance));

        // add new method to a prototype, make sure it after the prototype has been assigned
        // and don't create prototype literally, because it will overwriting the chain.
    })();

    // 6.3.2 constructor stealing
    // bad: function must define in constructer, no function reuse
    // bad: methods defined on the supertype's prototype are note accessible on the subtype
    (function() {
        function SuperType() {
            this.colors = ['red', 'blue', 'green'];
        }
        function SubType() {
            SuperType.call(this);
        }

        var i1 = new SubType();
        i1.colors.push('black');
        console.log(i1.colors);

        var i2 = new SubType();
        console.log(i2.colors);

        // passing arguments
        function SuperType2(name) {
            this.name = name;
        }
        function SubType2() {
            SuperType2.call(this, 'name11');
            this.age = 20;
        }
        var i3 = new SubType2();
        console.log(i3.name);
        console.log(i3.age);
    })();

    // 6.3.3 combination inheritance
    (function() {
        function SuperType(name) {
            this.name = name;
            this.colors = ['red', 'blue', 'green'];
        }
        SuperType.prototype.sayName = function() {
            console.log(this.name);
        };
        function SubType(name, age) {
            SuperType.call(this, name);
            this.age = age;
        }
        SubType.prototype = new SuperType();
        SubType.prototype.sayAge = function() {
            console.log(this.age);
        };

        var i1 = new SubType('i1', 10);
        i1.colors.push('black');
        console.log(i1.colors);
        i1.sayName();
        i1.sayAge();

        var i2 = new SubType('i2', 20);
        console.log(i2.colors);
        i2.sayName();
        i2.sayAge();
    })();

})();
