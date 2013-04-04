function PERSON(){
    this.say = function(){
      alert( "i'm person")
    };
    this.super = function(){
         this.o_say = this.say;
    }
}

function MAN(){
    this.super();
    this.say = function(){
      this.o_say();
      alert( "I'm a MAN");
   }
}
MAN.prototype = new PERSON();
MAN.prototype.constructor = MAN;
var m = new MAN();

m.say();
super()
