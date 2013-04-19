function myobject() {
  this.value = 5;
}
myobject.prototype.add = function(){
  this.value++;
};

var o = new myobject();
console.log(o.value); // o.value = 5

o.add();
console.log(o.value); // o.value = 6

function objectchanger(fnc) {
  fnc(); // runs the function being passed in
}
objectchanger(o.add);
console.log(o.value); // sorry, still just 6

function objectchanger2(obj)
{
	obj.add(); // runs the method of the object being passed in
}
objectchanger2(o);
console.log(o.value); // the value is now 7

function objectchanger3(fnc, obj) {
  fnc.call(obj);
}
objectchanger3(o.add, o);
console.log(o.value); // the value is now 8
