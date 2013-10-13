Function.prototype.before = function(func){
    var __self = this;
    var __func = function(){
            if(func.apply(this, arguments) === false){
                        return false;
                    }
            return __self.apply(this, arguments);
        }
    return __func;
}

var test = function(){
    console.log('current===>' + arguments[0]);
}

test = test.before(function(d,e){ 
   if(typeof d === 'number'){
           return true;
      }
   return false;
});
test(2)
test("1");
