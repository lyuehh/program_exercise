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

    })();
})();
