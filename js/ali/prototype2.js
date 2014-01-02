function Foo() {}                      //构造函数

Foo.prototype.say = function () {
    console.log("I'm a Foo!");
};                                     //原型对象上添加一个say方法
var foo1 = new Foo();                    //生成一个Foo实例
foo1.say();                            //继承了原型对象上的say方法,输出"I'm a Foo!"
Foo.prototype = {};                     //原型对象指向一个空对象
foo1.say(); // 输出
foo1.__proto__ = {};
// foo1.say(); // ERROR
