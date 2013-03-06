function Animal(name) {
  this.name = name;
}

Animal.prototype.say = function() {
  console.log('Name: ' + this.name);
};
Animal.a = 'a';
Animal.b = 'b';

var a1 = new Animal('a1');
a1.say();

var extend = function (Child, Parent) {
  for (var i in Parent) {
    if(Parent.hasOwnProperty(i)) {
      Child[i] = Parent[i];
      console.log('a: ' + Parent[i]);
    }
  }
  function F() {};
  F.prototype = Parent.prototype;
  Child.prototype = new F();
  Child.prototype.constructor = Child;
  Child.__super__ = Parent.prototype;
};

function Cat(name) {
  this.name = name;
}
extend(Cat, Animal);
Cat.prototype.say = function() {
  console.log('xx: ' + this.name);
};
Cat.prototype.haha = function() {
  console.log('haha: ' + this.name);
};

//Cat.prototype = new Animal();
//Cat.prototype = Animal.prototype;


var c1 = new Cat('c1');
c1.say();

function BadCat(name) {
  this.name = name;
}

BadCat.prototype = Cat.prototype;
var bc1 = new BadCat('bc1');
bc1.say();
