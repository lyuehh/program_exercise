//'use strict';
var global = this;

(function() {
    'use strict';

    // object
    (function() {
        var person = {};
        person.name = 'www';
        person.age = 24;
        person.job = 'developer';
        person.sayName = function() {
            console.log(this.name);
        };
    })();


    // object2
    (function() {
        var person = {
            name: 'www',
            age: 24,
            job: 'developer',
            sayName: function () {
                console.log(this.name);
            }
        };
    })();

    // object data attribute

    (function() {
        // Configureable, Enumerable, Writable, Value
        var person = {};
        Object.defineProperty(person, "name", {
            writable: false, // 能否修改属性的值
            value: 'www'
        });

        var person2 = {};
        Object.defineProperty(person2, "name", {
            configureable: false, // 能否删除属性, 能否修改属性的特性, 能否把属性修改为访问器属性
            value: 'www'
        });

        console.log(person.name);
        // person.name = 'haha'; // error
        console.log(person.name); // not changed

        console.log(person2.name);
        //delete person2.name; // error
        console.log(person2.name); // still exists

        Object.defineProperty(person2, 'name', {
            configureable: true,
            value: 'www' // if change here, then will throw an error
        });

        var person3 = {};

        Object.defineProperty(person3, 'name', {});
        // person3.name = '123'; // error
        //delete person3.name;
        console.log(person3.name); // undefined, because writable, enumerable, configureable is false by default
    })();

    // object accessor attribute
    (function() {
        var book = {
            _year: 2004,
            edition: 1
        };
        Object.defineProperty(book, 'year', {
            get: function () {
                return this._year;
            },
            set: function (newValue) {
                if (newValue > 2004) {
                    this._year = newValue;
                    this.edition += (newValue - 2004);
                }
            }
        });

        book.year = 2006;
        console.log(book.edition);
    })();

    // __defineGetter__
    (function () {

        var book = {
            _year: 2004,
            edition: 1
        };

        book.__defineGetter__('year', function () {
            return this._year;
        });

        book.__defineSetter__('year', function (newValue) {
            if (newValue > 2004) {
                this._year = newValue;
                this.edition += (newValue - 2004);
            }
        });

        book.year = 2006;
        console.log(book.edition);
    })();

    // defineproPerties
    (function () {
        var book = {};

        // 2个数据属性 _year, edition, 1个访问器属性, year
        Object.defineProperties(book, {
            _year: {
                value: 2004,
                //configureable: true,
                writable: true // 这里不写的话, 3个配置特性默认都是false
            },
            edition: {
                value: 1,
                writable: true,
                enumerable: true
            },
            year: {
                get: function () {
                    return this._year;
                },
                set: function (newValue) {
                    if (newValue > 2004) {
                        this._year = newValue;
                        this.edition += (newValue - 2004);
                    }
                },
                enumerable: true, // 可以和get set 一起用
                configureable: false
                // writable: false // 这个不可以和get set 一起用
                // A property cannot both have accessors and be writable or have a value
            }
        });

        book.year = 2006;
        console.log(book.edition);

        // getOwnPropertyDescriptor()
        var descriptor = Object.getOwnPropertyDescriptor(book, '_year');
        console.log(descriptor);

        var descriptor_year = Object.getOwnPropertyDescriptor(book, 'year');
        console.log(descriptor_year);
        console.log(descriptor_year.set.toString());

        for (var i in book) {
            console.log(i);
        }
    })();


    // create object
    // 6.2.1, page 144(cn) 180(en), factory pattern
    // adv: solved the problem of creating multiple similar objects
    // shortcoming: didn't address the issus of object identification (what type of object an object it)
    (function() {
        function createObject(name, age, job) {
            var o = {};
            o.name = name;
            o.age = age;
            o.job = job;
            o.sayName = function () {
                console.log(this.name);
            };
            return o;
        }

        var p1 = createObject('p1', 12, 'job1');
        var p2 = createObject('p2', 22, 'job2');
    })();


    // 6.2.2, page 181(en) 145(cn), constructor pattern
    // adv: can get type of a object
    // shortcoming: each object has unique function, which is not necessary
    (function() {
        function Person(name, age, job) {
            this.name = name;
            this.age = age;
            this.job = job;
            this.sayName = function () {
                console.log(this.name);
            };
        }

        var p1 = new Person('p1', 12, 'job1');
        var p2 = new Person('p2', 22, 'job2');
        console.log(p1.constructor); // Person
        console.log(p1 instanceof Object); // true
        console.log(p1 instanceof Person); // true

        // call as function
        // Person('a1', 111, 'global job'); // do not do this
        // console.log(global.sayName());
    })();

    // 6.2.3 prototype pattern
    // page 184(en), 147(cn)
    // bad: if the attribute in prototype is ref, like array, then this will be share in all instances,
    // if you don't want this, then do not use this
    (function() {
        function Person() {}
        Person.prototype.name = 'n1';
        Person.prototype.age = 100;
        Person.prototype.job = 'job1';
        Person.prototype.sayName = function () {
            console.log(this.name);
        };
        var p1 = new Person();
        console.log(p1.name);

        // isPrototypeOf es3
        console.log(Person.prototype.isPrototypeOf(p1));

        // getPrototypeOf es5
        console.log(Object.getPrototypeOf(p1) === Person.prototype);

        // hasOwnProperty es3
        var p2 = new Person();
        console.log(p2.hasOwnProperty('name'));
        var p3 = new Person();
        p3.name = 'p3';
        console.log(p3.hasOwnProperty('name'));

        // in es3
        console.log('name' in p2);
        console.log('name' in p3);

        // ie8及以前的版本中，屏蔽不可枚举属性的实例属性不会出现在for in循环中
        // 改bug 影响 hasownproperty, propertyIsEnumerable(), toLocaleString(), toString(), valueOf()
        var o = {
            toString: function() {
                return 'a object';
            }
        };
        for (var i in o) {
            if (i == 'toString') {
                console.log('found toString'); // not show in ie8 及以前版本
            }
        }

        // Object.keys() es5
        // Object.getOwnPropertyNames() es5
    })();

    // alternate prototype syntax
    // page 193(en) 154(cn)
    (function() {
        function Person() {}

        Person.prototype = {
            name: "xx",
            age: 10,
            job: "aaa"
        };
        var p1 = new Person();
        console.log(p1.constructor === Person); // false, if you need this, try

        function Person2() {}
        Person.prototype = {
            constructor: Person2,
            name: "xx",
            age: 10,
            job: "aaa"
        };
        var p2 = new Person2();
        console.log(p2.constructor === Person2); // true

        // but with this, it's constructor [[ Enumerable ]] will be true, but by default, it's false
        // but use es5, you can define this with
        Object.defineProperty(Person2.prototype, 'constructor', {
            enumerable: false,
            value: Person2
        });

        // rewrite protype, will be error
        function Person3() {}

        var p3 = new Person3();
        Person3.prototype = {
            constructor: Person3,
            name: "xx",
            age: 11,
            sayName: function() {
                console.log(this.name);
            }
        };
        //p3.sayName(); // Error, p3内部的prototype的指针被重写了。
        var p4 = new Person3();
        p4.sayName(); // this is ok, xx
    })();

    // combineation constructor and prototype
    // page 197(en) 159(cn)
    (function() {
        function Person(name, age, job) {
            this.name = name;
            this.age = age;
            this.job = job;
            this.friends = ['a', 'b'];
        }

        Person.prototype.sayName = function() {
            console.log(this.name);
        };

        var p1 = new Person();
        var p2 = new Person();
        console.log(p1.friends === p2.friends); // false

        // dynamic prototype pattern
        function Person2(name, age, job) {
            this.name = name;
            this.age = age;
            this.job = job;

            if (typeof this.sayName !== 'function') {
                Person2.prototype.sayName = function() {
                    console.log(this.name);
                };
            }
        }

        var p3 = new Person2('p2');
        p3.sayName(); // log p2
    })();

    // 6.2.6 parasitic constructor pattern
    // not recommend
    (function() {
        function Person(name, age, job) {
            var o = {};
            o.name = name;
            o.age = age;
            o.job = job;
            o.sayName = function() {
                console.log(this.name);
            };
            return o;
        }
        var p1 = new Person('person1', 10, 'haha');
        p1.sayName();
    })();

    // 6.2.7 durable constructor pattern
    (function() {
        function Person(name, age, job) {
            var o = {};
            var name1 = name;
            var age1 = age;
            var job1 = job;
            o.sayName = function() {
                console.log(name1);
            };
            return o;
        }

        // var p1 = Person('p1', 10, 'xx');
        // p1.sayName();

        // var p2 = new Person('p1', 10, 'xx');
        // p2.sayName();
    })();

})();
