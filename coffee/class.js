var CoffeeCup, a, c;
CoffeeCup = (function() {
  function CoffeeCup() {}
  CoffeeCup.prototype.properties = {
    strength: 'medium',
    cream: false,
    sugar: false
  };
  CoffeeCup.prototype.strength = function(newS) {
    this.properties.strength = newS;
    return this;
  };
  CoffeeCup.prototype.cream = function(newC) {
    this.properties.cream = newC;
    return this;
  };
  CoffeeCup.prototype.sugar = function(newSu) {
    this.properties.sugar = newSu;
    return this;
  };
  return CoffeeCup;
})();
a = new CoffeeCup();
alert(a.properties);
c = new CoffeeCup().strength('a').cream('b').sugar('c');
alert(JSON.stringify(c.properties));