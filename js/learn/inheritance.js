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

    // 6.3.4 prototype inheritance
    (function() {
        function object(o) {
            function F() {}
            F.prototype = o;
            return new F();
        }
        var person = {
            name: "person1",
            friends: ['a', 'b', 'c']
        };
        var p1 = object(person);
        p1.name = 'p1';
        p1.friends.push('d');

        var p2 = object(person);
        p2.name = 'p2';
        p2.friends.push('e');
        console.log(person.friends);
        console.log(p1.friends);
        console.log(p2.friends);

        // like Object.create() in es5
    })();

    // 6.3.5 parasitic inheritance
    (function() {

        function object(o) {
            function F() {}
            F.prototype = o;
            return new F();
        }
        function createAnother(original) {
            var clone = object(original);
            clone.sayHi = function() {
                console.log('hi');
            };
            return clone;
        }
        var person = {
            name: "person",
            friends: ['a', 'b',' c']
        };
        var p1 = createAnother(person);
        p1.sayHi();
    })();

    // 6.3.6 parasitic combination inheritance
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
        SubType.prototype.constructor = SubType;
        SubType.prototype.sayAge = function() {
            console.log(this.age);
        };
    })();

    // 6.3.6 2
    (function() {
        function object(o) {
            function F() {}
            F.prototype = o;
            return new F();
        }
        function inheritPrototype(subtype, supertype) {
            var prototype = object(supertype.prototype);
            prototype.constructor = subtype;
            subtype.prototype = prototype;
        }
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
        inheritPrototype(SubType, SuperType);
        SubType.prototype.sayAge = function() {
            console.log(this.age);
        };
    })();


})();
