var foo = 1;
function main(){
    // 通过 new main()调用时, 内部的this会指向新创建的对象, 现在已经有this了,是个空对象
    console.log(foo); // 这里的foo相当于是this.foo, 是undefined
    var foo = 2; // 这是个局部变量, 如果是 this.foo = 2, 那么下面一行就是2了
    console.log(this.foo); // this是空对象, 还是undefined
    this.foo = 3; // 这里给this.foo赋值, this = {foo: 3};
}
var m1 = main();
console.log('----');
var m2 = new main();
console.log(m2.foo); // 3, 因为上面 this.foo = 3 赋值了
